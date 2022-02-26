package com.mem.model;

import java.io.UnsupportedEncodingException;
import java.nio.charset.StandardCharsets;
import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.NoSuchProviderException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.mail.internet.MimeUtility;

public class MailService {
	private final static String HOST = "smtp.gmail.com";
	private final static String AUTH = "true";
	private final static String PORT = "587";
	private final static String STARTTLE_ENABLE = "true";
	
	/**
	 * 注册成功后,向用户发送帐户激活链接的邮件String recipients, String mailSubject, String mailBody
	 * @param user 未激活的用户
	 */
	public static void sendAccountActivateEmail(MemVO memVO) {
//		Session session = getSession();
//		MimeMessage message = new MimeMessage(session);
//		try {
//			message.setSubject("帐户激活邮件");
////			message.setSentDate(new Date());
//			message.setFrom(new InternetAddress(myGmail));
//			message.setRecipient(RecipientType.TO, new InternetAddress(user.getEmail()));
//			message.setContent("<a href='" + GenerateLinkUtils.generateActivateLink(user)+"'>点击激活帐户</a>","text/html;charset=utf-8");
//			// 发送邮件
//			Transport.send(message);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
		
//		   try {
			   // 設定使用SSL連線至 Gmail smtp Server
			   Properties props = new Properties();
			   props.put("mail.smtp.host", HOST);
				props.put("mail.smtp.auth", AUTH);
				props.put("mail.smtp.port", PORT);
				props.put("mail.smtp.starttls.enable", STARTTLE_ENABLE);
				props.put("mail.smtp.ssl.trust", HOST);
				props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");

	       // ●設定 gmail 的帳號 & 密碼 (將藉由你的Gmail來傳送Email)
	       // ●須將myGmail的【安全性較低的應用程式存取權】打開
		    final String myGmail = "oliviayuyuwu@gmail.com";
		  
		     final String myGmail_password = "dltzvvbwnmfnxjcr";
		     
		     
		     
			   Session session = Session.getInstance(props, new Authenticator() {
				   protected PasswordAuthentication getPasswordAuthentication() {
					   return new PasswordAuthentication(myGmail, myGmail_password);
				   }
			   });

			   Message message = new MimeMessage(session);
//			   message.setFrom(new InternetAddress(myGmail));
//			   message.setRecipients(Message.RecipientType.TO,InternetAddress.parse(memVO.getMem_acc()));
				try {
					
					
				
//					設定Email Message start

//					設定寄件人、收件人、副本、主旨
					message.setSentDate(new Date());
					message.setHeader("Content-Type", "text/html; charset=UTF-8");
					message.setFrom(new InternetAddress(myGmail));
					message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(memVO.getMem_acc()));
//					message.addRecipients(Message.RecipientType.CC, InternetAddress.parse(recipientCcs));
//		          https://javaee.github.io/javamail/docs/api/javax/mail/internet/MimeUtility.html#encodeText-java.lang.String-java.lang.String-java.lang.String- (第三個參數參考API文件)
					message.setSubject(MimeUtility.encodeText("我家門前有塊地｜信箱驗證郵件", StandardCharsets.UTF_8.toString(), "B"));

//					first part (text)
					MimeBodyPart messageBody = new MimeBodyPart();
					messageBody.setContent("親愛的會員 "+memVO.getMem_nickname()+" 您好"+"<br>"+"<a href='" + GenerateLinkUtils.generateActivateLink(memVO)+"'>請點擊此連結進行驗證</a>", "text/html; charset=UTF-8");

					Multipart multipart = new MimeMultipart();
					multipart.addBodyPart(messageBody);

////		          second part (the image) 可根據自己需要決定是否要加這段
//					File file = new File("picture/20211214151834.jpg");
//					MimeBodyPart messageImgBody = new MimeBodyPart();
//					DataSource fds = new FileDataSource(file);
		//
//					messageImgBody.setDataHandler(new DataHandler(fds));
//					messageImgBody.setHeader("Content-ID", "<image>");
//					messageImgBody.setFileName(file.getName());
		//
////		          add image to the multipart
//					multipart.addBodyPart(messageImgBody);

					message.setContent(multipart);

//		   		寄出email
					Transport transport = session.getTransport("smtp");
					try {
						transport.connect();
						transport.sendMessage(message, message.getAllRecipients());
						 System.out.println("傳送成功!");
					} finally {
						transport.close();
					}

				} catch (AddressException e) {
					 System.out.println("傳送失敗!");
					e.printStackTrace();
				} catch (UnsupportedEncodingException e) {
					 System.out.println("傳送失敗!");
					e.printStackTrace();
				} catch (NoSuchProviderException e) {
					 System.out.println("傳送失敗!");
					e.printStackTrace();
				} catch (MessagingException e) {
					 System.out.println("傳送失敗!");
					e.printStackTrace();
				}
//			   //設定信中的主旨  
//			   message.setSubject("我家門前有塊地｜信箱驗證郵件");
//			   //設定信中的內容 
////			   message.setText(messageText);
//			   
//			   message.setContent("親愛的會員 "+memVO.getMem_nickname()+" 您好"+"<br>"+"<a href='" + GenerateLinkUtils.generateActivateLink(memVO)+"'>請點擊此連結進行驗證</a>","text/html;charset=utf-8");
//
//			   Transport.send(message);
//			   System.out.println("傳送成功!");
//	     }catch (MessagingException e){
//		     System.out.println("傳送失敗!");
//		     e.printStackTrace();
//	     }
		
		
		
	}
	
	
	
	
	
