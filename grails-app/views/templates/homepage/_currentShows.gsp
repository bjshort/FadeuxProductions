<div id="currentShows" class="container">
        <h2>${content?.showsTitle ?: "Our Productions..."}</h2>
        <p>${content?.showsDescription ?: "A proper section of text needs to be entered in the Admin panel."}</p>


        <div class="slick-slider-container">
            <div class="slick-slider" >
                <div><img width="260" src="http://lorempixel.com/336/406" /></div>
                <div><img width="260" src="http://lorempixel.com/336/406/sport" /></div>
                <div><img width="260" src="http://lorempixel.com/336/406/nature" /></div>
                %{--<div><img width="260" src="http://lorempixel.com/336/406/business" /></div>--}%
                %{--<div><img width="260" src="http://lorempixel.com/336/406/fashion" /></div>--}%
            </div>
        </div>
        <button class="btn btn-primary pull-right">See all...</button>
</div>