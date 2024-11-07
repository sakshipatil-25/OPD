<%@  page import="java.sql.*"  %>

<html>
<body>

<%

	Connection con=null;
	int patient_srno=Integer.parseInt(request.getParameter("patient_srno"));
	int patient_no=Integer.parseInt(request.getParameter("patient_no"));
	int hospital_Id=Integer.parseInt(request.getParameter("hospital_Id"));
	String patient_name=request.getParameter("patient_name");
	String address_patient=request.getParameter("address_patient");
	String email_Id=request.getParameter("email_Id");
	String Dob=request.getParameter("Dob");


	try
	{
	  Class.forName("oracle.jdbc.driver.OracleDriver");
	  con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system" , "sakship");
	
	  String query="Insert into Patient_Master_New values(" +patient_srno+ " ," +patient_no+ " ," +hospital_Id+ " ,'" +patient_name+ "','" +address_patient+ "','" +email_Id+ "',To_Date('" +Dob+ "','YYYY-MM-DD'))";

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
	alert("Record inserted successfully");
	document.location.href="PatientList.jsp";
</script>

</body>
</html>



