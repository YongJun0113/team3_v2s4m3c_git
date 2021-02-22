package dev.mvc.reply;

import java.util.List;

import dev.mvc.ncate.NcateVO;

public interface ReplyProcInter {
  /**
   * ´ñ±Û µî·Ï
   * @param replyVO
   * @return
   */
  public int create(ReplyVO replyVO);
  
  /**
   * ´ñ±Û ¸ñ·Ï
   * @return
   */
  public List<ReplyVO> list_replyno_desc();
  
  public List<ReplyMemberVO> list_member_join();
  
  /**
   * Á¶È¸, ¼öÁ¤Æû
   * @param reply_no 
   * @return
   */
  public ReplyVO read(int reply_no);
 
  /**
   * ´ñ±Û »èÁ¦
   * @param reply_no
   * @return
   */
  public int delete(int reply_no);
  

}
