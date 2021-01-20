package dev.mvc.qnagrp;

public class QnagrpVO {
  /*CREATE TABLE qnagrp(
      qnagrpno NUMBER(10) NOT NULL PRIMARY KEY,
      name VARCHAR2(50) NOT NULL,
      seqno NUMBER(7) DEFAULT 0 NOT NULL,
      visible CHAR(1) DEFAULT 'Y' NOT NULL,
      rdate DATE NOT NULL
  );*/
  /** 큐엔에이 그룹 번호 */
   private int qnagrpno =0;
     /**이벤트 이름  */
    private String name ="";
    /** 출력 번호 */
   private int seqno =0;
   /**출력 상향,하향  */
  private String visible ="";
  /**날짜  */
  private String rdate ="";
  
  public int getQnagrpno() {
    return qnagrpno;
  }
  public void setQnagrpno(int qnagrpno) {
    this.qnagrpno = qnagrpno;
  }
  public String getName() {
    return name;
  }
  public void setName(String name) {
    this.name = name;
  }
  public int getSeqno() {
    return seqno;
  }
  public void setSeqno(int seqno) {
    this.seqno = seqno;
  }
  public String getVisible() {
    return visible;
  }
  public void setVisible(String visible) {
    this.visible = visible;
  }
  public String getRdate() {
    return rdate;
  }
  public void setRdate(String rdate) {
    this.rdate = rdate;
  }


  
}
