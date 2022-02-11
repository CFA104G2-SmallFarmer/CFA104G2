<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<HTML>
<HEAD>
<META http-equiv="Content-Type" content="text/html; charset=UTF-8">
<TITLE>Upload2</TITLE>
</HEAD>
<BODY>

	<FORM action="<%=request.getContextPath()%>/test/uploadtest.do" method=post
		enctype="multipart/form-data">
		<input type="file" name="upfile1"> <br><br>
		<input type="submit" value="送出上傳">
	</FORM>

</BODY>
</HTML>

