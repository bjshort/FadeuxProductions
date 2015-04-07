<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Add a new show</title>
    <asset:javascript src="tinymce.min.js" />
    <asset:javascript src="masonry.pkgd.min.js" />
    <asset:javascript src="imagesloaded.pkgd.min.js" />
</head>
<body>
<script type="text/javascript">
    tinymce.init({
        selector: "textarea",
        menubar : false
    });
</script>

<div id="container" class="container-fluid">
    <div class="container">
        <div class="row">
            <div class="col-xs-4">
                <div class="row">
                    <g:if test="${show}">
                        <div class="bubble sidebar">
                            <div>
                                <h3>Cover image:</h3>
                                <div id="coverImage" class="uploadedImage">
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

                                    <div class="row">
                                        <div class="col-md-8">
                                            <div class="input-group">
                                                <span class="input-group-btn">
                                                    <span class="btn btn-primary btn-file">
                                                        <span class="glyphicon glyphicon-folder-open"> </span> <input type="file" name="coverImage">
                                                    </span>
                                                    <g:hiddenField name="showId" value="${show?.id}" />
                                                </span>
                                                <input type="text" class="form-control" value="${show?.coverImage?.fileName}" readonly>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <g:submitButton class="btn btn-primary pull-right" name="submitCoverImage" value="Upload" />
                                        </div>
                                    </div>



                                </g:form>
                            </div>
                            <hr />
                            <div style="margin-top: 20px;">
                                <h3>Thumbnail image:</h3>
                                <div id="thumbnailImage" class="uploadedImage">
                                    <g:if test="${show?.thumbnail}">
                                        <img src="${show.thumbnail.storedPath}" width="150" />
                                    </g:if>
                                    <g:else>
                                        <p>You have not uploaded a thumbnail for this show.</p>
                                    </g:else>
                                </div>
                                <g:form name="thumbnailImageForm" action="changeThumbnailImage" enctype="multipart/form-data">
                                    <g:if test="${flash.thumbnailImageError}">
                                        <div class="alert alert-danger" role="alert">${flash.thumbnailImageError}</div>
                                    </g:if>

                                    <div class="row">
                                        <div class="col-md-8">
                                            <div class="input-group">
                                                <span class="input-group-btn">
                                                    <span class="btn btn-primary btn-file">
                                                        <span class="glyphicon glyphicon-folder-open"> </span> <input type="file" name="thumbnailImage">
                                                    </span>
                                                    <g:hiddenField name="showId" value="${show?.id}" />
                                                </span>
                                                <input type="text" class="form-control" value="${show?.thumbnail?.fileName}" readonly>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <g:submitButton class="btn btn-primary pull-right" name="submitThumbnailImage" value="Upload" />
                                        </div>
                                    </div>


                                </g:form>
                            </div>
                    </div>
                    </g:if>
                </div>
            </div>
            <div class="col-xs-8">
                <div class="bubble">
                    <g:if test="${flash.imageError}">
                        <div class="alert alert-danger" role="alert">${flash.imageError}</div>
                    </g:if>

                    <g:if test="${flash.message}">
                        <div class="row">
                            <div class="alert alert-success" role="alert">${flash.message}</div>
                        </div>
                    </g:if>
                    <g:if test="${flash.error}">
                        <div class="row">
                            <div class="alert alert-danger" role="alert">${flash.error}</div>
                        </div>
                    </g:if>
                    <g:hasErrors bean="${command}">
                        <g:eachError bean="${command}">
                            <div class="alert alert-danger" role="alert">${it.code}</div>
                        </g:eachError>
                    </g:hasErrors>

                    <h2>Create a show</h2>

                    <g:form action="addShow" enctype="multipart/form-data">
                        <div class="form-group">
                            <label for="title">Title *</label>
                            <input name="title" type="text" class="form-control" placeholder="Title" aria-describedby="basic-addon2"  value="${command?.title}" required>
                        </div>

                        <div class="form-group">
                            <label for="description">Description *</label>
                            <textarea class="form-control" rows="15" name="description" placeholder="Description">${command?.description}</textarea>
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="location">Location *</label>
                                    <input name="location" type="text" class="form-control" placeholder="Location" aria-describedby="basic-addon2" value="${command?.location}" required>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="ticketURL">Ticket URL</label>
                                    <input name="ticketURL" type="text" class="form-control" placeholder="Enter a ticket booking URL..." aria-describedby="basic-addon2" value="${command?.ticketURL}">
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <button class="btn btn-primary" type="submit">${command?.id ? "Update & continue" : "Create & continue"}</button>
                        </div>

                        <g:hiddenField name="id" value="${command?.id}" />

                    </g:form>
                </div>

                <g:if test="${show}">
                    <g:render template="../templates/show.gallery/gallery" model="[show: show, form: true]" />
                </g:if>
            </div>



        </div>
    </div>
</div>

</body>
</html>