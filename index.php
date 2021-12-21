<style>
	td,th{
		border:1px solid black;
		padding:5px;
		text-align:center;
	}
	table{
		border-collapse:collapse;
	}
	input{
		margin:10px;
	}

</style>
<?php 
$connection = mysqli_connect('127.0.0.1','root','','cinema');
//Delete fun



if(isset($_POST['del'])) {
$w = $_POST['delete1'];
$sql="DELETE  FROM agelimits WHERE (`id`='$w')";
if (mysqli_query($connection,$sql))
{
}
else {
	mysqli_error($connection);
}}
//Insert fun


if(isset($_POST['ins'])) {
$w = $_POST['insert1']; 
$a = "SELECT * FROM agelimits"; 
$g = mysqli_query($connection,$a); 
$r = 1 + mysqli_num_rows($g);
$sql="INSERT INTO agelimits(AgeLimit,id) VALUES('".$w."','".$r."')"; 
if (mysqli_query($connection,$sql)) 
{ 
} 
else { 
mysqli_error($connection); 
}}


//Update fun

if(isset($_POST['upd'])) {
$w = $_POST['update1'];
$s = $_POST['update2'];
$sql="UPDATE `agelimits` SET `AgeLimit`='$s' WHERE (`id`='$w')";
if (mysqli_query($connection,$sql))
{
}
else {
	mysqli_error($connection);
}}

//CheckBox
$sqlCheck = "SELECT * FROM `films` ";
if(isset($_POST['checkEsketit'])) {
	$w = $_POST['check'];
if ($w=='1check') {
	$sqlCheck = "SELECT * FROM `films` where `InStock`=1";
}}
//Reg

if(isset($_POST['nuDavai'])) {
$login = $_POST['Login'];
$password = $_POST['Password'];

$phone = filter_var($_POST['Phone'],FILTER_SANITIZE_NUMBER_FLOAT);
$Email = filter_var($_POST['Email'],FILTER_VALIDATE_EMAIL); 
$name =$_POST['Name'];
$surname =$_POST['Surname'];
$adress =$_POST['Adress'];
$date =$_POST['Date'];
$a = "SELECT * FROM clients"; 
$g = mysqli_query($connection,$a); 
$r = 1 + mysqli_num_rows($g);
if (filter_var($Email, FILTER_VALIDATE_EMAIL) ) {
$sql = "INSERT INTO clients(Id,Name,Surname,PhoneNumber,Email,Adress,DateOfBirth,Login,Password) VALUES ('".$r."', ' ".$name."','".$surname."','".$phone."','".$Email."','".$adress."','".$date."','".$login."','".$password."') "; } 
if (mysqli_query($connection,$sql) ) 
{ 
echo "<script>alert('Вы успешно зарегестрированы');</script>";	
} else { 
	echo "<script>alert('Вы успешно зарегестрированы Email');</script>";
	mysqli_error($connection);
	   
}}




//Log
if(isset($_POST['AnuDavai'])) {
$login = $_POST['Login'];
$password = $_POST['Password'];


$sql = "SELECT `Login`,`Password` FROM `clients` WHERE (`Login` = '".$login."') AND (`Password` = '".$password."')";

$query = (mysqli_query($connection,$sql));
if (mysqli_num_rows($query) !== 0)
{
echo "<script>alert('Добро пожаловать, $login');</script>";
} else 
{
echo "<script>alert('Вы ввели неправильный логин/пароль');</script>";
	echo mysqli_error($connection);
}}
//AgeLimits

$sql="SELECT *FROM `agelimits`";
$query=mysqli_query($connection,$sql);
echo "<table style='float:left;margin-right:30px'>";
echo "<tr>";
echo "<th>Id</th>";
echo "<th>AgeLimit</th>";
echo "</tr>";


 while ($row=mysqli_fetch_assoc($query)) 
 {
	echo "<tr>";
	echo "<td>".$row['id']."</td>";
	echo "<td>".$row['AgeLimit']."</td>";
	echo "</tr>";

}
echo "</table>";
//Clients

echo "<table style='float:left;margin-right:30px'>";
echo "<tr>";
echo "<th>Id</th>";
echo "<th>Name</th>";
echo "<th>Surname</th>";
echo "<th>PhoneNumber</th>";
echo "<th>Email</th>";
echo "<th>Adress</th>";
echo "<th>DateOfBirth</th>";
echo "</tr>";
$sql ="SELECT *FROM `clients`";
$query=mysqli_query($connection,$sql);

 while ($row=mysqli_fetch_assoc($query)) 
 {
	echo "<tr>";
	echo "<td>".$row['id']."</td>";
	echo "<td>".$row['Name']."</td>";
	echo "<td>".$row['Surname']."</td>";
	echo "<td>".$row['PhoneNumber']."</td>";
	echo "<td>".$row['Email']."</td>";
	echo "<td>".$row['Adress']."</td>";
	echo "<td>".$row['DateOfBirth']."</td>";
		echo "</tr>";

}
echo "</table>";
//Autors
echo "<table style='float:left;margin-right:30px '>";
echo "<tr>";
echo "<th>Id</th>";
echo "<th>Name</th>";
echo "<th>Surname</th>";
echo "</tr>";
$sql ="SELECT *FROM `autors`";
$query=mysqli_query($connection,$sql);

 while ($row=mysqli_fetch_assoc($query)) {
	echo "<tr>";
	echo "<td>".$row['id']."</td>";
	echo "<td>".$row['Name']."</td>";
	echo "<td>".$row['Surname']."</td>";
	echo "</tr>";
}
echo "</table>";
//Countries
echo "<table style='float:left;margin-right:30px '>";
echo "<tr>";
echo "<th>Id</th>";
echo "<th>CountryName</th>";

