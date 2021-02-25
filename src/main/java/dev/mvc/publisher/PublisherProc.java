package dev.mvc.publisher;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import dev.mvc.event.EventVO;
 
  @Component("dev.mvc.publisher.PublisherProc")
public class PublisherProc implements PublisherProcInter {
    @Autowired
    private PublisherDAOInter publisherDAO; 
    
    public PublisherProc() {
      System.out.println("--> PublisherProc created.");
    }

    @Override
    public int create(PublisherVO publisherVO) {
     int cnt = this.publisherDAO.create(publisherVO);
     return cnt;
    }

    @Override
    public List<PublisherVO> list_pub_no_asc() {
      List<PublisherVO> list=this.publisherDAO.list_pub_no_asc();
      return list;
    }

    @Override
    public PublisherVO read(int pub_no) {
      PublisherVO publisherVO=this.publisherDAO.read(pub_no);
      return publisherVO;
    }

    @Override
    public int update(PublisherVO publisherVO) {
      int cnt = this.publisherDAO.update(publisherVO);
      return cnt;
    }

    @Override
    public int delete(int pub_no) {
      int cnt=this.publisherDAO.delete(pub_no);
      return cnt;
    }   
}

