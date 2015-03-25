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
</head>

<body>
<div id="container" class="container-fluid">
    <div class="container">
        <div class="row">
            <div class="col-xs-4">
                <div class="bubble sidebar">
                    <h4>More Info</h4>
                    <p><span class="glyphicon glyphicon-map-marker"> </span> <a target="_blank" href="https://www.google.co.uk/maps/search/${show?.location}">${show?.location}</a></p>
                    <p><span class="glyphicon glyphicon-time"> </span> Tuesday 31st Aug, 7pm</p>
                    <p><span class="glyphicon glyphicon-credit-card"> </span> <a target="_blank" href="${show?.ticketURL?.contains("http") ? show?.ticketURL : "http://" + show?.ticketURL}">Buy tickets</a></p>
                </div>
            </div>
            <div class="col-xs-8">
                <div class="bubble">
                    <h3>${show.title}</h3>

                    <p>${show.description}</p>
                </div>

                <div id="show-gallery" class="bubble">
                    <h4>Gallery</h4>
                    <g:if test="${show.images.size() == 0}">
                        <p>There are no images in this gallery.</p>
                    </g:if>
                    <g:else>
                        <div id="gallery" class="gallery">
                            <g:each in="${show.images}" var="image">
                                <div class="gallery-item">
                                    <a href="${image.storedPath}" data-size="1600x1600" data-med="${image.storedPath}"  data-med-size="1024x1024" >
                                        <img style="max-height: 200px;" src="${image.storedPath}" alt="" />
                                    </a>
                                </div>
                            </g:each>

                        </div>
                    </g:else>
                </div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    $(document).ready(function(){
        var url = '${show.coverImage.storedPath}';
        $('#container').css('background-image', 'url("' + url + '")');

        var $container = $('#gallery');

        $container.imagesLoaded( function() {
            // initialize
            $container.masonry({
                columnWidth: 60,
                itemSelector: '.gallery-item'
            });
        });
    });
</script>

<g:render template="../templates/show.gallery/galleryJS" model="[galleryClass: '.gallery']" />

</body>
</html>