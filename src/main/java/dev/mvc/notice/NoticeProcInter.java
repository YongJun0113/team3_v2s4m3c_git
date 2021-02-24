package dev.mvc.notice;

import java.util.HashMap;
import java.util.List;


public interface NoticeProcInter {
  
  /**
   * 생성
   * @param noticeVO
   * @return
   */
  public int create(NoticeVO noticeVO);
  
  /**
   * 목록
   * @return
   */
  public List<NoticeVO> list_noticeno_asc();
  
  /**
   * 특정 카테고리 글목록
   * @return
   */
  public List<NoticeVO> list_by_ncateno(int ncate_no);
  
  
  /**
   * 조회
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
   * 수정
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
   * 이미지 등록
   * @param noticeVO
   * @return
   */
  public int img_create(NoticeVO noticeVO);
  
  /**
   * 이미지 수정
   * @param noticeVO
   * @return
   */
  public int img_update(NoticeVO noticeVO);

  /**
   * 이미지 삭제
   * @param noticeVO
   * @return
   */
  public int img_delete(NoticeVO noticeVO);
  
  
  /**
   * 공지사항 삭제
   * @param noticeno
   * @return
   */
  public int delete(int noticeno);
  
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
   * 페이지 목록 문자열 생성, Box 형태
   * @param listFile 목록 파일명 
   * @param ncate_no 카테고리번호
   * @param search_count 검색 갯수
   * @param nowPage 현재 페이지, nowPage는 1부터 시작
   * @param title 검색어
   * @return
   */
  public String pagingBox(String listFile, int ncate_no, int search_count, int nowPage, String title);

  /**
   * 카테고리별 검색 레코드 갯수
   * @param hashMap
   * @return
   */
  public int search_cnt(HashMap<String, Object> hashMap);

 
  
}
