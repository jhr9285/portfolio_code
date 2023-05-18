package org.zerock.guestbook.service;

import org.zerock.guestbook.dto.GuestbookDTO;
import org.zerock.guestbook.dto.PageRequestDTO;
import org.zerock.guestbook.dto.PageResultDTO;
import org.zerock.guestbook.entity.Guestbook;

public interface GuestbookService {
    Long register(GuestbookDTO dto); // 등록하기

    PageResultDTO<GuestbookDTO, Guestbook> getList(PageRequestDTO requestDTO); // 목록보기
    
    // GuestbookDTO read(Long gno); // 상세보기
    
    void modify(GuestbookDTO dto); // 수정하기
    
    void remove(Long gno); // 삭제하기

    default Guestbook dtoToEntity(GuestbookDTO dto) { // dto를 entity로 변환하는 메소드
        Guestbook entity = Guestbook.builder()
                                .gno(dto.getGno())
                                .title(dto.getTitle())
                                .content(dto.getContent())
                                .writer(dto.getWriter())
                                .build();
        return entity;
    }

    default GuestbookDTO entityToDto(Guestbook entity) { // entity를 dto로 변환하는 메소드
        GuestbookDTO dto = GuestbookDTO.builder()
                                    .gno(entity.getGno())
                                    .title(entity.getTitle())
                                    .content(entity.getContent())
                                    .writer(entity.getWriter())
                                    .regDate(entity.getRegDate())
                                    .modDate(entity.getModDate())
                                    .build();
        return dto;
    }


}
