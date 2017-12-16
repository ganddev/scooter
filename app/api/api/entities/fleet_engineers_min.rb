module API
  module Entities
    class FleetEngineersMin < Grape::Entity
      expose :fleet_engineers, documentation: { type: "Integer", desc: "Minimum number of fe." }
    end
  end
end
