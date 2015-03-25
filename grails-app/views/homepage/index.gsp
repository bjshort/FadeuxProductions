<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Welcome to London's quirkiest independent theatre production company</title>
	</head>
	<body>

        <div class="container-fluid">
            <div class="row">
                <g:render template="/templates/homepage/carousel" model="[shows: shows]"/>
            </div>
        </div>
        <div class="section">
            <g:render template="/templates/homepage/currentShows" model="[shows: shows]"/>
        </div>
	</body>
</html>
