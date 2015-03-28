<div class="container">
        <h2>${content?.showsTitle ?: "Our Productions..."}</h2>
        <p>${content?.showsDescription ?: "A proper section of text needs to be entered in the Admin panel."}</p>


        <div class="slick-slider-container">
            <div class="slick-slider" >
                <g:each in="${shows}" var="show">
                    <div><img width="260" src="${show?.getThumbnailUrl()}" /></div>
                </g:each>
            </div>
        </div>
        <button class="btn btn-primary pull-right">See all...</button>
</div>