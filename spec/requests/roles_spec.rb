require 'rails_helper'

RSpec.describe 'Roles API', type: :request do
  before :all do
    delete = create(:permission, :can_delete)
    edit = create(:permission, title: 'edit', description: 'edit permission')
    members = create(:permission, title: 'members', description: 'members permission')
    restricted = create(:permission, title: 'restricted', description: 'view restricted permission')
  
    admin = create(:role, :admin )
    moderator = create(:role, :moderator)
    regular = create(:role, :regular)
    
    admin.permissions.push([delete, edit, members, restricted])
    moderator.permissions.push([delete, edit, members])
    regular.permissions.push([members])
  end

  describe 'GET /roles' do
    before { get '/api/v1/roles' }

    it 'returns roles' do
      expect(json).not_to be_empty
      expect(json.size).to eq 3
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end
end