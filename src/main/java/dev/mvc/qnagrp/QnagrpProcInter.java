package dev.mvc.qnagrp;

import java.util.List;

public interface QnagrpProcInter {
 
  /**
   * <Xmp>
   * qna 그룹 등록
   * 
   * </Xmp>
   * @param categrpVO
   * @return 처리된 레코드 갯수
   */
  public int create(QnagrpVO qnagrpVO); 
  
  /**
   * 목록
   * <xmp>
   * <select id="list_eventno_asc" resultType="EventVO">
   * </xmp> 
   * @return 레코드 목록
   */
  public List<QnagrpVO> list_qnagrpno_asc();
  
  /**
   * 수정 처리
   * <xmp>
   *   <update id="update" parameterType="CategrpVO"> 
   * </xmp>
   * @param categrpVO
   * @return 처리된 레코드 갯수
   */
  public int update(QnagrpVO qnagrpVO);
  
  /**
   * 삭제 처리
   * <xmp>
   *   <delete id="delete" parameterType="int">
   * </xmp> 
   * @param categrpno
   * @return 처리된 레코드 갯수
   */
  public int delete(int cnagrpno);
}
