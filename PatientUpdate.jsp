<%@  page  import="java.sql.*"  %>

<html>
<body>
<br><br><h2 align="center">Patient Information</h2>
<div class="container">
<div class="form-container">
<style>
*{
    background-color: lightgrey;
    text-align: center;
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Montserrat',sans-serif;
}
.body{
	background-color: #c9d6ff;
	height: 100vh;
    font-size: 14px;
}
.container{
	border-radius: 10px;
	width: 500px;
    padding: 25px;
    margin: 50px auto 0;
    border-top: 5px solid blue;
    box-shadow: 0  0 5px 15px rgba(0,0,0,0.5);
}
.container h2{
    font-size: 24px;
    line-height: 24px;
    letter-spacing: 0.3px;
    padding: 30px;
    margin-left:25px;
    text-align: center;
}
</style>

<%
      Connection con=null;
      int patient_srno=0;
      int patient_no=0;

     /* Connection con=null;
      int sno=Integer.parseInt(request.getParameter("patient_srno"));
      String sname="";
      int age=0;*/

      try
        {
          Class.forName("oracle.jdbc.driver.OracleDriver");
          con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "sakship"); 

          String query="Select * from student where patient_srno=" + patient_srno;

           Statement stmt=con.createStatement();
           ResultSet rs=stmt.executeQuery(query);

           if(rs.next())
            {
             //sname=rs.getString("sname");
              patient_no=rs.getInt("patient_no");
            }

           rs.close();
           stmt.close();
           con.close();
        }
     catch(Exception e)
        {
          System.out.println(e);
        } 
%>

<form action="PatientEdit.jsp">
<div class="input-name">
<span>

<br><br>
<table align="center" bgcolor="cyan">

<tr>
<td>Patient SrNo:</td>
<td><%=patient_srno %><input type="hidden" name="patient_srno" value="<%=patient_srno %>"></td>
</tr>

<tr>
<td>Patient No:</td>
<td><input type="text" name="patient_no"></td>
</tr>


<tr>
<td>Hospital Id:</td>
<td><input type="text" name="hospital_Id"></td>
</tr>

<tr>
<td>Patient Name:</td>
<td><input type="text" placeholder="Name" name="patient_name"></td>
</tr>

<tr>
<td>Patient Address:</td>
<td><input type="text" name="address_patient"></td>
</tr>

<tr>
<td>Mobile No:</td>
<td><input type="text" name="mobile_no"></td>
</tr>

<tr>
<td>Email ID:</td>
<td><input type="text" name="email_Id"></td>
</tr>


<tr>
<td>DOB:</td>
<td><input type="text" name="Dob"></td>
</tr>

<tr>
<th colspan="2"><input type="submit" value="Submit"></th>
</tr>

</table>
</div>
</div>
</div>
</span>

</form>

</body>
</html>
