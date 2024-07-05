import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/join_Action")
public class JoinActionServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String userID = request.getParameter("userID");
        String userPassword = request.getParameter("userPassword");
        String userName = request.getParameter("userName");
        String userDate = request.getParameter("userDate");
        String userGender = request.getParameter("userGender");

        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            // 오라클 데이터베이스 연결
            Class.forName("oracle.jdbc.driver.OracleDriver");
            conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:source", "abraxas", "2076063678");

            // INSERT 쿼리 작성
            String sql = "INSERT INTO \"user\" (\"userID\", \"userPassword\", \"userName\", \"userDate\", \"userGender\") VALUES (?, ?, ?, TO_DATE(?, 'YYYY-MM-DD'), ?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, userID);
            pstmt.setString(2, userPassword);
            pstmt.setString(3, userName);
            pstmt.setString(4, userDate);
            pstmt.setString(5, userGender);

            // 쿼리 실행
            pstmt.executeUpdate();

            // 회원가입 성공 시 다른 페이지로 이동
            response.sendRedirect("join_success.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            // 회원가입 실패 시 에러 페이지로 이동
            response.sendRedirect("join_error.jsp");
        } finally {
            // 리소스 해제
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
