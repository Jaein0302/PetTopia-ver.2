package com.Pet_Topia.domain;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

@Component
@ConfigurationProperties(prefix = "my")
/*
	 application.properties에서 설정한 내용 중
	 my로 시작하는 키에대한 값을 필드에 주입합니다.
	 my.savefolder=c:/upload
	 my.sendfile=c:/Users/jhta/image/pencil2.png
*/
public class MySaveFolder {
	private String savefolder;
	private String sendfile;
	private String sendpass;
	private String code;

	public String getSendfile() {
		return sendfile;
	}

	public void setSendfile(String sendfile) {
		this.sendfile = sendfile;
	}

	public String getSavefolder() {
		return savefolder;
	}

	public void setSavefolder(String savefolder) {
		this.savefolder = savefolder;
	}

	public String getSendpass() {
		return sendpass;
	}

	public void setSendpass(String sendpass) {
		this.sendpass = sendpass;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

}
