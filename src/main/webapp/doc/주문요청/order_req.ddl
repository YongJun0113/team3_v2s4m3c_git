DROP TABLE order_req CASCADE CONSTRAINTS;
DROP TABLE MEMBER CASCADE CONSTRAINTS;
DROP TABLE EBOOK CASCADE CONSTRAINTS;

-- �÷� �߰�
ALTER TABLE order_req ADD payid VARCHAR2(30);

/**********************************/
/* Table Name: �̺� */
/**********************************/
CREATE TABLE EBOOK(
		EB_NO                         		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		CATENO                        		NUMBER(10)		 NULL ,
		EB_TITLE                      		VARCHAR2(200)		 NOT NULL,
		EB_AUTHOR                     		VARCHAR2(100)		 NOT NULL,
		EB_PUBLISHER                  		VARCHAR2(50)		 NOT NULL,
		EB_PDATE                      		VARCHAR2(20)		 NULL ,
		EB_USEINFO                    		VARCHAR2(500)		 NULL ,
		EB_DEVICE                     		VARCHAR2(500)		 NOT NULL,
		EB_INFOR                      		CLOB(4000)		 NULL ,
		EB_PRICE                      		NUMBER(10)		 NOT NULL,
		EB_SALETOT                    		NUMBER(10)		 NULL ,
		EB_PAGE                       		NUMBER(10)		 NULL ,
		EB_FILE1                      		VARCHAR2(100)		 NULL ,
		EB_SIZE1                      		NUMBER(10)		 NULL ,
		EB_FILE2                      		VARCHAR2(100)		 NULL ,
		EB_SIZE2                      		NUMBER(10)		 NULL ,
		EB_THUMB                      		VARCHAR2(100)		 NULL ,
		WORD                          		VARCHAR2(300)		 NULL ,
		RDATE                         		DATE		 NOT NULL
);

COMMENT ON TABLE EBOOK is '�̺�';
COMMENT ON COLUMN EBOOK.EB_NO is '�̺� ��ȣ';
COMMENT ON COLUMN EBOOK.CATENO is 'ī�װ� ��ȣ';
COMMENT ON COLUMN EBOOK.EB_TITLE is '����';
COMMENT ON COLUMN EBOOK.EB_AUTHOR is '����';
COMMENT ON COLUMN EBOOK.EB_PUBLISHER is '���ǻ�';
COMMENT ON COLUMN EBOOK.EB_PDATE is '�Ⱓ��';
COMMENT ON COLUMN EBOOK.EB_USEINFO is '�̿�ȳ�';
COMMENT ON COLUMN EBOOK.EB_DEVICE is '�������';
COMMENT ON COLUMN EBOOK.EB_INFOR is '���� ����';
COMMENT ON COLUMN EBOOK.EB_PRICE is '�ǸŰ�';
COMMENT ON COLUMN EBOOK.EB_SALETOT is '�Ǹŷ�';
COMMENT ON COLUMN EBOOK.EB_PAGE is '������ ��';
COMMENT ON COLUMN EBOOK.EB_FILE1 is '�̺� ����';
COMMENT ON COLUMN EBOOK.EB_SIZE1 is '�̺� ���� ũ��';
COMMENT ON COLUMN EBOOK.EB_FILE2 is '���� �̹���';
COMMENT ON COLUMN EBOOK.EB_SIZE2 is '���� �̹��� ���� ũ��';
COMMENT ON COLUMN EBOOK.EB_THUMB is '�����';
COMMENT ON COLUMN EBOOK.WORD is '�˻���';
COMMENT ON COLUMN EBOOK.RDATE is '��� ��¥';


/**********************************/
/* Table Name: ȸ�� */
/**********************************/
CREATE TABLE MEMBER(
		M_NO                          		NUMBER(6)		 NOT NULL		 PRIMARY KEY,
		ID                            		VARCHAR2(20)		 NOT NULL,
		PASSWD                        		VARCHAR2(60)		 NOT NULL,
		MNAME                         		VARCHAR2(20)		 NOT NULL,
		EMAIL                         		VARCHAR2(60)		 NOT NULL,
		TEL                           		VARCHAR2(14)		 NOT NULL,
		ZIPCODE                       		VARCHAR2(5)		 NULL ,
		ADDRESS1                      		VARCHAR2(80)		 NULL ,
		ADDRESS2                      		VARCHAR2(50)		 NULL ,
		MDATE                         		DATE		 NOT NULL,
  CONSTRAINT SYS_C008370 UNIQUE (ID)
);

