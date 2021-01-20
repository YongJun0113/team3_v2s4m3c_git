package dev.mvc.sale;

import org.springframework.web.multipart.MultipartFile;

/*
CREATE TABLE saleweek(
    saleno                            NUMBER(10)     NOT NULL    PRIMARY KEY,
    name                              VARCHAR2(300)    NOT NULL,
    salesbook                         VARCHAR2(300)    NOT NULL,
    sale                              VARCHAR2(300)    NOT NULL,
    saleperiod                        VARCHAR2(300)    NOT NULL,
    eventno                           NUMBER(10)     NOT NULL,
    contents                          VARCHAR2(50)     NOT NULL,
    rdate                             DATE     NOT NULL,
  FOREIGN KEY (eventno) REFERENCES event (eventno)
);
*/
public class SaleweekVO {
 /** 오늘의 책할인 번호*/
  private int saleno=0;
 /** 이벤트 번호*/
  private int eventno=0;
 /**이벤트 이름*/ 
  private String name="";
  /**이벤트 할인 책 이름*/
  private String salesbook="";
  /**할인 율 */
  private String sale="";
  /**세일 기간*/
  private String saleperiod="";
  /** 책 분류(만화책, 소설책)*/
  private String contents="";
  /**등록 날짜*/
  private String rdate;
  /**비밀번호*/
  private String passwd ="";
  /** 이미지 */
  private String file1="";
  /** preview 이미지 preview */
  private String thumb1="";
  /** 저장된 파일 사이즈 */
  private long size1;
  
  private String recom;
  
  /**
   *     <%-- 실제 컬럼명: fiel1, Spring File 객체 대응: fiel1MF --%>
          <input type='file' class="form-control" name='file1MF' id='file1MF' 
                    value='' placeholder="파일 선택" multiple="multiple">
   *  이미지 MultipartFile */
  private MultipartFile file1MF;
  
  public int getSaleno() {
    return saleno;
  }
  public void setSaleno(int saleno) {
    this.saleno = saleno;
  }
  public int getEventno() {
    return eventno;
  }
  public void setEventno(int eventno) {
    this.eventno = eventno;
  }
  public String getName() {
    return name;
  }
  public void setName(String name) {
    this.name = name;
  }
  public String getSalesbook() {
    return salesbook;
  }
  public void setSalesbook(String salesbook) {
    this.salesbook = salesbook;
  }
  public String getSale() {
    return sale;
  }
  public void setSale(String sale) {
    this.sale = sale;
  }
  public String getSaleperiod() {
    return saleperiod;
  }
  public void setSaleperiod(String saleperiod) {
    this.saleperiod = saleperiod;
  }
  public String getContents() {
    return contents;
  }
  public void setContents(String contents) {
    this.contents = contents;
  }
  public String getRdate() {
    return rdate;
  }
  public void setRdate(String rdate) {
    this.rdate = rdate;    
  }
  public String getPasswd() {
    return passwd;
  }
  public void setPasswd(String passwd) {
    this.passwd = passwd;
  }
  public String getFile1() {
    return file1;
  }
  public void setFile1(String file1) {
    this.file1 = file1;
  }
  public String getThumb1() {
    return thumb1;
  }
  public void setThumb1(String thumb1) {
    this.thumb1 = thumb1;
  }
  public long getSize1() {
    return size1;
  }
  public void setSize1(long size1) {
    this.size1 = size1;
  }
  public MultipartFile getFile1MF() {
    return file1MF;
  }
  public void setFile1MF(MultipartFile file1mf) {
    file1MF = file1mf;
  }
  public String getRecom() {
    return recom;
  }
  public void setRecom(String recom) {
    this.recom = recom;
  }
 
  
  
}





