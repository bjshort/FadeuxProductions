<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title></title>
</head>
<body>
    <div class="container">
        <div class="col-xs-12">

            <g:if test="${flash.message}">
                <div class="alert alert-success" role="alert">${flash.message}</div>
            </g:if>
            <g:link class="btn btn-default" action="displayAddShow">Create Show</g:link>
        </div>

        <g:hasErrors bean="${command}">
            <g:eachError bean="${command}">
                <p>${it}</p>
            </g:eachError>
        </g:hasErrors>
        <div class="row">
            <div class="col-xs-12">
                <table class="table table-striped">
                    <thead>
                    <th>Title</th><th>Description</th><th>Cover</th><th>Thumb</th><th></th>
                    </thead>
                    <tbody>
                    <g:each in="${shows}" var="show">
                        <tr>
                            <td>${show.title}</td>
                            <td>${show.description.length() > 120 ? show.description[0..120] : show.description}</td>
                            <td><span class="glyphicon glyphicon-${show?.coverImage ? 'ok' : 'remove'}"> </span></td>
                            <td><span class="glyphicon glyphicon-${show?.thumbnail ? 'ok' : 'remove'}"> </span></td>
                            <td><g:link action="displayEditShow" params="[id: show.id]">Edit</g:link></td>
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>

        </div>
    </div>


</body>
</html>