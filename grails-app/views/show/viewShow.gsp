<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title></title>

    %{--<link href="site-assets/site.css?v=4.0.6-1.0.4" rel="stylesheet" />--}%
    %{--<link href="dist/photoswipe.css?v=4.0.6-1.0.4" rel="stylesheet" />--}%
    %{--<link href="dist/default-skin/default-skin.css?v=4.0.6-1.0.4" rel="stylesheet" />--}%
    <asset:stylesheet src="photoswipe.css" />
    <asset:stylesheet src="default-skin/default-skin.css" />
    <asset:javascript src="photoswipe.min.js" />
    <asset:javascript src="photoswipe-ui-default.min.js" />
</head>



<body>

<div id="container" class="container-fluid">
    <div class="container">
        <div class="row">
            <div class="col-xs-4">
                <div class="row">
                    <div class="bubble sidebar">
                        <h4>More Info</h4>
                        <p><span class="glyphicon glyphicon-map-marker"> </span> <a href="#">${show?.location}</a></p>
                        <p><span class="glyphicon glyphicon-time"> </span> Tuesday 31st Aug, 7pm</p>
                        <p><span class="glyphicon glyphicon-credit-card"> </span> <a href="#">Buy tickets</a></p>
                    </div>
                </div>
            </div>
            <div class="col-xs-8">
                <div class="bubble">
                    <h4>${show.title}</h4>

                    <p>${show.description}</p>
                </div>

                <div id="show-gallery" class="bubble">
                    <h4>Gallery</h4>
                    <g:if test="${show.images.size() == 0}">
                        <p>There are no images in this gallery.</p>
                        <div id="demo-test-gallery" class="demo-gallery">

                            <a href="https://farm4.staticflickr.com/3894/15008518202_c265dfa55f_h.jpg" data-size="1600x1600" data-med="https://farm4.staticflickr.com/3894/15008518202_b016d7d289_b.jpg" data-med-size="1024x1024" data-author="Folkert Gorter" class="demo-gallery__img--main">
                                <img src="https://farm4.staticflickr.com/3894/15008518202_b016d7d289_m.jpg" alt="" />
                                <figure>This is dummy caption.</figure>
                            </a>

                            <a href="https://farm6.staticflickr.com/5591/15008867125_b61960af01_h.jpg" data-size="1600x1068" data-med="https://farm6.staticflickr.com/5591/15008867125_68a8ed88cc_b.jpg" data-med-size="1024x683" data-author="Samuel Rohl">
                                <img src="https://farm6.staticflickr.com/5591/15008867125_68a8ed88cc_m.jpg" alt="" />
                                <figure>This is dummy caption. It has been placed here solely to demonstrate the look and feel of finished, typeset text.</figure>
                            </a>


                            <a href="https://farm4.staticflickr.com/3902/14985871946_24f47d4b53_h.jpg" data-size="1600x1067" data-med="https://farm4.staticflickr.com/3902/14985871946_86abb8c56f_b.jpg" data-med-size="1024x683" data-author="Ales Krivec">
                                <img src="https://farm4.staticflickr.com/3902/14985871946_86abb8c56f_m.jpg" alt="" />
                                <figure>This is dummy caption. It is not meant to be read.</figure>
                            </a>


                            <a href="https://farm6.staticflickr.com/5584/14985868676_b51baa4071_h.jpg" data-size="1600x1067" data-med="https://farm6.staticflickr.com/5584/14985868676_4b802b932a_b.jpg" data-med-size="1024x683" data-author="Michael Hull">
                                <img src="https://farm6.staticflickr.com/5584/14985868676_4b802b932a_m.jpg" alt="" />
                                <figure>Dummy caption. It's Greek to you. Unless, of course, you're Greek, in which case, it really makes no sense.</figure>
                            </a>

                            <a href="https://farm4.staticflickr.com/3920/15008465772_d50c8f0531_h.jpg" data-size="1600x1067" data-med="https://farm4.staticflickr.com/3920/15008465772_383e697089_b.jpg" data-med-size="1024x683" data-author="Thomas Lefebvre">
                                <img src="https://farm4.staticflickr.com/3920/15008465772_383e697089_m.jpg" alt="" />
                                <figure>It's a dummy caption. He who searches for meaning here will be sorely disappointed.</figure>
                            </a>



                        </div>
                    </g:if>
                    <g:else>
                        <div id="demo-test-gallery" class="demo-gallery">

                            <a href="https://farm4.staticflickr.com/3894/15008518202_c265dfa55f_h.jpg" data-size="1600x1600" data-med="https://farm4.staticflickr.com/3894/15008518202_b016d7d289_b.jpg" data-med-size="1024x1024" data-author="Folkert Gorter" class="demo-gallery__img--main">
                                <img src="https://farm4.staticflickr.com/3894/15008518202_b016d7d289_m.jpg" alt="" />
                                <figure>This is dummy caption.</figure>
                            </a>

                            <a href="https://farm6.staticflickr.com/5591/15008867125_b61960af01_h.jpg" data-size="1600x1068" data-med="https://farm6.staticflickr.com/5591/15008867125_68a8ed88cc_b.jpg" data-med-size="1024x683" data-author="Samuel Rohl">
                                <img src="https://farm6.staticflickr.com/5591/15008867125_68a8ed88cc_m.jpg" alt="" />
                                <figure>This is dummy caption. It has been placed here solely to demonstrate the look and feel of finished, typeset text.</figure>
                            </a>


                            <a href="https://farm4.staticflickr.com/3902/14985871946_24f47d4b53_h.jpg" data-size="1600x1067" data-med="https://farm4.staticflickr.com/3902/14985871946_86abb8c56f_b.jpg" data-med-size="1024x683" data-author="Ales Krivec">
                                <img src="https://farm4.staticflickr.com/3902/14985871946_86abb8c56f_m.jpg" alt="" />
                                <figure>This is dummy caption. It is not meant to be read.</figure>
                            </a>


                            <a href="https://farm6.staticflickr.com/5584/14985868676_b51baa4071_h.jpg" data-size="1600x1067" data-med="https://farm6.staticflickr.com/5584/14985868676_4b802b932a_b.jpg" data-med-size="1024x683" data-author="Michael Hull">
                                <img src="https://farm6.staticflickr.com/5584/14985868676_4b802b932a_m.jpg" alt="" />
                                <figure>Dummy caption. It's Greek to you. Unless, of course, you're Greek, in which case, it really makes no sense.</figure>
                            </a>

                            <a href="https://farm4.staticflickr.com/3920/15008465772_d50c8f0531_h.jpg" data-size="1600x1067" data-med="https://farm4.staticflickr.com/3920/15008465772_383e697089_b.jpg" data-med-size="1024x683" data-author="Thomas Lefebvre">
                                <img src="https://farm4.staticflickr.com/3920/15008465772_383e697089_m.jpg" alt="" />
                                <figure>It's a dummy caption. He who searches for meaning here will be sorely disappointed.</figure>
                            </a>



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
    });
</script>

<g:render template="../templates/show.gallery/galleryJS" model="[galleryClass: '.demo-gallery']" />

</body>
</html>