package dev.mvc.publisher;

import org.springframework.web.multipart.MultipartFile;

/*CREATE TABLE publisher(
    pub_no                            NUMBER(10)     NOT NULL    PRIMARY KEY,
    name                              VARCHAR2(100)    NOT NULL,
    http                              VARCHAR2(100)    NOT NULL,
    etc                               VARCHAR2(1000)     NOT NULL,
    file1                                   VARCHAR(100)          NULL,
    thumb1                              VARCHAR(100)          NULL,
    size1                                 NUMBER(10)      DEFAULT 0 NULL
    rdate                              DATE     NOT NULL    -- ��¥ �������ϱ�
        );

*/
public class PublisherVO {
  
  /** ���ǻ� ��ȣ */
  private int pub_no;
  /** ���ǻ� ��ü �̸� */
  private String name = "";
  /** Ȩ������ �ּ� */
  private String http = "";
  /** ��Ÿ ���� */
  private String etc ="";
  /** �̹��� */
  private String file1="";
  /** preview �̹��� preview */
  private String thumb1="";
  /** ����� ���� ������ */
  private long size1;
  /**df*/
  private String size1_label;
  
  /**�̺�Ʈ ������ */
  private String rdate = "";
  /**
   *     <%-- ���� �÷���: fiel1, Spring File ��ü ����: fiel1MF --%>
          <input type='file' class="form-control" name='file1MF' id='file1MF' 
                    value='' placeholder="���� ����" multiple="multiple">
   *  �̹��� MultipartFile */
  private MultipartFile file1MF;
  
  
  public int getPub_no() {
    return pub_no;
  }

  public void setPub_no(int pub_no) {
    this.pub_no = pub_no;
  }

  public String getName() {
    return name;
  }

  public MultipartFile getFile1MF() {
    return file1MF;
  }

  public void setFile1MF(MultipartFile file1mf) {
    file1MF = file1mf;
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

  public void setName(String name) {
    this.name = name;
  }

  public String getHttp() {
    return http;
  }

  public void setHttp(String http) {
    this.http = http;
  }

  public String getEtc() {
    return etc;
  }

  public String getSize1_label() {
    return size1_label;
  }

  public void setSize1_label(String size1_label) {
    this.size1_label = size1_label;
  }

  public void setEtc(String etc) {
    this.etc = etc;
  }

  public String getRdate() {
    return rdate;
  }

  public void setRdate(String rdate) {
    this.rdate = rdate;
  }
  
}

