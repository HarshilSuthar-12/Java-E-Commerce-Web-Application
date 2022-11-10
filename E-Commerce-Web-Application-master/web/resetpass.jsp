<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <title>E-Commerce Web Site</title>
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <style>
            * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'poppins';
        }
        .main_div {
            width: 100%;
            height: 100vh;
            position: relative;
            background: linear-gradient(to top, rgba(0,0,0,0.3), rgba(0,0,0,0.8)), url(bg1.png);
            background-repeat: no-repeat;
            background-size: 100% 100%;
        }

        .center_div{
            width: 600px;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            position: absolute;
            padding: 50px;
            background: #fff;
            border-radius: 10px;
            /*box-shadow: 0 0 10px #222;*/
        }
        .center_div h1 {
            margin-bottom: 30px;
            color: #222;
            text-align: center;
            text-transform: capitalize;
            font-weight: bold;
        }
        .center_div .input_div {
            position: relative;
        }
        .center_div .input_div input {
            width: 100%;
            padding: 10px;
            font-size: 16px;
            color: #222;
            letter-spacing: 1px;
            margin-bottom: 30px;
            border: none;
            border-bottom: 1px solid #222;
            background: transparent;
            outline: none;
        }
        .center_div .input_div label {
            position: absolute;
            top: 0;
            left: 0;
            letter-spacing: 1px;
            padding: 10px 0;
            font-size: 16px;
            color: #222;
            transition: 0.5s;
        }
        .center_div .input_div input:focus ~ label,
        .center_div .input_div input:valid ~ label{
            top: -20px;
            left: 0;
            font-size: 12px;
            color: #5800FF;
        }
        .center_div input[type=""]{
            border: none;
            outline: none;
            color: #222;
            background: #5800FF;
            margin-top: 20px;
            padding: 10px 32px;
            border-radius: 5px;
            transition: 0.5s;
            cursor: pointer;
            font-size: 14px;
        }
        .center_div input[type="submit"]{
            border: none;
            outline: none;
            color: #fff;       
            background: #5800FF;
            margin-top: 20px;
            padding: 10px 32px;
            border-radius: 5px;
            transition: 0.5s;
            cursor: pointer;
            font-size: 14px;
        }
        .center_div input[type=""]:hover{
            background: #fff;
            color: #000;
        }
        .center_div .links{
            width: 100%;
            height: 100%;
            display: flex;
            justify-content: space-between;
        }
        .center_div .links a{
            color: #444;
            font-size: 15px;
            text-decoration: none;
            transition: 0.3s linear;
        }
        .center_div .links a:hover{
            color: #5800FF;
            text-decoration: underline;
        }
        .center_div .links1 a{
            width: 100%;
            height: 100%;
            display: flex;
            justify-content: center;
            margin-top: 30px;
        }
        .center_div .links1 a{
            color: #444;
            text-decoration: none;
            transition: 0.3s linear;
        }
        .center_div .links1 a:hover{
            color: #5800FF;
            text-decoration: underline;
        }

        /* responsive design */


        @media(max-width: 998px){
            .center_div{
                width: 500px;
            }
            .center_div h1{
                font-size: 1.5rem;
            }
            .center_div label{
                font-size: 14px;
            }
        }
        @media(max-width: 500px){
            .center_div{
                width: 370px;
            }
            .center_div h1{
                font-size: 1rem;
            }
            .center_div label{
                font-size: 13px;
            }
        }
        </style>
    </head>

    <body>
        <header>
            <div class="main_div">
                <div class="center_div">
                    <form method="Post">
                        <h1>RESET PASSWORD</h1>
                        <div class="input_div">
                            <input type="text" name="resetid" placeholder="" onkeyup="MyFun()" autocomplete="off" required>
                            <label> Login Id </label>
                        </div>

                        <div class="input_div">
                            <input type="password" name="resetpass" value="" onkeyup="MyFun()" placeholder="" autocomplete="off" required>
                            <label> New Password </label>
                        </div>
                        <input type="submit" value="Change">
                    </form>
                </div>
            </div>
        </header>
        <%
            if("POST".equals(request.getMethod())) {
                String id = request.getParameter("resetid");
                String npass = request.getParameter("resetpass");
                
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cs_project","root","");
                Statement st = con.createStatement();
                int val = st.executeUpdate("Update `allusers` set upass='"+npass+"' where uid = '"+id+"'");
                if(val>0)
                {
                    response.sendRedirect("index.html");
                }
                else{
                    response.sendRedirect("resetpass.jsp");
                }
            }
                %>
    </body>
</html>