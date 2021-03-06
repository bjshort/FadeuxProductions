<nav class="navbar navbar-default navbar-static-top">
    <div class="container">
        <div class="navbar-header">
            <button class="navbar-toggle collapsed" aria-expanded="false" aria-controls="navbar" type="button" data-toggle="collapse" data-target="#navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <g:link controller="homepage" class="navbar-brand" href="#"><asset:image class="hidden-xs" src="FaDlowres.png" width="240" /> <span class="visible-xs-inline">Folie a deux</span> </g:link>
        </div>

        <div class="collapse navbar-collapse" id="navbar">
            <ul class="nav navbar-nav pull-right">
                <li class="active"><g:link controller="homepage">Home</g:link></li>
                <li><g:link controller="show" action="index">Shows</g:link></li>
                <li><g:link controller="aboutUs">About us</g:link></li>
                <li><g:link controller="contactUs">Contact</g:link></li>
                <sec:ifAllGranted roles="ROLE_ADMIN">
                    <li><g:link controller="admin" action="index">Admin</g:link></li>
                </sec:ifAllGranted>
            </ul>
        </div><!--/.nav-collapse -->
    </div>
</nav>