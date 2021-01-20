package dev.mvc.sale;

import java.util.HashMap;
import java.util.List;



public interface SaleweekDAOInter {

  /**
   * 등록
   */
  public int create(SaleweekVO saleWeekVO);
   
  
  /**
   *  카테고리 그룹에따른 카테고리 목록의 출력
   * <xmp>
   *   <select id="list_eventno_asc" parameterType="SaleweekVO">
   *     <select id="list_saleno_asc" parameterType="SaleweekVO"> 
   * </xmp> 
   * @return 레코드 목록
   */
  public List<SaleweekVO> list_eventno_asc(int saleno);
  
  /**
   * 특정 카테고리의 목록 
   * <xmp>
   * <select id="list_all" resultType="ContentsVO">
   * </xmp> 
   * @return 레코드 목록
   */
  public List<SaleweekVO> list_by_eventno(int eventno);
  
  /**
   * 특정 카테고리의 목록 
   */
  public List<SaleweekVO> list_saleno_asc();
  
  /**
   * 조회
   */
   public SaleweekVO read(int saleno);
  
   /**
    * 수정용 조회
    * <xmp>
    *   <select id="read" resultType="CategrpVO" parameterType="int">
    * </xmp>  
    * @param categrpno
    * @return
    */
    public SaleweekVO read_update(int saleno);
   /**
    *  수정 
    *  <update id="update" parameterType="SaleweekVO">
    */
   public int update(SaleweekVO saleweekVO);
   
   /**
    * 패스워드 검사
    * @param hashMap
    * @return
    */
   public int passwd_check(HashMap hashMap);
   
   /**
    * 이미지수정 처리
    * @param contentsVO
    * @return
    */
   public int update_img(SaleweekVO saleweekVO);
}
