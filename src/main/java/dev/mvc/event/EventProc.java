package dev.mvc.event;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.event.EventProc")
public class EventProc implements EventProcInter {
  @Autowired
  private EventDAOInter eventDAO; 
  
  public EventProc() {
    System.out.println("--> EventProc created.");
  }
  @Override
  public int create(EventVO eventVO) {
    int cnt = this.eventDAO.create(eventVO);
    return cnt;
  }
  @Override
  public List<EventVO> list_eventno_asc() {
    List<EventVO> list=this.eventDAO.list_eventno_asc();
    return list;
  }
  @Override
  public EventVO read(int eventno) {
    EventVO eventVO=this.eventDAO.read(eventno);
    return eventVO;
  }
  @Override
  public int update(EventVO eventVO) {
    int cnt=this.eventDAO.update(eventVO);
    return cnt;
  }
  @Override
  public int delete(int eventno) {
    int cnt=this.eventDAO.delete(eventno);
    return cnt;
  }
  

  
  
  
  

 
}
