package dev.mvc.reply;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import dev.mvc.tool.Tool;


@Component("dev.mvc.reply.ReplyProc")
public class ReplyProc implements ReplyProcInter{
  
  @Autowired
  private ReplyDAOInter replyDAO;
  
  public ReplyProc() {
    System.out.println("--> ReplyProc created."); 
  }

  @Override
  public int create(ReplyVO replyVO) {
    int cnt = this.replyDAO.create(replyVO);
    return cnt;
  }

  @Override
  public List<ReplyVO> list_replyno_desc() {
    List<ReplyVO> list = this.replyDAO.list_replyno_desc();
    return list;
  }
  
  @Override
  public List<ReplyMemberVO> list_member_join() {
    List<ReplyMemberVO> list = replyDAO.list_member_join();
    
    // 특수 문자 변경
    for (ReplyMemberVO replyMemberVO:list) {
      String content = replyMemberVO.getReply_cont();
      content = Tool.convertChar(content);
      replyMemberVO.setReply_cont(content);
    }
    
    return list;
  }
  
  @Override
  public ReplyVO read(int reply_no) {
    ReplyVO replyVO = this.replyDAO.read(reply_no);
    return replyVO;
  }

  @Override
  public int delete(int reply_no) {
    int cnt = this.replyDAO.delete(reply_no);
    return cnt;
  }

}


