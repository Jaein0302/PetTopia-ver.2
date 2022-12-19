package com.Pet_Topia.aop;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

@Component
public class LogAdvice {
	
	private static final Logger Logger = LoggerFactory.getLogger(LogAdvice.class);
	
	//LogAdvice 클래스의 공통 메서드를 aop에서 Advice라고 합니다.
	public void beforeLog() {
		Logger.info("[LogAdvice:공통메서드 입니다.]");
	}
	
	
}
