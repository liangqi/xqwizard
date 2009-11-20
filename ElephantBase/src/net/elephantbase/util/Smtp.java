package net.elephantbase.util;

import java.io.FileInputStream;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class Smtp {
	private static InternetAddress from;
	private static Session session;

	static {
		Properties p = new Properties();
		try {
			FileInputStream in = new FileInputStream(ClassPath.
					getInstance("../etc/Smtp.properties"));
			p.load(in);
			in.close();

			from = new InternetAddress(p.getProperty("from"), p.getProperty("fromname"));
		} catch (Exception e) {
			Logger.severe(e);
			throw new RuntimeException(e);
		}

		final String username = p.getProperty("username");
		final String password = p.getProperty("password");
		Properties pSession = new Properties();
		pSession.setProperty("mail.smtp.host", p.getProperty("host"));
		pSession.setProperty("mail.smtp.auth", "true");
		session = Session.getDefaultInstance(pSession, new Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password);
			}
		});
	}

	public static boolean send(String recipient, String subject, String text) {
		MimeMessage message = new MimeMessage(session);
		try {
			message.setFrom(from);
			message.setRecipients(Message.RecipientType.TO, recipient);
			message.setSubject(subject);
			message.setText(text);
			Transport.send(message);
			return true;
		} catch (Exception e) {
			Logger.severe(e);
			return false;
		}
	}
}