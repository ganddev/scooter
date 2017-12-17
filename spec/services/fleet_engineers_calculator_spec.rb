require 'rails_helper'
require_dependency './fleet_engineers_calculator'

RSpec.describe FleetEngineersCalculator do
  let(:result) { described_class.new(scooters, c, p).perform }

  describe '#perform' do
    context '2 districts capazity of fe is 5 capacity of fm is 12' do
      let(:scooters) { [15, 10] }
      let(:c) { 12 }
      let(:p) { 5 }

      it 'is successful' do
        expect(result.success).to be_truthy
      end

      it 'returns 3 as minimum needed fleet engineers' do
        expect(result.fleet_engineers).to eq 3
      end
    end

    context '3 disctricts, capacity of fe is ' do
      let(:scooters) { [11, 15, 13] }
      let(:c) { 9 }
      let(:p) { 5 }

      it 'is successful' do
        expect(result.success).to be_truthy
      end

      it 'returns 7 as minimum needed fleet engineers' do
        expect(result.fleet_engineers).to eq 7
      end
    end

    context 'When p is zero' do
      let(:scooters) { [11, 15, 13] }
      let(:c) { 9 }
      let(:p) { 0 }

      it 'returns an error' do
        expect(result.success).to be_falsy
      end
    end
  end
end
