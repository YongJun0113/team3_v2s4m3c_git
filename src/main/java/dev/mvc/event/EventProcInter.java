package dev.mvc.event;

import java.util.List;

public interface EventProcInter {

  
  /**
   * <Xmp>
   * 카테고리 그룹 등록
   * 
   * </Xmp>
   * @param categrpVO
   * @return 처리된 레코드 갯수
   */
  public int create(EventVO eventVO);
  
  /**
   * 목록
   * <xmp>
   * <select id="list_eventno_asc" resultType="EventVO">
   * </xmp> 
   * @return 레코드 목록
   */
  public List<EventVO> list_eventno_asc();
  
  /**
   * 조회
   */
  public EventVO read(int eventno);
  
  /**
   * 수정
   */
   public int update(EventVO eventVO);
   
   /**
    * 삭제 처리 
    */
    public int delete(int eventno); 
}

