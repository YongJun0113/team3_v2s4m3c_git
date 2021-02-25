package dev.mvc.publisher;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.tool.Tool;
import dev.mvc.tool.Upload;

@Controller
public class PublisherCont {
  @Autowired
  @Qualifier("dev.mvc.publisher.PublisherProc")
  private PublisherProcInter publisherProc;
  
  public PublisherCont() {
    System.out.println("--> PublisherCont created.");
  }
  
  /**
   * 등록폼 http://localhost:9090/team3/publisher/create.do
   * 
   * @return
   */
  @RequestMapping(value = "/publisher/create.do", method = RequestMethod.GET)
  public ModelAndView create() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/publisher/create"); // /webapp/publisher/create.jsp

    return mav; // forward
  }
  /**
   * 등록 처리 http://localhost:9090/team3/event/create_msg.do
   * 
   * @return
   */
  @RequestMapping(value = "/publisher/create.do", method = RequestMethod.POST)
  public ModelAndView create(HttpServletRequest request, PublisherVO publisherVO) {
    // request.setAttribute("categrpVO", categrpVO) 자동 실행

    ModelAndView mav = new ModelAndView();
 // -------------------------------------------------------------------
    // 파일 전송 코드 시작
    // -------------------------------------------------------------------
    String file1 = "";     // main image
    String thumb1 = ""; // preview image
        
    String upDir = Tool.getRealPath(request, "/publisher/storage/main_images"); // 절대 경로
    // 전송 파일이 없어서도 fnamesMF 객체가 생성됨.
    // <input type='file' class="form-control" name='file1MF' id='file1MF' 
    //           value='' placeholder="파일 선택" multiple="multiple">
    MultipartFile mf = publisherVO.getFile1MF();
    long size1 = mf.getSize();  // 파일 크기
    if (size1 > 0) { // 파일 크기 체크
      // mp3 = mf.getOriginalFilename(); // 원본 파일명, spring.jpg
      // 파일 저장 후 업로드된 파일명이 리턴됨, spring.jsp, spring_1.jpg...
      file1 = Upload.saveFileSpring(mf, upDir); 
      
      if (Tool.isImage(file1)) { // 이미지인지 검사
        // thumb 이미지 생성후 파일명 리턴됨, width: 120, height: 80
        thumb1 = Tool.preview(upDir, file1, 200, 150); 
      }
      
    }    
    
    publisherVO.setFile1(file1);
    publisherVO.setThumb1(thumb1);
    publisherVO.setSize1(size1);
    // -------------------------------------------------------------------
    // 파일 전송 코드 종료
    // -------------------------------------------------------------------
    mav.setViewName("/publisher/create_msg"); // /webapp/publisher/create_msg.jsp

    int cnt = this.publisherProc.create(publisherVO);
    mav.addObject("cnt", cnt); // request.setAttribute("cnt", cnt)

    return mav; // forward
  }
    /**
     * 목록 http://localhost:9090/team3/publisher/list.do
     * 
     * @return
     */
    @RequestMapping(value = "/publisher/list.do", method = RequestMethod.GET)
    public ModelAndView list() {
      ModelAndView mav = new ModelAndView();
      mav.setViewName("/publisher/list"); // /webapp/event/list.jsp

     
      List<PublisherVO> list = this.publisherProc.list_pub_no_asc();
      mav.addObject("list", list);

      return mav; // forward
    }   
    /**
     * 조회 + 수정폼 
     * 
     * @return
     */
    @RequestMapping(value = "/publisher/read_update.do", method = RequestMethod.GET)
    public ModelAndView read_update(int pub_no) {
      ModelAndView mav = new ModelAndView();
      mav.setViewName("/publisher/read_update"); // /webapp/categrp/read_update.jsp

      PublisherVO publisherVO = this.publisherProc.read(pub_no);
      mav.addObject("publisherVO", publisherVO);

      List<PublisherVO> list = this.publisherProc.list_pub_no_asc();
      mav.addObject("list", list);

      return mav; // forward
    }
    
    /**
     * 수정 처리
     * 
     * @param eventVO
     * @return
     */
    @RequestMapping(value = "/publisher/update.do", method = RequestMethod.POST)
    public ModelAndView update(PublisherVO PublisherVO) {

      ModelAndView mav = new ModelAndView();

      int cnt = this.publisherProc.update(PublisherVO);
      mav.addObject("cnt", cnt); // request에 저장

      mav.setViewName("/publisher/update_msg"); // webapp/categrp/update_msg.jsp

      return mav;
    }
    
    /**
     * 삭제폼 http://localhost:9090/resort/categrp/read_delete.do
     * @return
     */
    @RequestMapping(value = "/publisher/read_delete.do", method = RequestMethod.GET)
    public ModelAndView read_delete(int pub_no) {
      ModelAndView mav = new ModelAndView();
      mav.setViewName("/publisher/read_delete"); // /webapp/categrp/read_delete.jsp

      PublisherVO publisherVO = this.publisherProc.read(pub_no);
      mav.addObject("publisherVO", publisherVO);

      List<PublisherVO> list = this.publisherProc.list_pub_no_asc();
      mav.addObject("list", list);

      return mav; // forward
    }

    /**
     * 삭제 처리
     * @param eventno
     * @return
     */
    @RequestMapping(value = "/publisher/delete.do", method = RequestMethod.POST)
    public ModelAndView delete(int pub_no) {
      ModelAndView mav = new ModelAndView();

      int cnt = this.publisherProc.delete(pub_no);
      mav.addObject("cnt", cnt); // request에 저장

      mav.setViewName("/publisher/delete_msg"); // /webapp/categrp/delete_msg.jsp

      return mav;
    }
   
}

