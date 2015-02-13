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
            <!-- Place somewhere in the <body> of your page -->
            <div class="flexslider">
                <ul class="slides">
                    <li>
                        <img src="http://placehold.it/940x528" />
                    </li>
                    <li>
                        <img src="http://placehold.it/940x528" />
                    </li>
                    <li>
                        <img src="http://placehold.it/940x528" />
                    </li>
                    <li>
                        <img src="http://placehold.it/940x528" />
                    </li>
                </ul>
            </div>
        </div>
        <div class="row">
            <div class="col-xs-8">
                <h2>Welcome to Fadeux Productions</h2>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
            </div>
            <div class="col-xs-3 col-xs-offset-1">
                <p>Sidebar</p>
            </div>
        </div>
	</body>
</html>