//	/**
//	 * 发送重设密码链接的邮件
//	 */
	public static void sendResetPasswordEmail(MemVO memVO) {
//		Session session = getSession();
//		MimeMessage message = new MimeMessage(session);
//		try {
//			message.setSubject("找回您的帐户与密码");
//			message.setSentDate(new Date());
//			message.setFrom(new InternetAddress(myGmail));
//			message.setRecipient(RecipientType.TO, new InternetAddress(user.getEmail()));
//			message.setContent("要使用新的密码, 请使用以下链接启用密码:<br/><a href='" + GenerateLinkUtils.generateResetPwdLink(user) +"'>点击重新设置密码</a>","text/html;charset=utf-8");
//			// 发送邮件
//			Transport.send(message);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
	

		   // 設定使用SSL連線至 Gmail smtp Server
		   Properties props = new Properties();
		   props.put("mail.smtp.host", HOST);
			props.put("mail.smtp.auth", AUTH);
			props.put("mail.smtp.port", PORT);
			props.put("mail.smtp.starttls.enable", STARTTLE_ENABLE);
			props.put("mail.smtp.ssl.trust", HOST);
			props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
     // ●設定 gmail 的帳號 & 密碼 (將藉由你的Gmail來傳送Email)
     // ●須將myGmail的【安全性較低的應用程式存取權】打開
	    final String myGmail = "oliviayuyuwu@gmail.com";
	  
	     final String myGmail_password = "dltzvvbwnmfnxjcr";
		   Session session = Session.getInstance(props, new Authenticator() {
			   protected PasswordAuthentication getPasswordAuthentication() {
				   return new PasswordAuthentication(myGmail, myGmail_password);
			   }
		   });

		
		   Message message = new MimeMessage(session);
//		   message.setFrom(new InternetAddress(myGmail));
//		   message.setRecipients(Message.RecipientType.TO,InternetAddress.parse(memVO.getMem_acc()));
			try {
				
				
			
//				設定Email Message start

//				設定寄件人、收件人、副本、主旨
				message.setSentDate(new Date());
				message.setHeader("Content-Type", "text/html; charset=UTF-8");
				message.setFrom(new InternetAddress(myGmail));
				message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(memVO.getMem_acc()));
//				message.addRecipients(Message.RecipientType.CC, InternetAddress.parse(recipientCcs));
//	          https://javaee.github.io/javamail/docs/api/javax/mail/internet/MimeUtility.html#encodeText-java.lang.String-java.lang.String-java.lang.String- (第三個參數參考API文件)
				message.setSubject(MimeUtility.encodeText("我家門前有塊地｜重設密碼郵件", StandardCharsets.UTF_8.toString(), "B"));

//				first part (text)
				MimeBodyPart messageBody = new MimeBodyPart();
				messageBody.setContent("親愛的會員 "+memVO.getMem_nickname()+" 您好"+"<br>"+"要使用新的密码, 請點擊超連結重新設定密碼:<br/><a href='" + GenerateLinkUtils.generateResetPwdLink(memVO) +"'>點擊重新設定密碼</a>", "text/html; charset=UTF-8");

				Multipart multipart = new MimeMultipart();
				multipart.addBodyPart(messageBody);

////	          second part (the image) 可根據自己需要決定是否要加這段
//				File file = new File("picture/20211214151834.jpg");
//				MimeBodyPart messageImgBody = new MimeBodyPart();
//				DataSource fds = new FileDataSource(file);
	//
//				messageImgBody.setDataHandler(new DataHandler(fds));
//				messageImgBody.setHeader("Content-ID", "<image>");
//				messageImgBody.setFileName(file.getName());
	//
////	          add image to the multipart
//				multipart.addBodyPart(messageImgBody);

				message.setContent(multipart);

//	   		寄出email
				Transport transport = session.getTransport("smtp");
				try {
					transport.connect();
					
				transport.sendMessage(message, message.getAllRecipients());
				 System.out.println("傳送成功!");
				} finally {
					transport.close();
				}

			} catch (AddressException e) {
				e.printStackTrace();
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			} catch (NoSuchProviderException e) {
				e.printStackTrace();
			} catch (MessagingException e) {
				e.printStackTrace();
			}
	
	 
		   
		   
