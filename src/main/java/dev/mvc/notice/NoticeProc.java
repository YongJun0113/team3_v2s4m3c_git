package dev.mvc.notice;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import dev.mvc.tool.Tool;

@Component("dev.mvc.notice.NoticeProc")
public class NoticeProc implements NoticeProcInter {
  
  @Autowired
  private NoticeDAOInter noticeDAO;

  public NoticeProc() {
    System.out.println("--> NoticeProc created.");
  }

  @Override
  public int create(NoticeVO noticeVO) {
    int cnt = this.noticeDAO.create(noticeVO);
    return cnt;
  }

  @Override
  public List<NoticeVO> list_noticeno_asc() {
    List<NoticeVO> list = this.noticeDAO.list_noticeno_asc();
    return list;
  }
  
  /**
   * 카테고리별 글 목록
   */
  @Override
  public List<NoticeVO> list_by_ncateno(int ncate_no) {
    List<NoticeVO> list = this.noticeDAO.list_by_ncateno(ncate_no);
    return list;
  }  
  
  /**
   * 조회
   */
  @Override
  public NoticeVO read(int noticeno) {
    NoticeVO noticeVO = this.noticeDAO.read(noticeno);
    
    String title = noticeVO.getTitle();
    String content = noticeVO.getContent();
    
    title = Tool.convertChar(title);  // 특수 문자 처리
    // content = Tool.convertChar(content); // Ckeditor 사용시 사용하지 말 것.
    
    noticeVO.setTitle(title);
    // contentsVO.setContent(content);  // Ckeditor 사용시 사용하지 말 것.
    
    return noticeVO;
  }
  
  @Override
  public NoticeVO read_update(int noticeno) {
    NoticeVO noticeVO = this.noticeDAO.read(noticeno);
    return noticeVO;
  }

  @Override
  public int update(NoticeVO noticeVO) {
    int cnt = this.noticeDAO.update(noticeVO);
    return cnt;
  }
  
  @Override
  public int passwd_check(HashMap hashMap) {
    int cnt = this.noticeDAO.passwd_check(hashMap);
    return cnt;
  }
  
  @Override
  public int img_create(NoticeVO noticeVO) {
    int cnt = this.noticeDAO.update_img(noticeVO);
    return cnt;
  }
  
  @Override
  public int img_update(NoticeVO noticeVO) {
    int cnt = this.noticeDAO.update_img(noticeVO);
    return cnt;
  }

  @Override
  public int img_delete(NoticeVO noticeVO) {
    int cnt = this.noticeDAO.update_img(noticeVO);
    return cnt;
  }


  @Override
  public int delete(int noticeno) {
    int passwd_cnt = this.noticeDAO.delete(noticeno);
    return passwd_cnt;
  }

  /**
   * Y -> N, N -> Y
   */
  @Override
  public int update_visible(NoticeVO noticeVO) {
    if (noticeVO.getVisible().equalsIgnoreCase("Y")) {
      noticeVO.setVisible("N");
    } else {
      noticeVO.setVisible("Y");
    }
        
    int cnt = this.noticeDAO.update_visible(noticeVO);
    return cnt;
  }
  
  
  @Override
  public List<NoticeVO> list_by_ncateno_search(HashMap<String, Object> hashMap) {
    List<NoticeVO> list = noticeDAO.list_by_ncateno_search(hashMap);
    return list;
  }

  @Override
  public int search_cnt(HashMap<String, Object> hashMap) {
    int cnt = noticeDAO.search_cnt(hashMap);
    return cnt;
  }
  
  @Override
  public List<NoticeVO> list_by_ncateno_search_paging(HashMap<String, Object> map) {
   
    int beginOfPage = ((Integer)map.get("nowPage") - 1) * Notice.RECORD_PER_PAGE;
   
    // 시작 rownum 결정
    // 1 페이지 = 0 + 1, 2 페이지 = 10 + 1, 3 페이지 = 20 + 1 
    int startNum = beginOfPage + 1;
    
    //  종료 rownum
    // 1 페이지 = 0 + 10, 2 페이지 = 0 + 20, 3 페이지 = 0 + 30
    int endNum = beginOfPage + Notice.RECORD_PER_PAGE;   
    /*
    1 페이지: WHERE r >= 1 AND r <= 10
    2 페이지: WHERE r >= 11 AND r <= 20
    3 페이지: WHERE r >= 21 AND r <= 30
    */
    map.put("startNum", startNum);
    map.put("endNum", endNum);
   
    List<NoticeVO> list = this.noticeDAO.list_by_ncateno_search_paging(map);
    
    return list;
  }
  
