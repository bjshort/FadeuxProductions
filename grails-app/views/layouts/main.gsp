<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title><g:layoutTitle default="Grails"/></title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="shortcut icon" href="${assetPath(src: 'favicon.ico')}" type="image/x-icon">
		<link rel="apple-touch-icon" href="${assetPath(src: 'apple-touch-icon.png')}">
		<link rel="apple-touch-icon" sizes="114x114" href="${assetPath(src: 'apple-touch-icon-retina.png')}">
        <link href='http://fonts.googleapis.com/css?family=Yellowtail' rel='stylesheet' type='text/css'>
        <asset:stylesheet src="flexslider.css" />
        <asset:stylesheet src="slick.css" />
        <asset:stylesheet src="slick-theme.css" />
  		<asset:stylesheet src="application.css" />
		<asset:javascript src="application.js" />
        <asset:javascript src="jquery.flexslider-min.js"/>
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

