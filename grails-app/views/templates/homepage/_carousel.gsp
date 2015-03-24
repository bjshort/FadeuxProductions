<div class="flexslider">
    <div class="container">
        <div id="intro">
            <h1>${content?.title ?: "You've made it to Fadeux..."}</h1>
            <g:if test="${content.description}">
                <p>${content.description}</p>
            </g:if>
            <g:else>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
                Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
                Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.
                Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
            </g:else>
        </div>
    </div>

    <ul class="slides">
        <g:each in="${shows}" var="show">
            <g:if test="${show.coverImage}">
                <li>
                    <img src="${show?.coverImage?.storedPath}" />
                </li>
            </g:if>
        </g:each>
    </ul>
</div>