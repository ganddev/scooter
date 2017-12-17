module API
  class FleetEngineers < Grape::API
    resource :fleet_engineers do
      desc 'Return minimum numbers of fleet fleet_engineers' do
        success Entities::FleetEngineersMin
      end
      params do
        requires :scooters, type: Array[Integer], desc: 'Number of scooters in district'
        requires :c, type: Integer, desc: 'Capacity per FM'
        requires :p, type: Integer, desc: 'Capacity per FE'
      end
      post '/min' do
        result = FleetEngineersCalculator.perform(params[:scooters],
                                                params[:c],
                                                params[:p])
        error!('There was an error!', 400) unless result.success

        present result, with: Entities::FleetEngineersMin
      end
    end
  end
end
