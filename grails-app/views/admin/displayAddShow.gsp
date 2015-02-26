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
<g:hasErrors bean="${command}">
    <g:eachError bean="${command}">
        <p>${it}</p>
    </g:eachError>
</g:hasErrors>

<div class="row">
    <h2>Create a show</h2>

    <g:form action="addShow">
        <div class="input-group">
            <input name="title" type="text" class="form-control" placeholder="Title" aria-describedby="basic-addon2"  value="${command?.title}">
        </div>
        <div class="input-group">
            <textarea class="form-control" name="description" placeholder="Description">${command?.description}</textarea>
        </div>
        <div class="input-group">
            <input name="location" type="text" class="form-control" placeholder="Location" aria-describedby="basic-addon2" value="${command?.location}">
        </div>
        <div class="input-group">
            <g:if test="${command}">
                <a href="#uploadAssetModal" data-toggle="modal">Upload cover image</a>
            </g:if>
        </div>
        <div class="input-group">
            <button class="btn btn-default" type="submit">${command?.id ? "Update" : "Create"}</button>
        </div>

        <g:hiddenField name="id" value="${command?.id}" />

    </g:form>
</div>

<g:if test="${command}">
    <g:render template="../templates/show/assets/uploadAssetModal" model="[showId: command?.id]" />
</g:if>

</body>
</html>