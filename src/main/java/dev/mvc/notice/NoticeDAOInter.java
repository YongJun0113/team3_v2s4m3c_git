package dev.mvc.notice;

import java.util.HashMap;
import java.util.List;


public interface NoticeDAOInter {
  
  /**
   * 공지사항 등록
   * @param noticeVO
   * @return
   */
  public int create(NoticeVO noticeVO);
  
  /**
   * 공지사항 목록
   * @return
   */
  public List<NoticeVO> list_noticeno_asc();
  
  /**
   * 특정 카테고리 글목록
   * @return
   */
  public List<NoticeVO> list_by_ncateno(int ncate_no);
  
  /**
   * 공지사항 조회
   * @param noticeno
   * @return
   */
  public NoticeVO read(int noticeno);
  
  /**
   * 수정용 조회
   * @param noticeno
   * @return
   */
  public NoticeVO read_update(int noticeno);
  
  /**
   * 공지사항 수정
   * @param noticeVO
   * @return
   */
  public int update(NoticeVO noticeVO);
 
  /**
   * 패스워드 검사
   * @param hashMap
   * @return
   */
  public int passwd_check(HashMap hashMap);
  
  /**
   * 공지사항 삭제
   * @param noticeno
   * @return
   */
  public int delete(int noticeno);
  
  /**
   * 이미지 변경
   * @param noticeVO
   * @return
   */
  public int update_img(NoticeVO noticeVO);
  
  /**
   * visible 수정
   * @param noticeVO
   * @return
   */
  public int update_visible(NoticeVO noticeVO);
  
  
  
  /**
   * 카테고리별 검색 목록
   * @param hashMap
   * @return
   */
  public List<NoticeVO> list_by_ncateno_search(HashMap<String, Object> hashMap);
  
  /**
   * 카테고리별 검색 페이징 목록
   * @param hashMap
   * @return
   */
  public List<NoticeVO> list_by_ncateno_search_paging(HashMap<String, Object> map);

  /**
   * 카테고리별 검색 레코드 갯수
   * @param hashMap
   * @return
   */
  public int search_cnt(HashMap<String, Object> hashMap);
  
  
 
  
}
