class UrlMappings {

	static mappings = {
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}

		"/"(view:"/index")
		"500"(view:'/error')

        "/personal"{
            controller='questionnarie'
            action='personal'
        }

        "/organizacion"{
            controller='questionnarie'
            action='organizacion'
        }
	}
}
