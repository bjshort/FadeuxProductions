<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
  <meta name="layout" content="main"/>
  <title></title>
</head>
<body>
<div class="container">
    <div class="col-sm-3">
        <p>Example text</p>
    </div>
    <div class="col-sm-9">
        <table class="table table-striped">
            <thead></thead>
            <tbody>
                <g:each in="${shows}" var="show">
                    <tr>
                        <td>
                            <g:link controller="show" action="view" params="[id: show.id]" >
                                ${show.title}
                            </g:link>
                        </td>
                    </tr>
                </g:each>
            </tbody>

        </table>
    </div>

</div>

</body>
</html>