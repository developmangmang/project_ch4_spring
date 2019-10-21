package com.ch4.spring;

import java.util.Date;
import java.util.Map;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SendMail {
	String from = "lhn1301@naver.com";// 보내는 사람 메일 주소
	String username = "lhn1301";// 아이디
	String password = "kosmo!!11";// 비밀번호

	public void sendMail(Map<String, Object> pMap) throws Exception {
		// Properties 설정
		// 프로퍼티 값 인스턴스 생성과 기본세션(SMTP 서버 호스트 지정)
		Properties props = new Properties();
		// 설정
		props.put("mail.transport.protocol", "smtp");// 프로토콜 설정
		props.put("mail.smtp.host", "smtp.naver.com");
		props.put("mail.smtp.port", "465");// gmail SMTP 서비스 포트 설정
		props.put("mail.smtp.ssl.enable", true);
		props.put("mail.smtp.ssl.trust", "smtp.naver.com");
		props.put("mail.smtp.auth", true);
		Session mailSession = Session.getDefaultInstance(props, new Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password);
			}
		});
		mailSession.setDebug(true);
		try {
			// create a message
			Message msg = new MimeMessage(mailSession);
			// set the from and to address
			msg.setFrom(new InternetAddress(from));// 보내는 사람 설정
			msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(pMap.get("q_mail").toString(), false));// 받는
																														// 사람설정
			// Setting the Subject and Content Type
			msg.setSubject(pMap.get("q_title").toString());// 제목
			msg.setText(pMap.get("q_content").toString());// 내용
			msg.setSentDate(new Date());// 보내는 날짜 설정
			Transport.send(msg);// 메일 보내기

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
