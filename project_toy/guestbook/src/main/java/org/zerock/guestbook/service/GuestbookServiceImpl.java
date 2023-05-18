package org.zerock.guestbook.service;

import com.querydsl.core.BooleanBuilder;
import com.querydsl.core.types.dsl.BooleanExpression;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.zerock.guestbook.dto.GuestbookDTO;
import org.zerock.guestbook.dto.PageRequestDTO;
import org.zerock.guestbook.dto.PageResultDTO;
import org.zerock.guestbook.entity.Guestbook;
import org.zerock.guestbook.entity.QGuestbook;
import org.zerock.guestbook.mapper.GuestbookMapper;
import org.zerock.guestbook.repository.GuestbookRepository;

import java.util.List;
import java.util.Optional;
import java.util.function.Function;

@Service
@Log4j2
@RequiredArgsConstructor // 생성자를 통한 자동주입
public class GuestbookServiceImpl implements GuestbookService {
    private final GuestbookRepository repository; // @RequiredArgsConstructor로 자동주입. @AutoWired + final 삭제 로 대체 가능

    private final GuestbookMapper guestbookMapper; // mapper 자동주입

    @Override
    public Long register(GuestbookDTO dto) {
        log.info("DTO------------------------------");
        log.info(dto);

        Guestbook entity = dtoToEntity(dto); // dto를 Entity로 변환
        log.info(entity);
        repository.save(entity); // save 메소드 매개변수로 entity 넣음
                                 // save 메소드는 기본 메소드라 repository에 코딩할 필요 없음
        return entity.getGno();
    }

    @Override
    public PageResultDTO<GuestbookDTO, Guestbook> getList(PageRequestDTO requestDTO) {
        Pageable pageable = requestDTO.getPageable(Sort.by("gno").descending());
        BooleanBuilder booleanBuilder = getSearch(requestDTO); // 검색 조건 처리(getSearch는 service 메소드 아니고 Impl 하단에 별도로 작성한 메소드)
        Page<Guestbook> result = repository.findAll(booleanBuilder, pageable); // service에서 repository 호출 (예전에 mapper 호출한 것처럼)
        Function<Guestbook, GuestbookDTO> fn = (entity -> entityToDto(entity)); // // Querydsl 사용, 어떤 entity 값을 하나 받아서 dto로 변환하여 return (GuestbookDTO 타입으로 반환)
        return new PageResultDTO<>(result, fn); // 위에서 만든 Function을 PageResultDTO로 전달
    }

    public GuestbookDTO read(Long gno) {
        // Optional<Guestbook> result = repository.findById(gno); // result의 Type : entity
        // return result.isPresent() ? entityToDto(result.get()) : null; // 3항 연산자 - result가 존재하면 result를 dto로 바꿔서 보냄

        // repository로 구현한 read -> MyBatis mapper로 바꿔서 코딩
        GuestbookDTO guestbookDTO = guestbookMapper.read(gno);
        return guestbookDTO;
    }

    @Override
    public void modify(GuestbookDTO dto) {
        Optional<Guestbook> result = repository.findById(dto.getGno());
        if(result.isPresent()) {
            Guestbook entity = result.get(); // result.get() : result에서 Guestbook을 꺼내온다
            entity.changeTitle(dto.getTitle());
            entity.changeContent(dto.getContent());
            repository.save(entity); // 매개변수는 dto로 받았지만 반환은 entity로 한다
        }
    }

    @Override
    public void remove(Long gno) {
        repository.deleteById(gno);
    }


    private BooleanBuilder getSearch(PageRequestDTO requestDTO) {
        String type = requestDTO.getType();
        BooleanBuilder booleanBuilder = new BooleanBuilder();
        QGuestbook qGuestbook = QGuestbook.guestbook; // querydsl이 자동생성한 QGuestbook에서 guestbook 불러옴

        String keyword = requestDTO.getKeyword();
        BooleanExpression expression = qGuestbook.gno.gt(0L); // gno가 0보다 큰 경우만 불러오도록 WHERE 조건절 설정 => 인덱스 사용하기 위한 설정
        booleanBuilder.and(expression); // and() : expression(gno > 0) 보다 선행되는 조건이 있으면 and 붙이고, 없으면 안 붙임

        // 검색 조건이 없는 경우
        if(type == null || type.trim().length() == 0) {
            return booleanBuilder;
        }

        // 검색 조건이 있는 경우
        BooleanBuilder conditionBuilder = new BooleanBuilder();

        if(type.contains("t")) {
            conditionBuilder.or(qGuestbook.title.contains(keyword));
        }
        if(type.contains("c")) {
            conditionBuilder.or(qGuestbook.content.contains(keyword));
        }
        if(type.contains("w")) {
            conditionBuilder.or(qGuestbook.writer.contains(keyword));
        }

        //  모든 조건 통합 (gno > 0 AND ( OR t/c/w LIKE '% 키워드 %' ) )
        booleanBuilder.and(conditionBuilder);

        return booleanBuilder;
    }

}
