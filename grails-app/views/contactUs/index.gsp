<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Contact Us</title>
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
                <div class="row">
                    <div class="col-xs-12">
                        <div class="bubble">
                            <h2>${title ?: "Contact Us"}</h2>
                            <p>${raw(description) ?: "Contact Us goes here"}</p>
                        </div>

                    </div>
                </div>
            </div>
        </div>

    </div>


</div>
</body>
</html>