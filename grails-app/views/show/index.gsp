<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
  <meta name="layout" content="main"/>
  <title>View our productions</title>
</head>
<body>
<div id="container" class="container-fluid">
        <div class="container">
            <div class="row">
                <div class="col-sm-4">
                    <div class="sidebar bubble">
                        <h3>Looking for something?</h3>
                        <g:form controller="show" action="index" method="GET">
                            <div class="form-group">
                                <g:textField class="form-control" name="title" placeholder="Filter by title..." value="${params.title ? params.title : ""}" />
                            </div>
                            <div class="form-group">
                                <g:submitButton class="btn btn-primary" name="submit" value="Filter"  />
                            </div>
                        </g:form>
                    </div>

                </div>
                <div class="col-sm-8">
                    <div class="bubble">
                        <h1>Our productions</h1>
                        <div id="shows-gallery">
                            <div class="row">
                                <g:each in="${shows}" var="show" status="i">
                                    <g:if test="${(i > 0) && ((i % 3) == 0)}">
                                        </div>
                                        <div class="row">
                                    </g:if>
                                    <div class="show col-md-4">
                                        <g:link controller="show" action="view" params="[id: show.id, title: show?.title?.asFriendlyUrl()]" >
                                            <div class="show-thumb">
                                                <img src="${show?.getThumbnailUrl()}" width="220px"/>
                                            </div>
                                        </g:link>
                                        <h4>
                                            <g:link controller="show" action="view" params="[id: show.id, title: show?.title?.asFriendlyUrl()]" >
                                                ${show.title}
                                            </g:link>
                                        </h4>
                                    </div>
                                </g:each>
                            </div>

                        </div>
                    </div>

                </div>
            </div>

        </div>

</div>

<script type="text/javascript">
    $(document).ready(function(){
        var url = '${background}';
        $('#container').css('background-image', 'url("' + url + '")');
    });
</script>

</body>
</html>