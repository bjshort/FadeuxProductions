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
                <p class="error">${it.code}</p>
            </g:eachError>
        </g:hasErrors>

        <div class="row">
            <h2>Create a show</h2>

            <g:form action="addShow" enctype="multipart/form-data">
                <div class="form-group">
                    <label for="title">Title</label>
                    <input name="title" type="text" class="form-control" placeholder="Title" aria-describedby="basic-addon2"  value="${command?.title}">
                </div>

                <div class="form-group">
                    <label for="description">Description</label>
                    <textarea class="form-control" rows="15" name="description" placeholder="Description">${command?.description}</textarea>
                </div>

                <div class="form-group">
                    <label for="location">Location</label>
                    <input name="location" type="text" class="form-control" placeholder="Location" aria-describedby="basic-addon2" value="${command?.location}">
                </div>

                <g:if test="${command}">
                    <fieldset>
                        <legend>Image assets</legend>

                        <div class="row">
                            <div class="form-group col-md-6">
                                <label for="coverImage">Cover image</label>
                                <div class="input-group">
                                    <span class="input-group-btn">
                                        <span class="btn btn-primary btn-file">
                                            Browse&hellip; <input type="file" name="coverImage">
                                        </span>
                                    </span>
                                    <input type="text" class="form-control" value="${command?.coverImage?.name ?: show?.coverImage?.fileName}" readonly>
                                </div>
                            </div>

                            <div class="form-group  col-md-6">
                                <label for="thumbnailImage">Thumbnail</label>
                                <div class="input-group">
                                    <span class="input-group-btn">
                                        <span class="btn btn-primary btn-file">
                                            Browse&hellip; <input type="file" name="thumbnailImage">
                                        </span>
                                    </span>
                                    <input type="text" class="form-control" value="${command?.thumbnailImage?.name ?: show?.thumbnail?.fileName}" readonly>
                                </div>
                            </div>
                        </div>

                    </fieldset>

                 </g:if>

                <div class="form-group">
                    <button class="btn btn-default" type="submit">${command?.id ? "Update & continue" : "Create & continue"}</button>
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