
import java.io.IOException;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.io.StringWriter;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class RegisterFilter implements Filter {
    
    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {
            
            PrintWriter out = response.getWriter();
            out.print("<link rel=\"stylesheet\" type=\"text/css\" media=\"screen\" href=\"bootstrap-5.0.0-beta1-dist/css/bootstrap.css\" />\n" +
                        "    <script src=\"bootstrap-5.0.0-beta1-dist/js/bootstrap.js\"></script>");
            String id = request.getParameter("regid");
            String name = request.getParameter("regname");
            String pass = request.getParameter("regpass");
            String email = request.getParameter("regemail");
            String phone = request.getParameter("regmobileno");
            
            if((id.equals("")) || (name.equals("")) || (pass.equals("")) || (email.equals("")) || (phone.equals("")))
            {
                out.println("<h1>All Fields Are Mandotary to Fill.</h1>");
                out.println("<h4><a href='registerpage.html' class='link-dark'>Back To Register Page</a></h4>");
            }
            else
            {
                if(pass.length()<=8)
                {
                    out.println("<h1>Password Should be 8 Character Long.</h1>");
                    out.println("<h4><a href='registerpage.html' class='link-dark'>Back To Register Page</a></h4>");
                }
                else if(!(pass.contains("@") || pass.contains("_") || pass.contains("$")))
                {
                    out.println("<h1>Password Should Contain At Least One Special Character</h1>");
                    out.println("<h4><a href='registerpage.html' class='link-dark'>Back To Register Page</a></h4>");
                }
                else if(!(pass.contains("1") || pass.contains("2") || pass.contains("3") || pass.contains("4") || pass.contains("5") || pass.contains("6") || pass.contains("7") || pass.contains("8") || pass.contains("9") || pass.contains("0")))
                {
                    out.println("<h1>Password Should Contain At Least One Numeric Character</h1>");
                    out.println("<h4><a href='registerpage.html' class='link-dark'>Back To Register Page</a></h4>");
                }
                else if(phone.length()>10)
                {
                    out.println("<h1>Mobile Numbe Should Not Be greater Than 10 Digit.</h1>");
                    out.println("<h4><a href='registerpage.html' class='link-dark'>Back To Register Page</a></h4>");
                }
                else
                {
                    chain.doFilter(request, response);
                }
            }
        
    }
    @Override
    public void destroy() { 
            
    }
    
    public void init(FilterConfig filterConfig) {        
        
    }

    
    
}
