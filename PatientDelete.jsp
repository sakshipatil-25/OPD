<%@  page  import="java.sql.*"  %>

<html>
<body>

<%
      Connection con=null;
      int patient_srno=Integer.parseInt(request.getParameter("patient_srno"));

      try
        {
          Class.forName("oracle.jdbc.driver.OracleDriver");
          con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "sakship"); 

          String query="Delete from Patient_Master_New where patient_srno=" + patient_srno;

          Statement stmt=con.createStatement();
          stmt.executeUpdate(query);

          stmt.close();
          con.close();
        }
     catch(Exception e)
        {
          System.out.println(e);
        } 

      //response.sendRedirect("PatientList.jsp");
%>

<script language="javascript">
    alert("Record deleted successfully");
    document.location.href="PatientList.jsp";
</script>

</body>
</html>




