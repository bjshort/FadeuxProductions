<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Welcome to London's quirkiest independent theatre production company</title>
        <meta name="google-site-verification" content="5B16SP5be_grxFUggkb1NC9sk_V_FZ3b8RaJm2clq6E" />
	</head>
	<body>

        <div class="container-fluid">
            <div class="row">
                <g:render template="/templates/homepage/carousel" model="[shows: shows]"/>
            </div>
        </div>
        <div id="whatWeDo" class="section">
            <g:render template="/templates/homepage/whatWeDo"/>
        </div>
        <div id="currentShows" class="section">
            <g:render template="/templates/homepage/currentShows" model="[shows: shows]"/>
        </div>
	</body>
</html>
