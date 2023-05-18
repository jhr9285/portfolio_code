package com.easyfit.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.easyfit.domain.Criteria;
import com.easyfit.domain.ExerciseRecordVO;
import com.easyfit.domain.ExerciseTypeVO;
import com.easyfit.domain.join.LessonJoinVO;

public interface LessonMapper {
	
	// 뷰 페이지(jsp 파일) CRUD (JHR)
	
	// SELECT
    public List<LessonJoinVO> tripleList(@Param("cri") Criteria cri, @Param("tno") Long tno);
	public List<LessonJoinVO> doubleList(@Param("prno") Long prno, @Param("tno") Long tno);
	public LessonJoinVO doubleListNotPaging(@Param("prno") Long prno, @Param("tno") Long tno);
	public List<LessonJoinVO> get(@Param("prno") Long prno, @Param("edate") String edate, @Param("tno") Long tno);
	
	// INSERT
	public void register(ExerciseRecordVO vo);
	
	// UPDATE
	public void modify(ExerciseRecordVO vo);
	public void modifyEno(ExerciseRecordVO vo);
	public long prcountUpdate(Long prno);
	
	// DELETE
	public long remove(@Param("prno") Long prno, @Param("edate") String edate);
	
	// 총 게시글 갯수 구하는 메소드 - 운동기록
	public long exerciseRecordTotalCount(Criteria cri, @Param("prno") Long prno);
	
	// 총 게시글 갯수 구하는 메소드 - PT기록
	public long ptRecordTotalCount(Criteria cri);
	
	
	
	// 운동기록 모달 CRUD
	// SELECT
	public List<ExerciseTypeVO> exerciseTypeList(Criteria cri);
	public List<ExerciseTypeVO> exerciseTypeListNotPaging();
	public ExerciseTypeVO eno(ExerciseTypeVO et);
	
	
	
	//(LJW)
	public long myPTRecordTotalCount(@Param("cri") Criteria cri, @Param("tno") Long tno);
	public String lessonRegisterMNAME(@Param("tno") Long tno, @Param("mno") Long mno);
	
}
