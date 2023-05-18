package org.zerock.security;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({
  "file:src/main/webapp/WEB-INF/spring/root-context.xml",
  "file:src/main/webapp/WEB-INF/spring/security-context.xml" // 새로 만든 security-context.xml 추가해야 됨
  })

public class MemberTests {

  @Setter(onMethod_ = @Autowired)
  private PasswordEncoder pwencoder; // PasswordEncoder 주입
  
  @Setter(onMethod_ = @Autowired)
  private DataSource ds; // DataSource 주입
  
  @Test
  public void testInsertMember() { // tbl_member에 입력

    String sql = "insert into tbl_member(userid, userpw, username) values (?,?,?)";
    
    for(int i = 0; i < 100; i++) { // 100명 정보 입력
      
      Connection con = null;
      PreparedStatement pstmt = null; // 동적 쿼리
      
      try {
        con = ds.getConnection(); // Connection 객체 생성
        pstmt = con.prepareStatement(sql); // prepareStatement 객체 생성
        
        pstmt.setString(2, pwencoder.encode("pw" + i)); // ★ encode() : CustomNoOpPasswordEncoder에 오버라이딩 되어 있는 encode() 사용
        
        if(i < 80) { // 80번째 사용자까지는 일반사용자(user)로 등록
          
          pstmt.setString(1, "user"+i);
          pstmt.setString(3,"일반사용자"+i);
          
        } else if (i < 90) { // 81~90번째 사용자는 운영자(manager)로 등록
          
          pstmt.setString(1, "manager"+i);
          pstmt.setString(3,"운영자"+i);
          
        } else { // 91~100번째 사용자는 관리자(admin)로 등록
          
          pstmt.setString(1, "admin"+i);
          pstmt.setString(3,"관리자"+i);
          
        }
        
        pstmt.executeUpdate(); // insert 쿼리문 실행
        
      } catch(Exception e) {
    	  
        e.printStackTrace();
        
      } finally {
    	  
        if(pstmt != null) { try { pstmt.close();  } catch(Exception e) {} }
        if(con != null) { try { con.close();  } catch(Exception e) {} }
        
      }
    }//end for
  }
  
  @Test
  public void testInsertAuth() { // tbl_member_auth 테이블에도 입력
    
    
    String sql = "insert into tbl_member_auth (userid, auth) values (?,?)";
    
    for(int i = 0; i < 100; i++) {
      
      Connection con = null;
      PreparedStatement pstmt = null;
      
      try {
        con = ds.getConnection();
        pstmt = con.prepareStatement(sql);
      
        
        if(i < 80) {
          
          pstmt.setString(1, "user"+i);
          pstmt.setString(2,"ROLE_USER");
          
        } else if (i < 90) {
          
          pstmt.setString(1, "manager"+i);
          pstmt.setString(2,"ROLE_MANAGER");
          
        } else {
          
          pstmt.setString(1, "admin"+i);
          pstmt.setString(2,"ROLE_ADMIN");
          
        }
        
        pstmt.executeUpdate();
        
      } catch(Exception e) {
    	  
        e.printStackTrace();
        
      } finally {
    	  
        if(pstmt != null) { try { pstmt.close();  } catch(Exception e) {} }
        if(con != null) { try { con.close();  } catch(Exception e) {} }
        
      }
    }//end for
  }

  
}