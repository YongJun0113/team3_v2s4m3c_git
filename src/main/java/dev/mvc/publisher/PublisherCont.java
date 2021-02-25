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
   * ����� http://localhost:9090/team3/publisher/create.do
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
   * ��� ó�� http://localhost:9090/team3/event/create_msg.do
   * 
   * @return
   */
  @RequestMapping(value = "/publisher/create.do", method = RequestMethod.POST)
  public ModelAndView create(HttpServletRequest request, PublisherVO publisherVO) {
    // request.setAttribute("categrpVO", categrpVO) �ڵ� ����

    ModelAndView mav = new ModelAndView();
 // -------------------------------------------------------------------
    // ���� ���� �ڵ� ����
    // -------------------------------------------------------------------
    String file1 = "";     // main image
    String thumb1 = ""; // preview image
        
    String upDir = Tool.getRealPath(request, "/publisher/storage/main_images"); // ���� ���
    // ���� ������ ����� fnamesMF ��ü�� ������.
    // <input type='file' class="form-control" name='file1MF' id='file1MF' 
    //           value='' placeholder="���� ����" multiple="multiple">
    MultipartFile mf = publisherVO.getFile1MF();
    long size1 = mf.getSize();  // ���� ũ��
    if (size1 > 0) { // ���� ũ�� üũ
      // mp3 = mf.getOriginalFilename(); // ���� ���ϸ�, spring.jpg
      // ���� ���� �� ���ε�� ���ϸ��� ���ϵ�, spring.jsp, spring_1.jpg...
      file1 = Upload.saveFileSpring(mf, upDir); 
      
      if (Tool.isImage(file1)) { // �̹������� �˻�
        // thumb �̹��� ������ ���ϸ� ���ϵ�, width: 120, height: 80
        thumb1 = Tool.preview(upDir, file1, 200, 150); 
      }
      
    }    
    
    publisherVO.setFile1(file1);
    publisherVO.setThumb1(thumb1);
    publisherVO.setSize1(size1);
    // -------------------------------------------------------------------
    // ���� ���� �ڵ� ����
    // -------------------------------------------------------------------
    mav.setViewName("/publisher/create_msg"); // /webapp/publisher/create_msg.jsp

    int cnt = this.publisherProc.create(publisherVO);
    mav.addObject("cnt", cnt); // request.setAttribute("cnt", cnt)

    return mav; // forward
  }
    /**
     * ��� http://localhost:9090/team3/publisher/list.do
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
     * ��ȸ + ������ 
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
     * ���� ó��
     * 
     * @param eventVO
     * @return
     */
    @RequestMapping(value = "/publisher/update.do", method = RequestMethod.POST)
    public ModelAndView update(PublisherVO PublisherVO) {

      ModelAndView mav = new ModelAndView();

      int cnt = this.publisherProc.update(PublisherVO);
      mav.addObject("cnt", cnt); // request�� ����

      mav.setViewName("/publisher/update_msg"); // webapp/categrp/update_msg.jsp

      return mav;
    }
    
    /**
     * ������ http://localhost:9090/resort/categrp/read_delete.do
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
     * ���� ó��
     * @param eventno
     * @return
     */
    @RequestMapping(value = "/publisher/delete.do", method = RequestMethod.POST)
    public ModelAndView delete(int pub_no) {
      ModelAndView mav = new ModelAndView();

      int cnt = this.publisherProc.delete(pub_no);
      mav.addObject("cnt", cnt); // request�� ����

      mav.setViewName("/publisher/delete_msg"); // /webapp/categrp/delete_msg.jsp

      return mav;
    }
   
}

