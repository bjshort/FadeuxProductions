<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
  <meta name="layout" content="main"/>
  <title></title>
</head>
<body>
    <table class="table table-striped">
        <g:each in="${shows}" var="show">
            <tr>
                ${show}
            </tr>
        </g:each>
    </table>
</body>
</html>