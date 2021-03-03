require 'rails_helper'

RSpec.describe WorkshopsController, type: :request do
  it 'returns a success response' do
    get '/workshops'
    expect(response).to have_http_status(:ok)
    expect(response.status).to eq(200)
  end

  it 'returns correct JSON body' do
    get '/workshops'
    body = JSON.parse(response.body)
    expect(body).to eq(
      data: [{
        id: workshop.id,
        title: workshop.title,
        short_description: workshop.short_description,
        long_description: workshop.long_description
      }]
    )
  end
end