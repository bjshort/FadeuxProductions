<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
  <meta name="layout" content="main"/>
  <title></title>
</head>
<body>
<div id="container" class="container-fluid">
    <div class="row">
        <div class="container">
            <div class="row">
                <div class="col-sm-4">
                    <div class="row">
                        <div class="sidebar bubble">
                            <h4>Looking for something?</h4>
                            <g:form action="index">
                                <div class="form-group">
                                    <g:textField class="form-control" name="search" placeholder="Filter by title..." />
                                </div>
                                <div class="form-group">
                                    <g:submitButton class="btn btn-primary" name="submit" value="Filter" />
                                </div>
                            </g:form>
                        </div>
                    </div>

                </div>
                <div class="col-sm-8">
                    <div class="bubble">
                        <h3>Our productions</h3>
                        <div id="shows-gallery">
                            <div class="row">
                                <g:each in="${shows}" var="show">
                                    <div class="show col-xs-4">
                                        <img src="${show?.thumbnail?.storedPath}" width="200"/>
                                        <h5>
                                            <g:link controller="show" action="view" params="[id: show.id]" >
                                                ${show.title}
                                            </g:link>
                                        </h5>
                                    </div>
                                </g:each>
                            </div>

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