  /** 
   * SPAN태그를 이용한 박스 모델의 지원, 1 페이지부터 시작 
   * 현재 페이지: 11 / 22   [이전] 11 12 13 14 15 16 17 18 19 20 [다음] 
   *
   * @param listFile 목록 파일명 
   * @param cateno 카테고리번호 
   * @param search_count 검색(전체) 레코드수 
   * @param nowPage     현재 페이지
   * @param word 검색어
   * @return 페이징 생성 문자열
   */ 
  @Override
  public String pagingBox(String listFile, int ncate_no, int search_count, int nowPage, String title){ 
    int totalPage = (int)(Math.ceil((double)search_count/Notice.RECORD_PER_PAGE)); // 전체 페이지  
    
    int totalGrp = (int)(Math.ceil((double)totalPage/Notice.PAGE_PER_BLOCK));// 전체 그룹 
    
    int nowGrp = (int)(Math.ceil((double)nowPage/Notice.PAGE_PER_BLOCK));    // 현재 그룹 
    
    int startPage = ((nowGrp - 1) * Notice.PAGE_PER_BLOCK) + 1; // 특정 그룹의 페이지 목록 시작  
    
    int endPage = (nowGrp * Notice.PAGE_PER_BLOCK);             // 특정 그룹의 페이지 목록 종료   
     
    StringBuffer str = new StringBuffer(); 
     
    str.append("<style type='text/css'>"); 
    str.append("  #paging {text-align: center; margin-top: 5px; font-size: 1em;}"); 
    str.append("  #paging A:link {text-decoration:none; color:black; font-size: 1em;}"); 
    str.append("  #paging A:hover{text-decoration:none; background-color: #FFFFFF; color:black; font-size: 1em;}"); 
    str.append("  #paging A:visited {text-decoration:none;color:black; font-size: 1em;}"); 
    str.append("  .span_box_1{"); 
    str.append("    text-align: center;");    
    str.append("    font-size: 1em;"); 
    str.append("    border: 1px;"); 
    str.append("    border-style: solid;"); 
    str.append("    border-color: #cccccc;"); 
    str.append("    padding:1px 6px 1px 6px; /*위, 오른쪽, 아래, 왼쪽*/"); 
    str.append("    margin:1px 2px 1px 2px; /*위, 오른쪽, 아래, 왼쪽*/"); 
    str.append("  }"); 
    str.append("  .span_box_2{"); 
    str.append("    text-align: center;");    
    str.append("    background-color: #668db4;"); 
    str.append("    color: #FFFFFF;"); 
    str.append("    font-size: 1em;"); 
    str.append("    border: 1px;"); 
    str.append("    border-style: solid;"); 
    str.append("    border-color: #cccccc;"); 
    str.append("    padding:1px 6px 1px 6px; /*위, 오른쪽, 아래, 왼쪽*/"); 
    str.append("    margin:1px 2px 1px 2px; /*위, 오른쪽, 아래, 왼쪽*/"); 
    str.append("  }"); 
    str.append("</style>"); 
    str.append("<DIV id='paging'>"); 
//    str.append("현재 페이지: " + nowPage + " / " + totalPage + "  "); 
 
    // 이전 10개 페이지로 이동
    // nowGrp: 1 (1 ~ 10 page)
    // nowGrp: 2 (11 ~ 20 page)
    // nowGrp: 3 (21 ~ 30 page) 
    // 현재 2그룹일 경우: (2 - 1) * 10 = 1그룹의 마지막 페이지 10
    // 현재 3그룹일 경우: (3 - 1) * 10 = 2그룹의 마지막 페이지 20
    int _nowPage = (nowGrp-1) * Notice.PAGE_PER_BLOCK;  
    if (nowGrp >= 2){ 
      str.append("<span class='span_box_1'><A href='"+listFile+"?&title="+title+"&nowPage="+_nowPage+"&ncate_no="+ncate_no+"'>이전</A></span>"); 
    } 
 
    // 중앙의 페이지 목록
    for(int i=startPage; i<=endPage; i++){ 
      if (i > totalPage){ // 마지막 페이지를 넘어갔다면 페이 출력 종료
        break; 
      } 
  
      if (nowPage == i){ // 페이지가 현재페이지와 같다면 CSS 강조(차별을 둠)
        str.append("<span class='span_box_2'>"+i+"</span>"); // 현재 페이지, 강조 
      }else{
        // 현재 페이지가 아닌 페이지는 이동이 가능하도록 링크를 설정
        str.append("<span class='span_box_1'><A href='"+listFile+"?title="+title+"&nowPage="+i+"&ncate_no="+ncate_no+"'>"+i+"</A></span>");   
      } 
    } 
 
    // 10개 다음 페이지로 이동
    // nowGrp: 1 (1 ~ 10 page),  nowGrp: 2 (11 ~ 20 page),  nowGrp: 3 (21 ~ 30 page) 
    // 현재 1그룹일 경우: (1 * 10) + 1 = 2그룹의 시작페이지 11
    // 현재 2그룹일 경우: (2 * 10) + 1 = 3그룹의 시작페이지 21
    _nowPage = (nowGrp * Notice.PAGE_PER_BLOCK)+1;  
    if (nowGrp < totalGrp){ 
      str.append("<span class='span_box_1'><A href='"+listFile+"?&title="+title+"&nowPage="+_nowPage+"&ncate_no="+ncate_no+"'>다음</A></span>"); 
    } 
    str.append("</DIV>"); 
     
    return str.toString(); 
  }
  


}
