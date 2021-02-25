package dev.mvc.publisher;

import java.util.List;

import dev.mvc.event.EventVO;

public interface PublisherDAOInter {

  /**
   * 출판사 정보 등록 
   */
  public int create(PublisherVO publisherVO);
  
  /**
   * 목록
   * <xmp>
   * <select id="list_eventno_asc" resultType="EventVO">
   * </xmp> 
   * @return 레코드 목록
   */
  public List<PublisherVO> list_pub_no_asc();
  
  /**
   * 조회
   */
  public PublisherVO read(int pub_no);
  
  /**
   * 수정
   */
   public int update(PublisherVO publisherVO);
   
   /**
    * 삭제 처리 
    */
    public int delete(int pub_no);
}
