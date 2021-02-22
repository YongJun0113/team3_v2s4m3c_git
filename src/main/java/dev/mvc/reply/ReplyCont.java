package dev.mvc.reply;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.admin.AdminProcInter;
import dev.mvc.ncate.NcateVO;
import dev.mvc.notice.NoticeVO;


@Controller
public class ReplyCont {
  
  @Autowired
  @Qualifier("dev.mvc.admin.AdminProc") // 이름 지정
  private AdminProcInter adminProc;
  
  @Autowired
  @Qualifier("dev.mvc.reply.ReplyProc")
  private ReplyProcInter replyProc;

  public ReplyCont() {
    System.out.println("--> ReplyCont created.");
  }
  
  /**
   *등록
   * @return
   */
  @RequestMapping(value = "/reply/create.do", method = RequestMethod.GET)
  public ModelAndView create() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/reply/create"); // /review/create.jsp

    return mav;
  }

  /**
   * 등록처리
   * @param replyVO
   * @return
   */
  @RequestMapping(value = "/reply/create.do", method = RequestMethod.POST)
  public ModelAndView create(ReplyVO replyVO) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/reply/create_msg");

    int cnt = this.replyProc.create(replyVO);
    mav.addObject("cnt", cnt);

    return mav;
  }

  /**
   * 목록
   * @return
   */
//  @RequestMapping(value = "/reply/list.do", method = RequestMethod.GET)
//  public ModelAndView list() {
//    ModelAndView mav = new ModelAndView();
//    mav.setViewName("/reply/list"); // /reply/list.jsp
//
//    List<ReplyVO> list = this.replyProc.list_replyno_desc();
//    mav.addObject("list", list);
//
//    return mav; // forward
//  }
  
  /**
   * 관리자만 목록 확인 가능
   * @param session
   * @return
   */
  @RequestMapping(value="/reply/list.do", method=RequestMethod.GET)
  public ModelAndView list(HttpSession session) {
    ModelAndView mav = new ModelAndView();
    
    if (adminProc.isAdmin(session)) {
      List<ReplyMemberVO> list = replyProc.list_member_join();
      
      mav.addObject("list", list);
      mav.setViewName("/reply/list_join"); // /webapp/reply/list_join.jsp

    } else {
      mav.setViewName("redirect:/admin/login_need.jsp"); // /webapp/admin/login_need.jsp
    }
    
    return mav;
  }
  
  
  
  /**
  * 조회 + 삭제폼 
  * 
  * @return
  */
 @RequestMapping(value = "/reply/read_delete.do", method = RequestMethod.GET)
 public ModelAndView read_delete(int reply_no) {
   ModelAndView mav = new ModelAndView();
   mav.setViewName("/reply/read_delete"); 

   ReplyVO replyVO = this.replyProc.read(reply_no);
   mav.addObject("replyVO", replyVO);
   
   List<ReplyVO> list = this.replyProc.list_replyno_desc();
   mav.addObject("list", list);

   return mav; 
 }
 
 /**
  * 삭제 처리
  * 
  * @param ncateVO
  * @return
  */
 @RequestMapping(value = "/reply/delete.do", method = RequestMethod.POST)
 public ModelAndView delete(int reply_no) {
   ModelAndView mav = new ModelAndView();

   int cnt = this.replyProc.delete(reply_no);
   mav.addObject("cnt", cnt); 

   mav.setViewName("/reply/delete_msg"); 

   return mav;
 }
  
  

}
