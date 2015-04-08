<div id="show-gallery" class="bubble">
    <h3>Gallery</h3>
    <g:if test="${show.images.size() == 0}">
        <p>There are no images in this gallery.</p>
    </g:if>
    <g:else>
        <div id="gallery" class="gallery">
            <g:each in="${show.images}" var="image">
                <div class="gallery-item">
                    <a href="${image.storedPath}" >
                        <img style="max-height: 200px;" src="${image.storedPath}" alt="" />
                    </a>
                </div>
            </g:each>

        </div>
    </g:else>

    <g:if test="${form}">
        <g:form style="margin-top: 15px;" controller="admin" action="addImageToGallery" enctype="multipart/form-data">
            <div class="row">
                <div class="col-md-6">
                    <div class="row">
                        <div class="col-md-8">
                            <div class="input-group">
                                <span class="input-group-btn">
                                    <span class="btn btn-primary btn-file">
                                        <span class="glyphicon glyphicon-folder-open"> </span> <input type="file" name="image">
                                    </span>
                                    <g:hiddenField name="showId" value="${show?.id}" />
                                </span>
                                <input type="text" class="form-control" readonly>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <g:submitButton class="btn btn-primary pull-right" name="submitCoverImage" value="Upload" />
                        </div>
                    </div>
                </div>
            </div>

        </g:form>
    </g:if>
</div>

<g:if test="${show.coverImage}">
    <script type="text/javascript">
        $(document).ready(function() {
            var url = '${show.coverImage.storedPath}';
            $('#container').css('background-image', 'url("' + url + '")');
        });
    </script>
</g:if>

<script type="text/javascript">
    $(document).ready(function(){
        var $container = $('#gallery');

        $container.imagesLoaded( function() {
            // initialize
            $container.masonry({
                columnWidth: 60,
                itemSelector: '.gallery-item'
            });
        });


        /* This is basic - uses default settings */

//        $("a#single_image").fancybox();

        /* Using custom settings */

//        $("a#inline").fancybox({
//            'hideOnContentClick': true
//        });

        /* Apply fancybox to multiple items */

        $('.gallery-item a').fancybox({
            'transitionIn'	:	'elastic',
            'transitionOut'	:	'elastic',
            'speedIn'		:	600,
            'speedOut'		:	200,
            'overlayShow'	:	false
        });
    });
</script>