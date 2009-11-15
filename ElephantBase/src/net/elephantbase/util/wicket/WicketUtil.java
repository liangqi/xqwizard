package net.elephantbase.util.wicket;

import java.util.ArrayList;

import net.elephantbase.util.Bytes;

import org.apache.wicket.Component;
import org.apache.wicket.IRequestTarget;
import org.apache.wicket.RequestCycle;
import org.apache.wicket.protocol.http.WebResponse;

public class WicketUtil {
	public static ArrayList<Integer> getIntList(int from, int to) {
		ArrayList<Integer> intList = new ArrayList<Integer>();
		for (int i = from; i <= to; i ++) {
			intList.add(Integer.valueOf(i));
		}
		return intList;
	}

	public static void download(Component component, final String ext,
			final String type, final byte[] content) {
		component.getRequestCycle().setRequestTarget(new IRequestTarget() {
			@Override
			public void detach(RequestCycle requestCycle) {
				// Do Nothing
			}

			@Override
			public void respond(RequestCycle requestCycle) {
				byte[] fileBytes = Bytes.random(4);
				WebResponse r = (WebResponse) requestCycle.getResponse();
				if (ext.toUpperCase().equals(ext)) {
					r.setAttachmentHeader(Bytes.toHexUpper(fileBytes) + "." + ext);
				} else {
					r.setAttachmentHeader(Bytes.toHexLower(fileBytes) + "." + ext);
				}
				r.setContentType(type);
				try {
					r.getOutputStream().write(content);
				} catch (Exception e) {
					throw new RuntimeException(e);
				}
			}
		});
	}
}