<div class="container">
        <h2>Most recent shows...</h2>

        <div class="shows-container">
            <div class="row">
                <g:if test="${shows}">
                    <g:each in="${shows?.size() > 1 ? shows[0..1] : shows[0]}" var="show">
                        <div class="show col-md-6">
                            <div class="row">
                                <div class="col-sm-6">
                                    <g:link controller="show" action="view" params="[id: show.id, title: show?.title?.asFriendlyUrl()]">
                                        <img width="100%" src="${show?.getThumbnailUrl()}" />
                                    </g:link>
                                </div>
                                <div class="col-sm-6">
                                    <h4><g:link controller="show" action="view" params="[id: show.id, title: show?.title?.asFriendlyUrl()]">${show?.title}</g:link> </h4>
                                    <p>${show?.description?.length() > 250 ? raw(show?.description[0..250]) : raw(show?.description[0..show?.description?.length()-1])}...</p>
                                </div>
                            </div>

                        </div>
                    </g:each>
                </g:if>
                <g:else>
                    <p>There are currently no shows.</p>
                </g:else>

            </div>

        </div>
        <g:link controller="show" style="margin-top: 20px;" class="btn btn-primary pull-right">See all shows...</g:link>
</div>