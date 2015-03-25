<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title>Folie à Deux - <g:layoutTitle default="Grails"/> - UK Theatre Production</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href='http://fonts.googleapis.com/css?family=Yellowtail' rel='stylesheet' type='text/css'>
        <asset:stylesheet src="flexslider.css" />
        <asset:stylesheet src="slick.css" />
        <asset:stylesheet src="slick-theme.css" />
  		<asset:stylesheet src="application.css" />
		<asset:javascript src="application.js" />
        <asset:javascript src="jquery.flexslider-min.js"/>

        <link rel="apple-touch-icon" sizes="57x57" href="/assets/favicon/apple-touch-icon-57x57.png">
        <link rel="apple-touch-icon" sizes="60x60" href="/assets/favicon/apple-touch-icon-60x60.png">
        <link rel="apple-touch-icon" sizes="72x72" href="/assets/favicon/apple-touch-icon-72x72.png">
        <link rel="apple-touch-icon" sizes="76x76" href="/assets/favicon/apple-touch-icon-76x76.png">
        <link rel="apple-touch-icon" sizes="114x114" href="/assets/favicon/apple-touch-icon-114x114.png">
        <link rel="apple-touch-icon" sizes="120x120" href="/assets/favicon/apple-touch-icon-120x120.png">
        <link rel="apple-touch-icon" sizes="144x144" href="/assets/favicon/apple-touch-icon-144x144.png">
        <link rel="apple-touch-icon" sizes="152x152" href="/assets/favicon/apple-touch-icon-152x152.png">
        <link rel="apple-touch-icon" sizes="180x180" href="/assets/favicon/apple-touch-icon-180x180.png">
        <link rel="shortcut icon" type="image/png" href="/assets/favicon/favicon-32x32.png" sizes="32x32">
        <link rel="icon" type="image/png" href="/assets/favicon/android-chrome-192x192.png" sizes="192x192">
        <link rel="icon" type="image/png" href="/assets/favicon/favicon-96x96.png" sizes="96x96">
        <link rel="icon" type="image/png" href="/assets/favicon/favicon-16x16.png" sizes="16x16">
        <meta name="msapplication-TileColor" content="#da532c">
        <meta name="msapplication-TileImage" content="/assets/favicon/mstile-144x144.png">
        <meta name="theme-color" content="#ffffff">
		<g:layoutHead/>
	</head>
	<body>
       <g:render template="/templates/layout/header" />

        <div>
            <g:layoutBody/>
        </div>

        <div class="fluid-container footer-container">
            <g:render template="/templates/layout/footer" />
        </div>


        <script type="text/javascript" src="http://cdn.jsdelivr.net/jquery.slick/1.4.1/slick.min.js"></script>
        <script type="text/javascript">
            $(document).ready(function(){
                $('.flexslider').flexslider({
                    animation: "fade",
                    slideshow: "true",
                    slideshowSpeed: 4000,
                    randomize: true
                });

                $('.slick-slider').slick({
                    dots: false,
                    arrows: true,
                    infinite: true,
                    speed: 500,
                    slidesToShow: 3,
                    slidesToScroll: 1,
                    autoplay: true,
                    centerMode: true,
                    focusOnSelect: true,
                    touchMove: true,
                    pauseOnHover: false
                });
            });
        </script>
	</body>
</html>

