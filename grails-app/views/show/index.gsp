<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
  <meta name="layout" content="main"/>
  <title></title>
</head>
<body>
<div id="container" class="container-fluid">
    <div class="container">
        <div class="col-sm-4">
            <p>Example text</p>
        </div>
        <div class="col-sm-8">
            <div class="bubble">
                <h3>Current productions</h3>
                <div id="shows-gallery">
                    <g:each in="${shows}" var="show">
                        <div class="show col-xs-6">
                            <img src="${show?.thumbnail?.storedPath}" width="200"/>
                            <span>
                                <g:link controller="show" action="view" params="[id: show.id]" >
                                    ${show.title}
                                </g:link>
                            </span>
                        </div>
                    </g:each>
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