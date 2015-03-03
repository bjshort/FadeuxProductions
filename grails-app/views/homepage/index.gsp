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
        <div class="row">
            <div class="col-xs-8">
                <h2>Welcome to Fadeux Productions</h2>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
            </div>
            <div class="col-xs-3 col-xs-offset-1">
                <p>Show</p>

                <ul>
                    <g:each in="${shows}" var="show">
                        <li>
                            <g:link controller="show" action="view" params="[id: show.id]" >
                                ${show.title}
                            </g:link>
                        </li>
                    </g:each>
                </ul>
            </div>
        </div>
	</body>
</html>
