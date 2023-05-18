package org.zerock.guestbook.dto;

import lombok.Data;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;
import java.util.function.Function;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

@Data // PageResultDTO : 결과를 화면까지 전달하는 DTO
public class PageResultDTO<DTO, EN> { // 다양한 상황에서 사용하기 위해서 타입을 제네릭으로 처리 <DTO, Entity>
    private List<DTO> dtoList;  // DTO 리스트
    private int totalPage; // 총 페이지 번호
    private int page; // 현재 페이지 번호
    private int size; // 목록 사이즈
    private int start, end; // 시작 페이지 번호, 끝 페이지 번호
    private boolean prev, next; // 이전, 다음
    private List<Integer> pageList; // 페이지 번호 목록

    public PageResultDTO(Page<EN> result, Function<EN, DTO> fn) { // fn = Function 참조값
        dtoList = result.stream().map(fn).collect(Collectors.toList()); // fn = GuestbookServiceImpl 의 (entity -> entityToDto(entity)) 의 참조값
        totalPage = result.getTotalPages();                             // └→ result에서 하나 꺼내서 dto에 넣어주고 최종적으로 list 반환 (map : forEach 기능)
        makePageList(result.getPageable());
    }

    private void makePageList(Pageable pageable) {
        this.page = pageable.getPageNumber() + 1; // 0부터 시작하므로 1을 더함
        this.size = pageable.getPageSize();

        int tempEnd = (int)(Math.ceil(page / 10.0)) * 10; // 임시 끝 페이지 번호
        start = tempEnd - 9;
        prev = start > 1;
        end = totalPage > tempEnd ? tempEnd : totalPage;
        next = totalPage > tempEnd;
        pageList = IntStream.rangeClosed(start, end).boxed().collect(Collectors.toList()); // 1~10 번호 만들어주는 역할
    }
}
