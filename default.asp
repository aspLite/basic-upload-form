<!-- #include file="aspLite/aspLite.asp"-->
<%
dim totalMB, file, message, uploader
set uploader=aspl.plugin("uploader")

uploader.save server.mappath("upload")

if uploader.UploadedFiles.count>0 then

	for each file in  uploader.UploadedFiles

		set file=uploader.UploadedFiles(file)

		message=message & "<li>"
		message=message & "Filename: " & file.filename & " / "
		message=message & "Filetype: " & file.filetype & " / "
		message=message & "Filesize: " & round(file.length/1024,0) & " kB"
		message=message & "</li>"

		totalMB=totalMB + round(file.length/1024/1024,0)

	next

	message="<p>These " & uploader.UploadedFiles.count &_
			" files were uploaded in <strong>" &_
			round((aspl.printTimer/1000),0) &_
			"</strong> seconds with a total of <strong>" &_
			totalMB &" MB</strong>:</p><ul>" & message & "</ul>"

end if
%>

<!doctype html>
<html lang="en">  

	<head>	
		<title>Basic upload in aspLite</title>   
		<meta charset="utf-8">
	</head>

	<body>

		<%=message%>

		<form action="default.asp" method="post" enctype="multipart/form-data">	
			<input multiple type="file" name="file" required><br><br>
			<input type="submit" value="Upload">
		</form>

	</body>
</html>