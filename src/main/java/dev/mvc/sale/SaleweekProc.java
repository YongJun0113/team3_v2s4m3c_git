package dev.mvc.sale;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.sale.SaleweekProc")
public class SaleweekProc implements SaleweekProcInter {
  @Autowired
  private SaleweekDAOInter saleweekDAO; 
  
  public SaleweekProc() {
    System.out.println("--> SaleweekProc created.");
  }

  @Override
  public int create(SaleweekVO saleweekVO) {
  int cnt=this.saleweekDAO.create(saleweekVO);
    return cnt;
  }

  @Override
  public List<SaleweekVO> list_saleno_asc() {
    List<SaleweekVO> list = this.saleweekDAO.list_saleno_asc();
    return list;
  }

  @Override
  public SaleweekVO read(int saleno) {
    SaleweekVO saleweekVO=this.saleweekDAO.read(saleno);
    
    String name = saleweekVO.getName(); 
    String salesbook  = saleweekVO.getSalesbook();
    String saleperiod = saleweekVO.getSaleperiod();
    String contents = saleweekVO.getContents();
    
    saleweekVO.setName(name);
    saleweekVO.setSalesbook(salesbook);
    saleweekVO.setSaleperiod(saleperiod);
    saleweekVO.setContents(contents);
        
    return saleweekVO;
  }

  @Override
  public int update(SaleweekVO saleweekVO) {
    int cnt = this.saleweekDAO.update(saleweekVO);
    return cnt;
  }

  @Override
  public SaleweekVO read_update(int saleno) {
   SaleweekVO saleweekVO = this.saleweekDAO.read(saleno);
    return saleweekVO;
  }

  @Override
  public int passwd_check(HashMap hashMap) {
    int passwd_cnt = this.saleweekDAO.passwd_check(hashMap);
    return passwd_cnt;
  }

  @Override
  public int img_create(SaleweekVO saleweekVO) {
    int cnt=this.saleweekDAO.update_img(saleweekVO);
    return cnt;
  }

  @Override
  public int img_update(SaleweekVO saleweekVO) {
    int cnt=this.saleweekDAO.update_img(saleweekVO);
    return cnt;
  }

  @Override
  public int img_delete(SaleweekVO saleweekVO) {
    int cnt=this.saleweekDAO.update_img(saleweekVO);
    return cnt;
  }

  @Override
  public List<SaleweekVO> list_by_eventno(int eventno) {
    List<SaleweekVO> list=this.saleweekDAO.list_by_eventno(eventno);
    return list;
  }

  



  
  
  
  
  
  }
  

  
  
  
  

 

