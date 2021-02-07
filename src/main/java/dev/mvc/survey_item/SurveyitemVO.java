package dev.mvc.survey_item;

/*

  CREATE TABLE survey_item(
      survey_no                         NUMBER(10)     NOT NULL,
      item_no                         NUMBER(10)     NOT NULL    PRIMARY KEY,
      item_title                        VARCHAR2(200)    NOT NULL,
      seqno                             NUMBER(10)     NOT NULL,
    FOREIGN KEY (survey_no) REFERENCES survey (survey_no)
  );

*/
public class SurveyitemVO {

    private int item_no;
    private int survey_no;
    private int seqno;
    private String item_title="";
    
    public int getItem_no() {
      return item_no;
    }
    public void setItem_no(int item_no) {
      this.item_no = item_no;
    }
    public int getSurvey_no() {
      return survey_no;
    }
    public void setSurvey_no(int survey_no) {
      this.survey_no = survey_no;
    }
    public String getItem_title() {
      return item_title;
    }
    public void setItem_title(String item_title) {
      this.item_title = item_title;
    }
    public int getSeqno() {
      return seqno;
    }
    public void setSeqno(int seqno) {
      this.seqno = seqno;
    }
    
  
  
  
}
