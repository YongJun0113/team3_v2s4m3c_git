package dev.mvc.event;





import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;



@Controller
public class EventCont {
  @Autowired
  @Qualifier("dev.mvc.event.EventProc")
  private EventProcInter eventProc;
  
  public EventCont() {
    System.out.println("--> EventCont created.");
  }
  /**
   * 등록폼 http://localhost:9090/team3/event/create.do
   * 
   * @return
   */
  @RequestMapping(value = "/event/create.do", method = RequestMethod.GET)
  public ModelAndView create() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/event/create"); // /webapp/event/create.jsp

    return mav; // forward
  }
  /**
   * 등록 처리 http://localhost:9090/team3/event/create_msg.do
   * 
   * @return
   */
  @RequestMapping(value = "/event/create.do", method = RequestMethod.POST)
  public ModelAndView create(EventVO eventVO) {
    // request.setAttribute("categrpVO", categrpVO) 자동 실행

    ModelAndView mav = new ModelAndView();
    mav.setViewName("/event/create_msg"); // /webapp/event/create_msg.jsp

    int cnt = this.eventProc.create(eventVO);
    mav.addObject("cnt", cnt); // request.setAttribute("cnt", cnt)

    return mav; // forward
  }
  
  /**
   * 목록 http://localhost:9090/team3/event/list.do
   * 
   * @return
   */
  @RequestMapping(value = "/event/list.do", method = RequestMethod.GET)
  public ModelAndView list() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/event/list"); // /webapp/event/list.jsp

   
    List<EventVO> list = this.eventProc.list_eventno_asc();
    mav.addObject("list", list);

    return mav; // forward
  }
  
  /**
   * 조회 + 수정폼 
   * 
   * @return
   */
  @RequestMapping(value = "/event/read_update.do", method = RequestMethod.GET)
  public ModelAndView read_update(int eventno) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/event/read_update"); // /webapp/categrp/read_update.jsp

    EventVO eventVO = this.eventProc.read(eventno);
    mav.addObject("eventVO", eventVO);

    List<EventVO> list = this.eventProc.list_eventno_asc();
    mav.addObject("list", list);

    return mav; // forward
  }
  
  /**
   * 수정 처리
   * 
   * @param eventVO
   * @return
   */
  @RequestMapping(value = "/event/update.do", method = RequestMethod.POST)
  public ModelAndView update(EventVO eventVO) {

    ModelAndView mav = new ModelAndView();

    int cnt = this.eventProc.update(eventVO);
    mav.addObject("cnt", cnt); // request에 저장

    mav.setViewName("/event/update_msg"); // webapp/categrp/update_msg.jsp

    return mav;
  }
  
  /**
   * 삭제폼 http://localhost:9090/resort/categrp/read_delete.do
   * @return
   */
  @RequestMapping(value = "/event/read_delete.do", method = RequestMethod.GET)
  public ModelAndView read_delete(int eventno) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/event/read_delete"); // /webapp/categrp/read_delete.jsp

    EventVO eventVO = this.eventProc.read(eventno);
    mav.addObject("eventVO", eventVO);

    List<EventVO> list = this.eventProc.list_eventno_asc();
    mav.addObject("list", list);

    return mav; // forward
  }

  /**
   * 삭제 처리
   * @param eventno
   * @return
   */
  @RequestMapping(value = "/event/delete.do", method = RequestMethod.POST)
  public ModelAndView delete(int eventno) {
    ModelAndView mav = new ModelAndView();

    int cnt = this.eventProc.delete(eventno);
    mav.addObject("cnt", cnt); // request에 저장

    mav.setViewName("/event/delete_msg"); // /webapp/categrp/delete_msg.jsp

    return mav;
  }
}
