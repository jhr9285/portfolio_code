package org.zerock.security;

import org.springframework.security.crypto.password.PasswordEncoder;

import lombok.extern.log4j.Log4j;

@Log4j
public class CustomNoOpPasswordEncoder implements PasswordEncoder { // 암호화 하지 않는 Encoder라는 의미의 네이밍 (테스트)
	
	// rawPassword : 사용자가 입력한 암호화 전 비밀번호
	// encodedPassword : 암호화 완료되어 DB에 저장된 비밀번호
	
	@Override // ★ encode() : 사용자가 입력한 rawPassword를 암호화 - 회원가입 할 때부터 사용해야 됨
	public String encode(CharSequence rawPassword) {
		
		log.warn("before encode: " + rawPassword);
		
		// 비밀번호를 암호화하는 코드 작성하는 위치
		// (지금은 아무것도 입력되지 않아서 암호화 X, rawPassword 그대로 리턴)
		
		return rawPassword.toString();
	}

	@Override 	// ★ matches() : rawPassword와 encodedPassword의 일치 여부 확인 
	public boolean matches(CharSequence rawPassword, String encodedPassword) {
		
		log.warn("matches: " + rawPassword + " | " + encodedPassword);
		
		return rawPassword.toString().equals(encodedPassword); // 같으면 true, 다르면 false
	} 
	
	// 지금은 암호화를 하지 않기 때문에 matches 결과가 무조건 true겠지만,
	// 실제로는 암호화 전 비밀번호와 암호화 후 비밀번호로 반드시 비교를 해야 된
}
