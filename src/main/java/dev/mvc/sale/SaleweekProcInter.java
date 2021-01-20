package dev.mvc.sale;

import java.util.HashMap;
import java.util.List;





public interface SaleweekProcInter {

  /**
   * 등록
   */
  public int create(SaleweekVO saleweekVO);
  
  /*
   * a목록
   */
  public List<SaleweekVO> list_saleno_asc();
  
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
   * 조회
   */
   public SaleweekVO read(int saleno);
   
   /**
    *  수정 처리
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
    * 특정 카테고리의 목록 
    * @return 레코드 목록
    */
   public List<SaleweekVO> list_by_eventno(int eventno);
/**
 * 이미지 등록
 * @param contentsVO
 * @return
 */
public int img_create(SaleweekVO saleweekVO);

/**
 * 이미지 수정
 * @param contentsVO
 * @return
 */
public int img_update(SaleweekVO saleweekVO);

/**
 * 이미지 삭제
 * @param contentsVO
 * @return
 */
public int img_delete(SaleweekVO saleweekVO);

}