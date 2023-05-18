package org.zerock.security.domain;

import java.util.Collection;
import java.util.stream.Collectors;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.zerock.domain.MemberVO;

import lombok.Getter;

@Getter
public class CustomUser extends User { // User 상속 (security 내의 userdetails의 USer)
	
	private static final long serialVersionUID = 1L;
	
	private MemberVO member;
	
	// Constructor Overloading (매개변수의 username 은 ID임!! spring의 username은 ID라고 생각하자!)
	public CustomUser(String username, String password, boolean enabled, boolean accountNonExpired,
						boolean credentialsNonExpired, boolean accountNonLocked,
						Collection<? extends GrantedAuthority> authorities) {
		super(username, password, authorities);
	}
	
	// Constructor Overloading
	public CustomUser(MemberVO vo) {
		// 부모(User) 생성자 호출             Chaining으로 연결됨 (vo.getAuthList() ~ toList())); 까지)
		super(vo.getUserid(), vo.getUserpw(), vo.getAuthList().stream()
				.map(auth -> new SimpleGrantedAuthority(auth.getAuth())).collect(Collectors.toList()));
				// getAuthList()로 도출된 auth list에서 하나 꺼내서 auth에 넣고, -> 우측에 넣어서 결과적으로 다시 List를 만듦
		this.member = vo;
	} 

}
