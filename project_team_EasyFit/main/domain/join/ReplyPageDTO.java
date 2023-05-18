package com.easyfit.domain;

import java.util.List;

import com.easyfit.domain.join.ReplyJoinVO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;

@Data
@AllArgsConstructor
@Getter
public class ReplyPageDTO {

  private int replyCnt; //댓글갯수
  private List<ReplyJoinVO> list; //댓글목록
}