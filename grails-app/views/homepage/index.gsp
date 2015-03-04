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
                    slideshowSpeed: 4000
                });


            });
        </script>

	</head>
	<body>
        <div class="row">
            <div class="flexslider">
                <div class="container">
                    <div id="intro">
                        <h1>You've made it to Fadeux...</h1>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
                        Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
                        Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.
                        Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
                    </div>
                </div>

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
	</body>
</html>
