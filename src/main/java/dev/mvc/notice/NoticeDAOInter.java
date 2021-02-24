package dev.mvc.notice;

import java.util.HashMap;
import java.util.List;


public interface NoticeDAOInter {
  
  /**
   * �������� ���
   * @param noticeVO
   * @return
   */
  public int create(NoticeVO noticeVO);
  
  /**
   * �������� ���
   * @return
   */
  public List<NoticeVO> list_noticeno_asc();
  
  /**
   * Ư�� ī�װ� �۸��
   * @return
   */
  public List<NoticeVO> list_by_ncateno(int ncate_no);
  
  /**
   * �������� ��ȸ
   * @param noticeno
   * @return
   */
  public NoticeVO read(int noticeno);
  
  /**
   * ������ ��ȸ
   * @param noticeno
   * @return
   */
  public NoticeVO read_update(int noticeno);
  
  /**
   * �������� ����
   * @param noticeVO
   * @return
   */
  public int update(NoticeVO noticeVO);
 
  /**
   * �н����� �˻�
   * @param hashMap
   * @return
   */
  public int passwd_check(HashMap hashMap);
  
  /**
   * �������� ����
   * @param noticeno
   * @return
   */
  public int delete(int noticeno);
  
  /**
   * �̹��� ����
   * @param noticeVO
   * @return
   */
  public int update_img(NoticeVO noticeVO);
  
  /**
   * visible ����
   * @param noticeVO
   * @return
   */
  public int update_visible(NoticeVO noticeVO);
  
  
  
  /**
   * ī�װ��� �˻� ���
   * @param hashMap
   * @return
   */
  public List<NoticeVO> list_by_ncateno_search(HashMap<String, Object> hashMap);
  
  /**
   * ī�װ��� �˻� ����¡ ���
   * @param hashMap
   * @return
   */
  public List<NoticeVO> list_by_ncateno_search_paging(HashMap<String, Object> map);

  /**
   * ī�װ��� �˻� ���ڵ� ����
   * @param hashMap
   * @return
   */
  public int search_cnt(HashMap<String, Object> hashMap);
  
  
 
  
}
