package xqwajax.util.wicket;

import org.apache.wicket.Component;
import org.apache.wicket.IRequestTarget;
import org.apache.wicket.RequestCycle;
import org.apache.wicket.protocol.http.WebResponse;

import xqwajax.util.Bytes;


public class WicketUtil {
	public static void download(Component component, final String ext, final String type, final byte[] content) {
		component.getRequestCycle().setRequestTarget(new IRequestTarget() {
			public void detach(RequestCycle requestCycle) {
				// Do Nothing
			}

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