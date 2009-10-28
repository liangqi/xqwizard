package net.elephantbase.util.wicket;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.util.Random;

import org.apache.wicket.markup.html.image.resource.DynamicImageResource;

public class CaptchaImageResource extends DynamicImageResource {
	private static final long serialVersionUID = 1L;

	private static final int WIDTH = 50;
	private static final int HEIGHT = 20;

	private static Font font = new Font("Arial", Font.BOLD, 15);

	private String captcha;

	public CaptchaImageResource(String captcha) {
		this.captcha = captcha;
	}

	@Override
	protected byte[] getImageData() {
		Random r = new Random();
		BufferedImage image = new BufferedImage(50, 20, BufferedImage.TYPE_INT_RGB);
		Graphics g = image.getGraphics();
		g.setFont(font);
		g.setColor(new Color(200, 200, 200));
		g.fillRect(0, 0, WIDTH, HEIGHT);
		for (int i = 0; i < 100; i ++) {
			g.setColor(new Color(200 + r.nextInt(56), 200 + r.nextInt(56), 200 + r.nextInt(56)));
			g.drawString("*", r.nextInt(WIDTH), r.nextInt(HEIGHT) + 10);
		}
		g.drawRect(0, 0, WIDTH, HEIGHT);
	    for (int i = 0; i < captcha.length(); i ++) {
			g.setColor(new Color(r.nextInt(100), r.nextInt(150), r.nextInt(200)));
			g.drawString("" + captcha.charAt(i), i * WIDTH / 5 + 6,
					r.nextInt(HEIGHT) / 10 + 15);
		}
		g.setColor(Color.BLACK);
		g.drawRect(0, 0, WIDTH - 1, HEIGHT - 1);
		return toImageData(image);
	}
}