class UrlMappings {

	static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/our-productions"(controller: 'show', action: 'index')
        "/production/$id?"(controller: 'show', action: 'view')

        "/"(controller: 'homepage', action: 'index')
        "/status"(view:"/status/index")
        "500"(view:'/error')
	}
}
