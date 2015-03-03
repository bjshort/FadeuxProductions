<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Welcome to Grails</title>

        <script>
            // Can also be used with $(document).ready()
            $(window).load(function() {
                $('.flexslider').flexslider({
                    animation: "slide",
                    slideshow: "true",
                    slideshowSpeed: 3000
                });
            });
        </script>
	</head>
	<body>
        <div class="row">
            <div class="flexslider">
                <ul class="slides">
                    <g:each in="${shows}" var="show">
                        <g:if test="${show.coverImage}">
                            <li>
                                <img src="${show?.coverImage?.storedPath}" />
                            </li>
                        </g:if>
                    </g:each>
                </ul>
            </div>
        </div>
    <div class="container">
        Footer
    </div>

	</body>
</html>
