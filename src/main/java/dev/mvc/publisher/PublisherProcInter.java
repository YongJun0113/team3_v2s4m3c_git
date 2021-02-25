package dev.mvc.publisher;

import java.util.List;

public interface PublisherProcInter {
  
  /**
   * ���ǻ� ���� ��� 
   */
  public int create(PublisherVO publisherVO);
  
  /**
   * ���
   * <xmp>
   * <select id="list_eventno_asc" resultType="EventVO">
   * </xmp> 
   * @return ���ڵ� ���
   */
  public List<PublisherVO> list_pub_no_asc();
  
  /**
   * ��ȸ
   */
  public PublisherVO read(int pub_no);
  
  /**
   * ����
   */
   public int update(PublisherVO publisherVO);
   
   /**
    * ���� ó�� 
    */
    public int delete(int pub_no);

}
