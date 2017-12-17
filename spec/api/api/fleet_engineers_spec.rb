require 'rails_helper'

describe API::FleetEngineers, type: :request do
  let(:do_request) { post '/fleet_engineers/min', params: params }

  context 'when params are valid' do
    let(:params) do
      {
        scooters: [12, 15],
        c: 12,
        p: 3
      }
    end

    it 'responds with the created item' do
      do_request

      expect(response).to have_http_status(:success)
      expect(response).to match_response_schema('fleet_engineers/fleet_engineers_min')
    end
  end

  context 'when param is invalid' do
    let(:params) do
      {
        scooters: [12, 15],
        c: 12
      }
    end
    it 'responds with 400 status code' do
      do_request

      expect(response).to have_http_status(400)
    end
  end

  context 'when parma p with zero is provided' do
    let(:params) do
      {
        scooters: [12, 15],
        c: 12,
        p: 0
      }
    end
    it 'responds with 400 status code' do
      do_request

      expect(response).to have_http_status(400)
    end
  end
end
