<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Administration panel</title>
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
                                <th>Title</th><th>Created</th><th>Cover</th><th>Thumb</th><th></th><th></th>
                                </thead>
                                <tbody>
                                <g:each in="${shows}" var="show">
                                    <tr>
                                        <td>${show.title}</td>
                                        <td>${show.dateCreated}</td>
                                        <td><span class="glyphicon glyphicon-${show?.coverImage ? 'ok' : 'remove'}"> </span></td>
                                        <td><span class="glyphicon glyphicon-${show?.thumbnail ? 'ok' : 'remove'}"> </span></td>
                                        <td><g:link action="displayEditShow" params="[id: show.id]">Edit</g:link></td>
                                        <td><g:link action="deleteShow" params="[id: show.id]">Delete</g:link></td>
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
                            <h2>Edit content</h2>
                                <div role="tabpanel">

                                    <!-- Nav tabs -->
                                    <ul class="nav nav-tabs" role="tablist">
                                        <li role="presentation" class="active"><a href="#homepage" aria-controls="homepage" role="tab" data-toggle="tab">Homepage</a></li>
                                        <li role="presentation"><a href="#about-us" aria-controls="about-us" role="tab" data-toggle="tab">About Us</a></li>
                                        <li role="presentation"><a href="#contact" aria-controls="contact" role="tab" data-toggle="tab">Contact</a></li>
                                    </ul>

                                    <!-- Tab panes -->
                                    <div class="tab-content">
                                        <div role="tabpanel" class="tab-pane active" id="homepage">
                                            <g:form controller="admin" action="editContent" params="[contentTag: 'homepageDescription']">
                                                <fieldset>
                                                    <legend>Introduction (Text on-top of carousel)</legend>
                                                    <div class="form-group">
                                                        <label for="content.homepageTitle">Title</label>
                                                        <g:textField class="form-control" name="content.homepageTitle" value="${fadeuxproductions.Content.findByKey('homepageTitle')?.message ?: ""}" />
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="content.homepageDescription">Company Intro</label>
                                                        <g:textArea rows="10" class="form-control" name="content.homepageDescription" value="${fadeuxproductions.Content.findByKey('homepageDescription')?.message ?: ""}" />
                                                    </div>
                                                </fieldset>

                                                <fieldset>
                                                    <legend>List of current shows</legend>
                                                    <div class="form-group">
                                                        <label for="content.homepageShowsTitle">Title</label>
                                                        <g:textField class="form-control" name="content.homepageShowsTitle" value="${fadeuxproductions.Content.findByKey('homepageShowsTitle')?.message ?: ""}" />
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="content.homepageShowsBody">Body text</label>
                                                        <g:textArea rows="10" class="form-control" name="content.homepageShowsBody" value="${fadeuxproductions.Content.findByKey('homepageShowsBody')?.message ?: ""}" />
                                                    </div>
                                                </fieldset>
                                                <g:submitButton class="btn btn-primary" name="submit" value="Save" />
                                            </g:form>
                                        </div>
                                        <div role="tabpanel" class="tab-pane" id="about-us">
                                            <g:form controller="admin" action="editContent">
                                                <fieldset>
                                                    <legend>About Us</legend>
                                                    <div class="form-group">
                                                        <label for="content.aboutUsTitle">Title</label>
                                                        <g:textField class="form-control" name="content.aboutUsTitle" value="${fadeuxproductions.Content.findByKey('aboutUsTitle')?.message ?: ""}" />
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="content.aboutUsDescription">Body text</label>
                                                        <g:textArea rows="10" class="form-control" name="content.aboutUsDescription" value="${fadeuxproductions.Content.findByKey('aboutUsDescription')?.message ?: ""}" />
                                                    </div>
                                                </fieldset>
                                                <g:submitButton class="btn btn-primary" name="submit" value="Save" />
                                            </g:form>
                                        </div>
                                        <div role="tabpanel" class="tab-pane" id="contact">
                                            <g:form controller="admin" action="editContent">
                                                <fieldset>
                                                    <legend>Contact Us</legend>
                                                    <div class="form-group">
                                                        <label for="content.contactUsTitle">Title</label>
                                                        <g:textField class="form-control" name="content.contactUsTitle" value="${fadeuxproductions.Content.findByKey('contactUsTitle')?.message ?: ""}" />
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="content.contactUsDescription">Body text</label>
                                                        <g:textArea rows="10" class="form-control" name="content.contactUsDescription" value="${fadeuxproductions.Content.findByKey('contactUsDescription')?.message ?: ""}" />
                                                    </div>
                                                </fieldset>
                                                <g:submitButton class="btn btn-primary" name="submit" value="Save" />
                                            </g:form>
                                        </div>
                                    </div>

                                </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>


</div>
</body>
</html>