//		   message.setFrom(new InternetAddress(myGmail));
//		   message.setRecipients(Message.RecipientType.TO,InternetAddress.parse(memVO.getMem_acc()));
//		  
//		   //設定信中的主旨  
//		   message.setSubject("我家門前有塊地｜重設密碼郵件");
//		   //設定信中的內容 
////		   message.setText(messageText);
//		   
//		   message.setContent("親愛的會員 "+memVO.getMem_nickname()+" 您好"+"<br>"+"要使用新的密码, 請點擊超連結重新設定密碼:<br/><a href='" + GenerateLinkUtils.generateResetPwdLink(memVO) +"'>點擊重新設定密碼</a>","text/html;charset=utf-8");
//
//		   Transport.send(message);
//		   System.out.println("傳送成功!");
//   }catch (MessagingException e){
//	     System.out.println("傳送失敗!");
//	     e.printStackTrace();
//   }
	
	}
	
	
	
	
	
	// 設定傳送郵件:至收信人的Email信箱,Email主旨,Email內容
	public void sendEmail(String to, String subject, String messageText) {
			
	   try {
		   // 設定使用SSL連線至 Gmail smtp Server
		   Properties props = new Properties();
		   props.put("mail.smtp.host", HOST);
			props.put("mail.smtp.auth", AUTH);
			props.put("mail.smtp.port", PORT);
			props.put("mail.smtp.starttls.enable", STARTTLE_ENABLE);
			props.put("mail.smtp.ssl.trust", HOST);
			props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
       // ●設定 gmail 的帳號 & 密碼 (將藉由你的Gmail來傳送Email)
       // ●須將myGmail的【安全性較低的應用程式存取權】打開
	    final String myGmail = "oliviayuyuwu@gmail.com";
	  
	     final String myGmail_password = "tibame29olivia";
		   Session session = Session.getInstance(props, new Authenticator() {
			   protected PasswordAuthentication getPasswordAuthentication() {
				   return new PasswordAuthentication(myGmail, myGmail_password);
			   }
		   });

		   Message message = new MimeMessage(session);
		   message.setFrom(new InternetAddress(myGmail));
		   message.setRecipients(Message.RecipientType.TO,InternetAddress.parse(to));
		  
		   //設定信中的主旨  
		   message.setSubject(subject);
		   //設定信中的內容 
		   message.setText(messageText);

		   Transport.send(message);
		   System.out.println("傳送成功!");
     }catch (MessagingException e){
	     System.out.println("傳送失敗!");
	     e.printStackTrace();
     }
   }
	
	 public static void main (String args[]){

      String to = "s2993856@gmail.com";
      
      String subject = "密碼通知";
      
      String ch_name = "peter1";
      String passRandom = "111";
      String messageText = "Hello! " + ch_name + " 請謹記此密碼: " + passRandom + "\n" +" (已經啟用)"; 
       
      MailService mailService = new MailService();
      mailService.sendEmail(to, subject, messageText);

   }


}
