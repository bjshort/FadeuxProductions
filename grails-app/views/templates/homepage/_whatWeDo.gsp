<div class="container">
        <h2>${content?.whatWeDoTitle ?: "Services we provide..."}</h2>
        <p>${raw(content?.whatWeDoDescription) ?: "A proper section of text needs to be entered in the Admin panel."}</p>
        <g:link controller="aboutUs" class="btn btn-primary pull-right">Get to know more...</g:link>
</div>