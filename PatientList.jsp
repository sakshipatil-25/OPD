<%@  page import="java.sql.*"  %>

<html>
<body>

<br><br>
<h1 align="center">PatientList</h1>>

<center>
<a href="PatientAdd.jsp">Add New Patient</a><br>
<br>
</center>
<style>
tr:nth-child(even)
 {
  background-color: lightgrey;
}
</style>

<% 
  
   Connection con=null;

    int patient_srno=0;

    try
       {
        Class.forName("oracle.jdbc.driver.OracleDriver");
	con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system","sakship");

	String query="Select * from Patient_Master_New  order by patient_srno";

	Statement stmt=con.createStatement();
	ResultSet rs=stmt.executeQuery(query);

%>

<table border="1" align="center">
<tr>
<th>Patient SrNo</th>
<th>Patient No</th>
<th>Hospital ID</th>
<th>Patient Name</th>
<th>Patient Address</th>
<th>Email ID</th>
<th>DOB</th>
<th>Delete</th>
</tr>

<%
	while(rs.next())
	{
	   patient_srno=rs.getInt("patient_srno");

%>

	<tr>
	<td><%=rs.getInt("patient_srno")%></td>
	<td><%=rs.getInt("patient_no") %></td>
	<td><%=rs.getInt("hospital_Id") %></td>
	<td><%=rs.getString("patient_name")%></td>
	<td><%=rs.getString("address_patient") %></td>
	<td><%=rs.getString("email_Id") %></td>
	<td><%=rs.getString("Dob")%></td>            
        <td><a href='PatientDelete.jsp?patient_srno=<%=patient_srno%>'>Delete</a></td>       
	</tr>
<%
	}
%>

</table>
</div>
</span>

<%
	rs.close();
	stmt.close();
	con.close();
      }	

	catch(Exception e)
	{ 
	  System.out.println(e);
	}


%>



</body>
</html>


