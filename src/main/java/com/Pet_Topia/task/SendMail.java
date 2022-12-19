package com.Pet_Topia.task;

import java.io.File;
import javax.mail.internet.MimeMessage;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Component;

import com.Pet_Topia.domain.MailVO;
import com.Pet_Topia.domain.MySaveFolder;

@Component
public class SendMail {

	private static final Logger Logger = LoggerFactory.getLogger(SendMail.class);

	@Autowired
	private JavaMailSenderImpl mailSender;
	
	@Autowired
	private MySaveFolder mysavefolder;

	public void sendMail(MailVO vo) {
		String sendfile = mysavefolder.getSendfile();
		String sendpass = mysavefolder.getSendpass();
		String code = mysavefolder.getCode();

		// 익명 클래스
		MimeMessagePreparator mp = new MimeMessagePreparator() {

			@Override
			public void prepare(MimeMessage mimeMessage) throws Exception {
				
				MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
				helper.setFrom(vo.getFrom());
				helper.setTo(vo.getTo());
				helper.setSubject(vo.getSubject());
				
				String content = "<img src='cid:Home'>" + vo.getContent();
				helper.setText(content, true);
				
				if(vo.getSubject()=="반려동물 서비스 제휴 사이트 <펫토피아> 회원 가입을 축하드립니다!") {
				FileSystemResource file = new FileSystemResource(new File(sendfile));
				//addInline메서드의 첫번째 메서드에는 cid(content id)를 지정합니다.
				helper.addInline("Home", file);
				
				//3. 파일을 첨부해서 보내는 경우
				// 첫번째 인자 : 첨부된 파일의 이름입니다.
				// 두번째 인자 : 첨부파일
				helper.addAttachment("Welcome_to_Pet_Topia.jpg", file);
				
				}else if(vo.getSubject()=="<펫토피아> 임시 비밀번호 발송 메일"){
					FileSystemResource file = new FileSystemResource(new File(sendpass));
					helper.addInline("Home", file);
					helper.addAttachment("Pet_Topia_pass.jpg", file);
				}else{
					FileSystemResource file = new FileSystemResource(new File(code));
					helper.addInline("Home", file);
					helper.addAttachment("Pet_Topia_code.jpg", file);
				}
			}//prepare() end
		};//new MimeMessagePreparator()
	
		mailSender.send(mp); //메일 전송합니다.
		Logger.info("메일 전송했습니다.");
	}//sendMail(MailVO vo)
}//class SendMail
