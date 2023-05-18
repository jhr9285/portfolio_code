package com.easyfit.service;

import java.util.List;

import com.easyfit.domain.Criteria;
import com.easyfit.domain.ExerciseRecordVO;
import com.easyfit.domain.ExerciseTypeVO;
import com.easyfit.domain.join.LessonJoinVO;

public interface LessonService {//변수앞에 get을 붙여서 카멜표기법을 사용합니다.
	
	// 뷰 페이지(jsp 파일) CRUD 
	
	// SELECT
    public List<LessonJoinVO> getTripleList(Criteria cri, Long tno);
	public List<LessonJoinVO> getDoubleList(Long prno, Long tno);
	public LessonJoinVO getDoubleListNotPaging(Long prno, Long tno);
	public List<LessonJoinVO> getGet(Long prno, String edate, Long tno);
	
	// INSERT
	public void getRegister(ExerciseRecordVO vo);
	
	// UPDATE
	public void getModify(ExerciseRecordVO vo);
	public void getModifyEno(ExerciseRecordVO vo);
	public boolean getPrcountUpdate(Long prno);
	
	// DELETE
	public boolean getRemove(Long prno, String edate);
	
	// 총 게시글 갯수 구하는 메소드
	public long getExerciseRecordTotal(Criteria cri, Long prno);
	public long getPTRecordTotal(Criteria cri);
	
	
	// 운동기록 모달 CRUD (JHR)
	// SELECT
	public List<ExerciseTypeVO> getExerciseTypeList(Criteria cri);
	public List<ExerciseTypeVO> getExerciseTypeListNotPaging();
	public ExerciseTypeVO getEno(ExerciseTypeVO et);
	
	
	//#{tno} 메소드 모음 (LJW)
	public long getMyPTRecordTotalCount(Criteria cri, Long tno);
	public String getLessonRegisterMNAME(Long tno, Long mno);
	
}
