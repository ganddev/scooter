require_dependency 'api/fleet_engineers'

module API
  class API < Grape::API
    format :json

    mount ::API::FleetEngineers

    add_swagger_documentation(
      security_definitions: {
        api_key: {
          type: 'apiKey',
          name: 'Authorization',
          in: 'header'
        }
      },
      security: [
        { api_key: [] }
      ]
    )
  end
end
