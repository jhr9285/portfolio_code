package org.zerock.guestbook.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.zerock.guestbook.dto.GuestbookDTO;

import java.util.List;

@Mapper
public interface GuestbookMapper {
    public GuestbookDTO read(Long gno);
    public void delete();
}
