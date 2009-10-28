import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.elephantbase.db.ConnectionPool;
import net.elephantbase.util.Closeables;
import net.elephantbase.util.LoggerFactory;

public class TestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private static Logger logger = LoggerFactory.getLogger(TestServlet.class);

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) {
		Connection conn = ConnectionPool.getInstance().borrowObject();
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			ps = conn.prepareStatement("SELECT value FROM tb_counter WHERE name = ?");
			ps.setString(1, "xqwizard");
			rs = ps.executeQuery();
			resp.getWriter().print(rs.next() ? rs.getInt(1) : 0);
		} catch (Exception e) {
			logger.log(Level.SEVERE, "", e);
		} finally {
			Closeables.close(rs);
			Closeables.close(ps);
			ConnectionPool.getInstance().returnObject(conn);
		}
	}
}