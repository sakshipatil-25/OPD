<%@  page  import="java.sql.*"  %>

<html>
<body>

<%
      Connection con=null;
        int patient_srno=Integer.parseInt(request.getParameter("patient_srno"));
	int patient_no=Integer.parseInt(request.getParameter("patient_no"));
	int hospital_Id=Integer.parseInt(request.getParameter("hospital_Id"));
	String patient_name=request.getParameter("patient_name");
	String address_patient=request.getParameter("address_patient");
	int mobile_no=Integer.parseInt(request.getParameter("mobile_no"));
	String email_Id=request.getParameter("email_Id");
	String Dob=request.getParameter("Dob");


      try
        {
          Class.forName("oracle.jdbc.driver.OracleDriver");
          con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "sakship"); 

          String query="Update Patient_Master_New set patient_srno=" + patient_srno + patient_no=" + patient_no + hospital_Id=" + hospital_Id + email_Id='" + email_Id + "', mobile_no=" + mobile_no + email_Id='" + email_Id + "' + Dob='" + Dob + "'," where patient_srno=" + patient_srno;

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
    alert("Record updated successfully");
    document.location.href="PatientList.jsp";
</script>

</body>
</html>




