<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title></title>
</head>
<body>
<div class="container">
    <div class="col-xs-8 col-xs-offset-4">
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
                <div class="form-group">
                    <label for="title">Title</label>
                    <input name="title" type="text" class="form-control" placeholder="Title" aria-describedby="basic-addon2"  value="${command?.title}">
                </div>
                <div class="form-group">
                    <label for="description">Description</label>
                    <textarea class="form-control" rows="15" name="description" placeholder="Description">${command?.description}</textarea>
                </div>
                <div class="from-group">
                    <label for="location">Location</label>
                    <input name="location" type="text" class="form-control" placeholder="Location" aria-describedby="basic-addon2" value="${command?.location}">
                </div>

                <g:if test="${command}">
                    <div class="form-group">
                        <label for="coverImage">Cover image</label>
                        <div class="input-group">
                            <span class="btn btn-default btn-file input-group-addon">
                                Browse... <input name="coverImage" type="file">
                            </span>
                            <input type="text" class="form-control" placeholder="Username" aria-describedby="basic-addon1" readonly="true">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="thumbnailImage">Thumbnail</label>

                        <div class="input-group">
                            <span class="btn btn-default btn-file input-group-addon">
                                Browse... <input name="thumbnailImage" type="file">
                            </span>
                            <input type="text" class="form-control" placeholder="Username" aria-describedby="basic-addon1" readonly="true">
                        </div>
                    </div>
                 </g:if>

                <div class="form-group">
                    <button class="btn btn-default" type="submit">${command?.id ? "Update" : "Create"}</button>
                </div>

                <g:hiddenField name="id" value="${command?.id}" />

            </g:form>
        </div>

        <g:if test="${command}">
            <g:render template="../templates/show/assets/uploadAssetModal" model="[showId: command?.id]" />
        </g:if>
    </div>
</div>



</body>
</html>