package dev.mvc.event;

/*CREATE TABLE event(
    eventno                           NUMBER(10)     NOT NULL    PRIMARY KEY, 
    name                              VARCHAR2(300)    NOT NULL,
    whatevent                       VARCHAR2(2000)     NOT NULL, -- 이벤트 설명 페이지
    saleno                            NUMBER(10)     NOT NULL,
    rdate                             DATE     NOT NULL
);*/
public class EventVO {
private int eventno = 0;
/**이벤트 설명페이지 번호*/
private String name ="";
/**이벤트 이름*/
private int saleno = 0;
/**이벤트 구분 번호*/
private String whatevent = "";
private String rdate = "";
/**이벤트 생성일 */
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
public int getSaleno() {
  return saleno;
}
public void setSaleno(int saleno) {
  this.saleno = saleno;
}

public String getWhatevent() {
  return whatevent;
}
public void setWhatevent(String whatevent) {
  this.whatevent = whatevent;
}
public String getRdate() {
  return rdate;
}
public void setRdate(String rdate) {
  this.rdate = rdate;
}


}
