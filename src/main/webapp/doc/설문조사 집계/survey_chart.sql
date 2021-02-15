-- ���̺� ����
DROP TABLE survey_chart CASCADE CONSTRAINTS;
DROP TABLE survey_item CASCADE CONSTRAINTS;
DROP TRIGGER uptodate_surveychart;

-- ���� ���� : 1.survey_item -> 2.survey_chart -> 3.uptodate_surveychart Ʈ����
/**********************************/
/* Table Name: �������� �׸� */
/**********************************/
CREATE TABLE survey_item(
		survey_no                     		NUMBER(10)		 NOT NULL,
		item_no                 		    NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		item_title                    		VARCHAR2(200)		 NOT NULL,
        seqno                     		    NUMBER(10)		DEFAULT 1 NOT NULL,
        rcnt                                NUMBER(10)      DEFAULT 0  NOT NULL,
  FOREIGN KEY (survey_no) REFERENCES survey (survey_no)
);

COMMENT ON TABLE survey_item is '���� �׸�';
COMMENT ON COLUMN survey_item.item_no is '���� �׸� ��ȣ';
COMMENT ON COLUMN survey_item.survey_no is '���� ��ȣ';
COMMENT ON COLUMN survey_item.seqno is '����';
COMMENT ON COLUMN survey_item.item_title is '���� �׸� ����';
COMMENT ON COLUMN survey_item.rcnt is '����';


DROP SEQUENCE surveyitem_seq;
CREATE SEQUENCE surveyitem_seq
  START WITH 1              -- ���� ��ȣ
  INCREMENT BY 1          -- ������
  MAXVALUE 9999999999 -- �ִ밪: 9999999 --> NUMBER(10) ����
  CACHE 2                       -- 2���� �޸𸮿����� ���
  NOCYCLE;                     -- �ٽ� 1���� �����Ǵ� ���� ����




/**********************************/
/* Table Name: ���� ���� */
/**********************************/
CREATE TABLE survey_chart(
        item_no                             NUMBER(10)		 NOT NULL PRIMARY KEY,
		survey_no                     		NUMBER(10)		 NOT NULL,
		item                    		VARCHAR2(200)    NOT NULL,
        seqno                     		    NUMBER(10)		DEFAULT 1 NOT NULL,
        cnt                                NUMBER(10)       DEFAULT 0  NOT NULL,
        FOREIGN KEY (survey_no) REFERENCES survey (survey_no)
);

COMMENT ON TABLE survey_chart is '���� ���� ';
COMMENT ON COLUMN survey_chart.item_no is '���� �׸� ��ȣ';
COMMENT ON COLUMN survey_chart.survey_no is '���� ��ȣ';
COMMENT ON COLUMN survey_chart.item is '�׸�';
COMMENT ON COLUMN survey_chart.cnt is '����';
COMMENT ON COLUMN survey_chart.seqno is '����';

-- survey_item�� ���ڵ带 survey_chart�� ����
INSERT INTO survey_chart(item_no,item,survey_no) 
SELECT item_no,item_title,survey_no
FROM survey_item;
/*********************************************************/
/* ��         Trigger Name: uptodate_surveychart      ��  */
/*********************************************************/
DROP TRIGGER uptodate_surveychart;
-- �����׸� ���̺�� ���� ���� ���̺��� ����ȭ
CREATE OR REPLACE TRIGGER uptodate_surveychart
AFTER DELETE OR INSERT OR UPDATE
ON survey_item
FOR EACH ROW
DECLARE
BEGIN
 if inserting then
    insert into survey_chart(item_no, survey_no, item) 
    values (:NEW.item_no , :NEW.survey_no ,:NEW.item_title);
 elsif updating then
  update survey_chart 
  set   cnt   = cnt + :NEW.rcnt,
        seqno = :NEW.seqno,
        item = :NEW.item_title
  where item_no = :OLD.item_no;
 elsif deleting then
  delete from survey_chart
  where item_no = :OLD.item_no;
 else
   null;
 end if;
END;

COMMIT;

-- ���
INSERT INTO survey_item(survey_no, item_no, item_title)
VALUES(1, surveyitem_seq.nextval,'�׷���');

INSERT INTO survey_item(survey_no, item_no, item_title)
VALUES(1, surveyitem_seq.nextval,'�ƴϴ�');

INSERT INTO survey_item(survey_no, item_no, item_title)
VALUES(6, surveyitem_seq.nextval,'���� �׷��� �ʴ�');

INSERT INTO survey_item(survey_no, item_no, item_title)
VALUES(6, surveyitem_seq.nextval,'�׷��� ���� ���̴�');

INSERT INTO survey_item(survey_no, item_no, item_title)
VALUES(6, surveyitem_seq.nextval,'�����̴�');

INSERT INTO survey_item(survey_no, item_no, item_title)
VALUES(6, surveyitem_seq.nextval,'�׷� ���̴�.');

INSERT INTO survey_item(survey_no, item_no, item_title)
VALUES(6, surveyitem_seq.nextval,'�ſ� �׷���');

INSERT INTO survey_item(survey_no, item_no, item_title)
VALUES(6, surveyitem_seq.nextval, '');

INSERT INTO survey_item(survey_no, item_no, item_title)
VALUES(6, surveyitem_seq.nextval, '2)�ƴϿ�');

INSERT INTO survey_item(survey_no, item_no, item_title)
VALUES(1, surveyitem_seq.nextval, '1');


--���
SELECT survey_no, item_no, item, cnt
FROM survey_chart
ORDER BY item_no ASC, survey_no DESC;

SELECT survey_no, item_no, item_title, rcnt
FROM survey_item 
ORDER BY item_no, survey_no DESC;

commit;

--��ȸ
SELECT survey_no, item_no, item_title
FROM survey_item 
WHERE item_no=2;

--����
UPDATE survey_item 
SET item_title='��', seqno=2
WHERE item_no=2;

--����
DELETE FROM survey_item
WHERE item_no=7;

DELETE FROM survey_item;

-- ���� �� ����
UPDATE survey_item 
SET rcnt = rcnt + 1 
WHERE item_no=1;

-- ���� �� ����
UPDATE survey_item 
SET rcnt = rcnt - 1 
WHERE item_no=1;





DELETE FROM survey_chart;





-- ���
SELECT item_no, item_title, rcnt, survey_no
FROM survey_chart
ORDER BY item_no ASC;
  
-- Ư�� ������ ���� ������ ��ȸ
SELECT item_no, item_title, rcnt, survey_no
FROM survey_chart
WHERE survey_no=7;
  
COMMIT; 
  
  
  
  
  
  
  
  