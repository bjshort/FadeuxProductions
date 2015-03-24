<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title></title>
</head>
<body>
<div id="container" class="container-fluid">
    <div class="container">
        <div class="row">
            <div class="col-xs-4">
                <div class="bubble sidebar">
                    <h4>Other links...</h4>
                    <g:link action="displayAddShow">Create Show</g:link>
                </div>
            </div>
            <div class="col-xs-8">
                <g:if test="${flash.message}">
                    <div class="alert alert-success" role="alert">${flash.message}</div>
                </g:if>

                <g:hasErrors bean="${command}">
                    <g:eachError bean="${command}">
                        <p>${it}</p>
                    </g:eachError>
                </g:hasErrors>
                <div class="row">
                    <div class="col-xs-12">
                        <div class="bubble">
                            <h2>Shows</h2>
                            <table class="table table-striped">
                                <thead>
                                <th>Title</th><th>Created</th><th>Cover</th><th>Thumb</th><th></th>
                                </thead>
                                <tbody>
                                <g:each in="${shows}" var="show">
                                    <tr>
                                        <td>${show.title}</td>
                                        <td>${show.dateCreated}</td>
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
                <div style="margin-top: 20px;" class="row">
                    <div class="col-md-12">
                        <div class="bubble">
                            <h4>Edit content</h4>

                            <g:form controller="admin" action="editContent" params="[contentTag: 'homepageDescription']">
                                <div class="form-group">
                                    <g:textField class="form-control" name="message" value="${fadeuxproductions.Content.findByKey('homepageDescription')?.message ?: ""}" />
                                    <g:submitButton class="btn btn-default" name="submit" value="Save" />
                                </div>

                            </g:form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>


</div>
</body>
</html>