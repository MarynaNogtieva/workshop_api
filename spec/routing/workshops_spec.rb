require 'rails_helper'

RSpec.describe '/workshops routes', type: :routing do
  it 'routes to workshop#index' do
    # expect(get '/workshops').to route_to(controller: 'workshops', action: 'index')
    expect(get '/workshops').to route_to('workshops#index')
  end
  it 'routes to workshop#show' do
    workshop = create(:workshop)
    expect(get "/workshops/#{workshop.id}").to route_to(controller: 'workshops', action: 'show', id: workshop.id.to_s)
  end
  it 'routes to workshop#create' do

  end
end