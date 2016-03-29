
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SMUA | JSON</title>
    </head>
    <body>
        <h1>Test Json Update </h1>
        <form action="json/update"  method="post" enctype="multipart/form-data">
            <table cellpadding="5">
                <tr><td>Filename:</td>
                <td><input type="file" name="bootstrap-file" accept=".zip"/></td></tr>
                <tr><td>Token :</td>
                <td><input type="text" name="token"/></td></tr>
                <tr><td></td><td><input type="submit" value="Update" /></td></tr>
            </table>
        </form>
    </body>
</html>
