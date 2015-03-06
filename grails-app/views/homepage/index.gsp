<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Welcome to Grails</title>

        <script>
            // Can also be used with $(document).ready()
            $(window).load(function() {
                $('.flexslider').flexslider({
                    animation: "fade",
                    slideshow: "true",
                    slideshowSpeed: 4000
                });
            });
        </script>

	</head>
	<body id="homepage">
        <div class="row">
            <g:render template="/templates/homepage/carousel" model="[shows: shows]"/>
        </div>
        <div class="section">
            <g:render template="/templates/homepage/currentShows" model="[shows: shows]"/>
        </div>
	</body>
</html>
