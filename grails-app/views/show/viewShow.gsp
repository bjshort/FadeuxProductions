<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>${show?.title}</title>

    %{--<link href="site-assets/site.css?v=4.0.6-1.0.4" rel="stylesheet" />--}%
    %{--<link href="dist/photoswipe.css?v=4.0.6-1.0.4" rel="stylesheet" />--}%
    %{--<link href="dist/default-skin/default-skin.css?v=4.0.6-1.0.4" rel="stylesheet" />--}%
    <asset:stylesheet src="photoswipe.css" />
    <asset:stylesheet src="default-skin/default-skin.css" />
    <asset:javascript src="photoswipe.min.js" />
    <asset:javascript src="photoswipe-ui-default.min.js" />
    <asset:javascript src="masonry.pkgd.min.js" />
    <asset:javascript src="imagesloaded.pkgd.min.js" />
</head>

<body>
<div id="container" class="container-fluid">
    <div class="container">
        <div class="row">
            <div class="col-xs-4">
                <div class="bubble sidebar">
                    <h3>More Info</h3>
                    <p><span class="glyphicon glyphicon-map-marker"> </span> <a target="_blank" href="https://www.google.co.uk/maps/search/${show?.location}">${show?.location}</a></p>
                    <p><span class="glyphicon glyphicon-time"> </span> Tuesday 31st Aug, 7pm</p>
                    <g:if test="${show?.ticketURL}">
                        <p><span class="glyphicon glyphicon-credit-card"> </span> <a target="_blank" href="${show?.ticketURL?.contains("http") ? show?.ticketURL : "http://" + show?.ticketURL}">Buy tickets</a></p>
                    </g:if>
                </div>
            </div>
            <div class="col-xs-8">
                <div class="bubble">
                    <h2>${show.title}</h2>

                    <p>${show.description}</p>
                </div>

               <g:render template="../templates/show.gallery/gallery" model="[show: show]" />
            </div>
        </div>
    </div>
</div>



<g:render template="../templates/show.gallery/galleryJS" model="[galleryClass: '.gallery']" />

</body>
</html>