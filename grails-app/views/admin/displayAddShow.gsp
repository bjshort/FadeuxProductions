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
                <div class="row">
                    <div class="bubble sidebar">
                        <g:if test="${command}">
                            <div>
                                <h3>Cover image:</h3>
                                <div id="coverImage">
                                    <g:if test="${show?.coverImage}">
                                        <img src="${show?.coverImage?.storedPath}" width="300" />
                                    </g:if>
                                    <g:else>
                                        <p>You have not uploaded a cover for this show.</p>
                                    </g:else>
                                </div>
                                <g:form name="coverImageForm" action="changeCoverImage" enctype="multipart/form-data">
                                    <g:if test="${flash.coverImageError}">
                                        <div class="alert alert-danger" role="alert">${flash.coverImageError}</div>
                                    </g:if>

                                    <div class="input-group">
                                        <span class="input-group-btn">
                                            <span class="btn btn-primary btn-file">
                                                Browse&hellip; <input type="file" name="coverImage">
                                            </span>
                                            <g:hiddenField name="showId" value="${command?.id}" />
                                        </span>
                                        <input type="text" class="form-control" value="${show?.coverImage?.fileName}" readonly>
                                    </div>

                                    <g:submitButton class="btn btn-default" name="submitCoverImage" value="Upload" />
                                </g:form>
                            </div>

                            <div>
                                <h3>Thumbnail image:</h3>
                                <div id="thumbnailImage">
                                    <g:if test="${show?.thumbnail}">
                                        <img src="${show.thumbnail.storedPath}" width="300" />
                                    </g:if>
                                    <g:else>
                                        <p>You have not uploaded a thumbnail for this show.</p>
                                    </g:else>
                                </div>
                                <g:form name="thumbnailImageForm" action="changeThumbnailImage" enctype="multipart/form-data">
                                    <g:if test="${flash.thumbnailImageError}">
                                        <div class="alert alert-danger" role="alert">${flash.thumbnailImageError}</div>
                                    </g:if>

                                    <div class="input-group">
                                        <span class="input-group-btn">
                                            <span class="btn btn-primary btn-file">
                                                Browse&hellip; <input type="file" name="thumbnailImage">
                                            </span>
                                            <g:hiddenField name="showId" value="${command?.id}" />
                                        </span>
                                        <input type="text" class="form-control" value="${show?.thumbnail?.fileName}" readonly>
                                    </div>

                                    <g:submitButton class="btn btn-default" name="submitThumbnailImage" value="Upload" />
                                </g:form>
                            </div>
                        </g:if>
                    </div>
                </div>
            </div>
            <div class="col-xs-8">
                <div class="bubble">
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

                            <div class="form-group">
                                <button class="btn btn-default" type="submit">${command?.id ? "Update & continue" : "Create & continue"}</button>
                            </div>

                            <g:hiddenField name="id" value="${command?.id}" />

                        </g:form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>