echo "</tr>";
$sql ="SELECT *FROM `countries`";
$query=mysqli_query($connection,$sql);

 while ($row=mysqli_fetch_assoc($query)) {
	echo "<tr>";
	echo "<td>".$row['id']."</td>";
	echo "<td>".$row['CountryName']."</td>";
	
	echo "</tr>";
}
echo "</table>";
//Genres

echo "<table style='float:left;margin-right:30px '>";
echo "<tr>";
echo "<th>Id</th>";
echo "<th>GenreName</th>";

echo "</tr>";
$sql ="SELECT *FROM `genres`";
$query=mysqli_query($connection,$sql);

 while ($row=mysqli_fetch_assoc($query)) {
	echo "<tr>";
	echo "<td>".$row['id']."</td>";
	echo "<td>".$row['GenreName']."</td>";
	
	echo "</tr>";
}
echo "</table>";
//Films
echo "<div style='clear:both;height:20px; '></div>";
echo "<table style='float:left;'>";
$query=mysqli_query($connection,$sqlCheck);
echo "<tr>";
echo "<th>Id</th>";
echo "<th>Name</th>";
echo "<th>Genre_ID</th>";
echo "<th>DateOfRelease</th>";
echo "<th>Autor_ID</th>";
echo "<th>AgeLimit_ID</th>";
echo "<th>TranslateType_ID</th>";
echo "<th>Country_ID</th>";
echo "</tr>";
while ($row=mysqli_fetch_assoc($query)) {
	echo "<tr>";
	echo "<td>".$row['id']."</td>";
	echo "<td>".$row['Name']."</td>";
	echo "<td>".$row['Genre_ID']."</td>";
	echo "<td>".$row['DateOfRelease']."</td>";
	echo "<td>".$row['Autor_ID']."</td>";
	echo "<td>".$row['AgeLimit_ID']."</td>";
		echo "<td>".$row['TranslateType_ID']."</td>";
			echo "<td>".$row['Country_ID']."</td>";
		echo "</tr>";
	}
echo "</table>";
?>



<div style="clear: both;height: 1px;"></div>
<div style="float: left; width:250px;">

<form method="post">
	<fieldset style="width: 150px; "><legend>INSERT</legend>
	<input type="text" name="insert1" placeholder="AgeLimit"><br>
<input type="submit" value="INSERT" name="ins">
</fieldset>
</form>

<form method="post">
	<fieldset style="width: 150px; "><legend>DELETE</legend>
<input type="text" name="delete1" placeholder="id"><br>
<input type="submit" value="DELETE" name="del">
</fieldset>
</form>
 
<form method="post">
	<fieldset style="width: 150px; "><legend>UPDATE</legend>
<input type="text" name="update1" placeholder="id"><br>
<input type="text" name="update2"placeholder="new AgeLimit"><br>
<input type="submit" value="UPDATE" name="upd">
</fieldset>
</form>
</div>


<form method="post">
	<fieldset style="width: 150px;float: left;margin-right:20px; "><legend>Sign UP</legend>
<p><label>Name:<br><input type="text" name='Name' placeholder='Name' ></label></p>
<p><label>Surname:<br><input type="text" name='Surname' placeholder='Surname' ></label></p>
<p><label>Phone:<br><input type="text" name='Phone' placeholder='Phone' ></label></p>
<p><label>Email:<br><input type="text" name='Email' placeholder='Email' ></label></p>
<p><label>Adress:<br><input type="text" name='Adress' placeholder='Adress' ></label></p>
<p><label>Date:<br><input type="date" name='Date' placeholder='Date' ></label></p>
<p><label>Login:<br><input type="text" name='Login' placeholder='Login' ></label></p>
<p><label>Password:<br><input type="password" name='Password' placeholder='Password' ></label></p>
<p><input type="submit" value="yeah" name="nuDavai" ></p>
</fieldset>
</form>

<form method="post">
	<fieldset style="width: 150px;float: left; margin-right:20px;position:relative;top:-16px;" ><legend>Login</legend>
	<p><label>Login:<br><input type="text" name='Login' placeholder='Login' ></label></p>
     <p><label>Password:<br><input type="password" name='Password' placeholder='Password' ></label></p>
   <p><input type="submit" value="yeah" name="AnuDavai" ></p>
</fieldset>
</form>


<form method="post">
	<fieldset style="width: 150px;float: left;position:relative;top:-16px;" ><legend>check in stock</legend>
	<input type="checkbox" name="check" value="1check">
	<input type="submit" value="Check" name="checkEsketit">
	</fieldset>
</form>