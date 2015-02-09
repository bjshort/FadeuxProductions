class UrlMappings {

	static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/"(controller: 'homepage', action: 'index')
        "/status"(view:"/status/index")
        "500"(view:'/error')
	}
}
