require 'rails_helper'

RSpec.describe WorkshopsController, type: :request do
  describe '#index' do
    it 'returns a success response' do
      get '/workshops'
      expect(response).to have_http_status(:ok)
      expect(response.status).to eq(200)
    end

    it 'returns correct JSON body' do
      workshop = create(:workshop)
      get '/workshops'
      body = JSON.parse(response.body).deep_symbolize_keys
      expect(body).to eq(
        data: [{
          id: workshop.id,
          title: workshop.title,
          short_description: workshop.short_description,
          long_description: workshop.long_description,
        }],
      )
    end

    it 'returns articles in the proper order' do
      older_workshop = create(:workshop, created_at: 1.hour.ago)
      recent_workshop = create(:workshop)
      get '/workshops'

      body = JSON.parse(response.body).deep_symbolize_keys
      ids = body[:data].map { |obj| obj[:id] }
      expect(ids).to eq([recent_workshop.id, older_workshop.id])
    end

    it 'paginates results with provided limit' do
      _, workshop2, workshop3 = create_list(:workshop, 3)
      get '/workshops', { params: { page_number: 2, limit: 1 } }
      response_data = JSON.parse(response.body).deep_symbolize_keys[:data]
      expect(response_data.size).to eq(1)
      expect(response_data.first[:id]).to eq(workshop2.id)
    end

    it 'paginates results with deefault limit' do
      create_list(:workshop, 35)
      get '/workshops', { params: { page_number: 1 } }
      response_data = JSON.parse(response.body).deep_symbolize_keys[:data]
      expect(response_data.size).to eq(20)

      get '/workshops', { params: { page_number: 2 } }
      response_data = JSON.parse(response.body).deep_symbolize_keys[:data]
      expect(response_data.size).to eq(15)
    end
  end
end
