<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title></title>
</head>
<body>
    <g:if test="${flash.message}">
        <div class="row">
            <div class="alert alert-success" role="alert">${flash.message}</div>
        </div>
    </g:if>
    <div class="row">
        <g:link class="btn btn-default" action="displayAddShow">Create Show</g:link>
    </div>



    <g:hasErrors bean="${command}">
        <g:eachError bean="${command}">
            <p>${it}</p>
        </g:eachError>
    </g:hasErrors>

    <div class="row">
        <table class="table table-striped">
            <thead>
            <th>Title</th><th>Description</th><th></th>
            </thead>
            <tbody>
            <g:each in="${shows}" var="show">
                <tr>
                    <td>${show.title}</td><td>${show.description}</td><td><g:link action="displayEditShow" params="[id: show.id]">Edit</g:link></td>
                </tr>
            </g:each>
            </tbody>
        </table>
    </div>

</body>
</html>