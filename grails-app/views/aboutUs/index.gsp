<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>About Us</title>
</head>
<body>
<div id="container" class="container-fluid">
    <div class="container">
        <div class="row">
            <div class="col-xs-4">
                <div class="bubble sidebar">
                    <h3>Other links...</h3>
                    <ul>
                        <li><g:link controller="contactUs">Get in touch</g:link></li>
                        <li><g:link controller="show">View our shows</g:link></li>
                    </ul>


                </div>
            </div>
            <div class="col-xs-8">
                <div class="row">
                    <div class="col-xs-12">
                        <div class="bubble">
                            <h2>${title ?: "About Us"}</h2>
                            <p>${raw(description) ?: "About Us goes here"}</p>
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