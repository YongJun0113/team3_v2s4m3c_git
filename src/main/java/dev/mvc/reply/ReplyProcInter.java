package dev.mvc.reply;

import java.util.List;

import dev.mvc.ncate.NcateVO;

public interface ReplyProcInter {
  /**
   * ��� ���
   * @param replyVO
   * @return
   */
  public int create(ReplyVO replyVO);
  
  /**
   * ��� ���
   * @return
   */
  public List<ReplyVO> list_replyno_desc();
  
  public List<ReplyMemberVO> list_member_join();
  
  /**
   * ��ȸ, ������
   * @param reply_no 
   * @return
   */
  public ReplyVO read(int reply_no);
 
  /**
   * ��� ����
   * @param reply_no
   * @return
   */
  public int delete(int reply_no);
  

}
