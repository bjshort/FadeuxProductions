<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title></title>
</head>



<body>

<div id="container" class="container-fluid">
    <div class="container">
        <div class="col-xs-4">

        </div>
        <div class="col-xs-8 bubble">
            <h4>${show.title}</h4>

            <p>${show.description}</p>
        </div>
    </div>
</div>

<script type="text/javascript">
    $(document).ready(function(){
        var url = '${show.coverImage.storedPath}';

        $('#container').css('background-image', 'url("' + url + '")');
    });
</script>

</body>
</html>