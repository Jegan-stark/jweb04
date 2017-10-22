<%-- 
    Document   : newjsp
    Created on : Oct 19, 2017, 5:39:35 PM
    Author     : Jeganathan
--%>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.Connection" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Good Bye!</title>
    </head>
    <body>
        <%
            out.println("Purchase Completed");
        %>
        <%!
            String name,amount;
            String num;
            String db_url="jdbc:mysql://localhost/account";
            String db_uname="root";
            String db_pwd="jeganathan"; 
        %>
        <table border="4px">
            <thead>
                <tr>
                            <td>item_no</td>
                            <td>item_name</td>
                            <td>Amount</td>
                </tr>
            </thead>
            <tbody>
        <%
          out.println("Bill for your purchase");
          //int num = Integer.parseInt(request.getParameter("t1"));
          try{
          num=request.getParameter("t1");
          //String num1=new Integer(num).toString();
          name=request.getParameter("t2");
          amount=request.getParameter("t3");
          Class.forName("com.mysql.jdbc.Driver");
          Connection conn=DriverManager.getConnection(db_url,db_uname,db_pwd);
          //Connection con=DriverManager.getConnection(db_url,db_uname,db_pwd);
          Statement st=conn.createStatement();
          //Statement st2=con.createStatement();
          //ResultSet rs=st.executeQuery("insert into 'account'.'variable' values('name','amount')");
          int i=st.executeUpdate("insert into receipt(itemno,name,amount)values('"+num+"','"+name+"','"+amount+"')");
          //ResultSet rs=st2.executeQuery("select * from receipt");
          out.println("Values successfully added");
          /*while(rs.next()){
              out.println("<tr>");
              out.println("<td>"+rs.getString("itemno")+"</td>");
              out.println("<td>"+rs.getString("name")+"</td>");
              out.println("<td>"+rs.getString("amount")+"</td>");
              out.println("</tr>");
          }
          conn.close();
          */
          }catch(Exception e){
              System.out.println(e);
              e.printStackTrace();
          }
        %>
            </tbody>
        </table>
        <h1>Transaction Successful</h1>
        <h2>Thanks For Shopping!!! <br> Visit us again!!!</h2>
    </body>
</html>
