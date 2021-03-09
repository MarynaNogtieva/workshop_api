require 'rails_helper'

RSpec.describe WorkshopsController, type: :request do
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
end