COMMENT ON TABLE MEMBER is 'ȸ��';
COMMENT ON COLUMN MEMBER.M_NO is 'ȸ�� ��ȣ';
COMMENT ON COLUMN MEMBER.ID is '���̵�';
COMMENT ON COLUMN MEMBER.PASSWD is '�н�����';
COMMENT ON COLUMN MEMBER.MNAME is '����';
COMMENT ON COLUMN MEMBER.EMAIL is '�̸���';
COMMENT ON COLUMN MEMBER.TEL is '��ȭ��ȣ';
COMMENT ON COLUMN MEMBER.ZIPCODE is '�����ȣ';
COMMENT ON COLUMN MEMBER.ADDRESS1 is '�ּ�1';
COMMENT ON COLUMN MEMBER.ADDRESS2 is '�ּ�2';
COMMENT ON COLUMN MEMBER.MDATE is '������';


/**********************************/
/* Table Name: �ֹ���û */
/**********************************/
CREATE TABLE order_req(
		order_no                    		NUMBER(10)		     NOT NULL		 PRIMARY KEY,
        payid                               VARCHAR2(30)         NOT NULL,
		payway                        		VARCHAR2(30)		 NOT NULL,
        price                                NUMBER(10)		     NOT NULL ,
		EB_NO                         		NUMBER(10)		     NULL ,
		user_id                             VARCHAR2(20)         NULL,
        rdate                         		DATE		         default sysdate,
        FOREIGN KEY (EB_NO) REFERENCES EBOOK (EB_NO),
        FOREIGN KEY (user_id) REFERENCES member (id)
);

COMMENT ON TABLE order_req is '�ֹ���û';
COMMENT ON COLUMN order_req.order_no is '�ֹ���ȣ';
COMMENT ON COLUMN order_req.payid is '������ȣ';
COMMENT ON COLUMN .payway is '�������';
COMMENT ON COLUMN order_req.price is '�����ݾ�';
COMMENT ON COLUMN order_req.rdate is '�����Ͻ�';
COMMENT ON COLUMN order_req.EB_NO is '�̺� ��ȣ';
COMMENT ON COLUMN order_req.user_id is 'ȸ�� ���̵�';


DROP SEQUENCE orderreq_seq;
-- īƮ ��ȣ�� ������ ������
CREATE SEQUENCE orderreq_seq
  START WITH 1              -- ���� ��ȣ
  INCREMENT BY 1          -- ������
  MAXVALUE 9999999999 -- �ִ밪: 9999999 --> NUMBER(7) ����
  CACHE 2                       -- 2���� �޸𸮿����� ���
  NOCYCLE;                     -- �ٽ� 1���� �����Ǵ� ���� ����    



-- ���
INSERT INTO order_req(order_no, payid, user_id, eb_no, payway, price)
VALUES (orderreq_seq.nextval,'200210219_121212','crm',11, '�ſ�ī��',12000);

INSERT INTO order_req(order_no, payid, user_id, eb_no, payway, price)
VALUES (orderreq_seq.nextval,'200210219_121213','crm',10, '�ſ�ī��',13300);

INSERT INTO order_req(order_no, payid, user_id, eb_no, payway, price)
VALUES (orderreq_seq.nextval,'200210219_121214','crm',9, '�ſ�ī��',14000);


-- ���
SELECT order_no, payid, user_id, eb_no, payway, price, rdate 
FROM order_req
ORDER BY rdate ASC;


-- ȸ��������: ���
select
 o.order_no, o.user_id, o.payid, o.eb_no, o.price, o.rdate,
 e.eb_no, e.eb_title, e.eb_thumb, e.eb_price, e.eb_file1
from order_req o
     inner join ebook e
         on o.eb_no = e.eb_no
where o.user_id = 'user2';
     
     
-- ��ȸ
SELECT order_no, user_id, eb_no, payway, price, rdate 
FROM order_req
WHERE order_no=1;


-- ����
UPDATE order_req 
SET payway='������'
WHERE order_no = 1;

-- ����
DELETE order_req
WHERE order_no=4;

DELETE FROM order_req;


COMMIT;

































































