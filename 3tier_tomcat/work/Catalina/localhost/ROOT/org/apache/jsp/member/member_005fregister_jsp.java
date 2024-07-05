/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/10.1.20
 * Generated at: 2024-05-30 07:41:24 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.member;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.jsp.*;
import java.sql.*;
import javax.naming.*;
import javax.sql.*;
import java.security.*;

public final class member_005fregister_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports,
                 org.apache.jasper.runtime.JspSourceDirectives {

  private static final jakarta.servlet.jsp.JspFactory _jspxFactory =
          jakarta.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.LinkedHashSet<>(7);
    _jspx_imports_packages.add("java.sql");
    _jspx_imports_packages.add("java.security");
    _jspx_imports_packages.add("jakarta.servlet");
    _jspx_imports_packages.add("jakarta.servlet.http");
    _jspx_imports_packages.add("jakarta.servlet.jsp");
    _jspx_imports_packages.add("javax.naming");
    _jspx_imports_packages.add("javax.sql");
    _jspx_imports_classes = null;
  }

  private volatile jakarta.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public boolean getErrorOnELNotFound() {
    return false;
  }

  public jakarta.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final jakarta.servlet.http.HttpServletRequest request, final jakarta.servlet.http.HttpServletResponse response)
      throws java.io.IOException, jakarta.servlet.ServletException {

    if (!jakarta.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      final java.lang.String _jspx_method = request.getMethod();
      if ("OPTIONS".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        return;
      }
      if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSP들은 오직 GET, POST 또는 HEAD 메소드만을 허용합니다. Jasper는 OPTIONS 메소드 또한 허용합니다.");
        return;
      }
    }

    final jakarta.servlet.jsp.PageContext pageContext;
    jakarta.servlet.http.HttpSession session = null;
    final jakarta.servlet.ServletContext application;
    final jakarta.servlet.ServletConfig config;
    jakarta.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    jakarta.servlet.jsp.JspWriter _jspx_out = null;
    jakarta.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\n");
      out.write("\n");
      out.write("<!doctype html>\n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("    <meta charset=\"UTF-8\">\n");
      out.write("    <title>회원 가입</title>\n");
      out.write("    <link rel=\"stylesheet\" href=\"../style_contents.css\" type=\"text/css\">\n");
      out.write("    <script>\n");
      out.write("        function ck() {\n");
      out.write("            if (document.mform.user_id.value == \"\" || document.mform.user_id.value.length < 4 || document.mform.user_id.value.length > 12) {\n");
      out.write("                alert(\"아이디는 4자 이상 12자 이하로 입력하세요.\");\n");
      out.write("                mform.user_id.focus();\n");
      out.write("                return false;\n");
      out.write("            }\n");
      out.write("            if (document.mform.user_id.value == \"admin\" || document.mform.user_id.value == \"master\" || document.mform.user_id.value == \"root\") {\n");
      out.write("                alert(\"해당 아이디는 사용할 수 없습니다.\");\n");
      out.write("                mform.user_id.focus();\n");
      out.write("                return false;\n");
      out.write("            }\n");
      out.write("            if (document.mform.name.value == \"\") {\n");
      out.write("                alert(\"이름을 입력하세요.\");\n");
      out.write("                mform.name.focus();\n");
      out.write("                return false;\n");
      out.write("            }\n");
      out.write("            if (document.mform.user_pw1.value == \"\" || document.mform.user_pw1.value.length < 6 || document.mform.user_pw1.value.length > 20) {\n");
      out.write("                alert(\"비밀번호는 6자 이상 20자 이하로 입력하세요.\");\n");
      out.write("                mform.user_pw1.focus();\n");
      out.write("                return false;\n");
      out.write("            }\n");
      out.write("            if (document.mform.user_pw1.value != document.mform.user_pw2.value) {\n");
      out.write("                alert(\"입력한 비밀번호가 일치하지 않습니다.\");\n");
      out.write("                mform.user_pw2.focus();\n");
      out.write("                return false;\n");
      out.write("            }\n");
      out.write("            document.mform.submit();\n");
      out.write("        }\n");
      out.write("    </script>\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("    <iframe src=\"../head.jsp\" id=\"bodyFrame\" name=\"body\" width=\"100%\" frameborder=\"0\"></iframe>\n");
      out.write("    <div id=\"register_contents\" class=\"contents\">\n");
      out.write("        <form name=\"mform\" method=\"post\" action=\"member_register_ok.jsp\">\n");
      out.write("            <table width=\"550\" cellpadding=\"3\" class=\"grayColor\">\n");
      out.write("                <tr>\n");
      out.write("                    <th colspan=\"2\" style=\"background-color: #323232\">\n");
      out.write("                        <font style=\"color: white; font-size: 150%;\">회원 등록</font>\n");
      out.write("                    </th>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <th width=\"120px\"><font>*ID</font></th>\n");
      out.write("                    <td>\n");
      out.write("                        <input type=\"text\" name=\"user_id\" size=\"15\" maxlength=\"12\">\n");
      out.write("                        &nbsp;&nbsp;&nbsp;<font style=\"color:red;\">4~12(영문/숫자)</font>\n");
      out.write("                    </td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <th><font>*이름</font></th>\n");
      out.write("                    <td><input type=\"text\" name=\"name\" size=\"15\" maxlength=\"10\"></td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <th><font>*비밀번호</font></th>\n");
      out.write("                    <td>\n");
      out.write("                        <input type=\"password\" name=\"user_pw1\" size=\"20\" maxlength=\"20\">\n");
      out.write("                        &nbsp;<font style=\"color:red;\">6~20(영문/숫자/특수문자)</font>\n");
      out.write("                    </td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <th><font>*비밀번호 확인</font></th>\n");
      out.write("                    <td><input type=\"password\" name=\"user_pw2\" size=\"20\" maxlength=\"20\"></td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <th><font>나이</font></th>\n");
      out.write("                    <td><input type=\"number\" name=\"age\" size=\"30\" min=\"0\" max=\"150\"></td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <th><font>닉네임</font></th>\n");
      out.write("                    <td><input type=\"text\" name=\"nick\" size=\"30\" maxlength=\"30\"></td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <th><font>EMAIL</font></th>\n");
      out.write("                    <td><input type=\"text\" name=\"email\" size=\"30\" maxlength=\"30\"></td>\n");
      out.write("                </tr>\n");
      out.write("            </table>\n");
      out.write("            <p>\n");
      out.write("                <font size=2>* 는 필수 입력 항목입니다.</font><br/><br/>\n");
      out.write("                <input type=\"button\" value=\"등록\" onclick=\"ck();\" class=\"btn_default btn_gray\">\n");
      out.write("                <input type=\"reset\" value=\"삭제\" class=\"btn_default btn_gray\">\n");
      out.write("            </p>\n");
      out.write("        </form>\n");
      out.write("    </div>\n");
      out.write("</body>\n");
      out.write("</html>\n");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof jakarta.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}