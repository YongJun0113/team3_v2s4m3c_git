package dev.mvc.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


public interface MemberDAOInter {
  /**
   * 중복 아이디 검사
   * @param id
   * @return 중복 아이디 갯수
   */
  public int checkID(String id);
  
  /**
   * 회원 가입
   * @param memberVO
   * @return
   */
  public int create(MemberVO memberVO);
  
  /**
   * 목록
   * @return
   */
  public List<MemberVO> list();
  
  /**
   * 회원 조회
   * @param m_no
   * @return
   */
  public MemberVO read(int m_no);
  
  /**
   * 회원 정보 조회
   * @param id
   * @return
   */
  public MemberVO readById(String id);
  
  /**
   * 수정 처리
   * @param memberVO
   * @return
   */
  public int update(MemberVO memberVO);
  
  /**
   * 회원 삭제 처리
   * @param m_no
   * @return
   */
  public int delete(int m_no);
  
  /**
   * 현재 패스워드 검사
   * @param map
   * @return 0: 일치하지 않음, 1: 일치함
   */
  public int passwd_check(HashMap<String, Object> map);
  
  /**
   * 패스워드 변경
   * @param map
   * @return 변경된 패스워드 갯수
   */
  public int passwd_update(HashMap<String, Object> map);
  
  /**
   * 로그인 
   * @param map
   * @return
   */
  public int login(Map<String, Object> map);
  
}