package dev.mvc.qnagrp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.qnagrp.QnagrpProc")
  public class QnagrpProc implements QnagrpProcInter {
    @Autowired
    private QnagrpDAOInter QnagrpDAO; 
    
    public QnagrpProc() {
      System.out.println("--> QnagrpProc created.");
    }

    @Override
    public int create(QnagrpVO qnagrpVO) {
      int cnt =this.QnagrpDAO.create(qnagrpVO);
      return cnt;
    }

    @Override
    public List<QnagrpVO> list_qnagrpno_asc() {
      List<QnagrpVO> list=this.QnagrpDAO.list_qnagrpno_asc();
      return list;
    }

    @Override
    public int update(QnagrpVO qnagrpVO) {
      int cnt = this.QnagrpDAO.update(qnagrpVO);
      return cnt;
    }

    @Override
    public int delete(int qnagrpno) {
      int cnt = this.QnagrpDAO.delete(qnagrpno);
      return 0;
    }  
    
  }
  
