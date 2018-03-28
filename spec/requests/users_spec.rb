require 'rails_helper'

RSpec.describe 'Users API', type: :request do
  before :all do
    delete = create(:permission, :can_delete)
    edit = create(:permission, title: 'edit', description: 'edit permission')
    members = create(:permission, title: 'members', description: 'members permission')
    restricted = create(:permission, title: 'restricted', description: 'view restricted permission')
  
    @admin = create(:role, :admin )
    @moderator = create(:role, :moderator)
    @regular = create(:role, :regular)
    
    @admin.permissions << [delete, edit, members, restricted]
    @moderator.permissions << [delete, edit, members]
    @regular.permissions <<[members]
  end

  describe 'POST /users' do
    let(:valid_attributes) do
      {
        email: 'abc@gmail.com',
        firstname: 'test',
        lastname: 'user',
        username: 'testUser123',
        password: 'tester123',
        password_confirmation: 'tester123',
        role_id: @admin.id
      }
    end

    let(:invalid_attributes) do
      {
        email: 'abc@gmail.com',
        lastname: 'user',
        username: 'testUser123',
        password: 'tester123',
        role_id: @admin.id
      }
    end

    context 'when request is valid' do
      before { post '/api/v1/users', params: valid_attributes }

      it 'creates a user' do
        expect(json['data']['user']['firstname']).to eq('test')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when request is invalid' do
      before { post '/api/v1/users', params: invalid_attributes }

      it 'creates a user' do
        expect(json['firstname']).to be_an Array
        expect(json['firstname'][1]).to eq('is too short (minimum is 2 characters)')
      end

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end
    end
  end

  describe 'Users Routes' do
    let!(:admin_user) { create(:user, :admin_user, role_id: @admin.id) }

    before :each do
      allow_any_instance_of(Api::V1::UsersController).to receive(:authenticate_request!).and_return(true)
    end

    describe 'GET /users' do
      context 'after user is created' do
        before do
          get '/api/v1/users'
        end
  
        it 'gets all users' do
          expect(json['users']).to be_an Array
          expect(json['users'].length).to eq(1)
        end
  
        it 'returns status code 200' do
          expect(response).to have_http_status(200)
        end
      end      
    end
  
    describe 'GET /users/:id' do
      context 'after user is created' do
        before do
          get "/api/v1/users/#{admin_user.id}"
        end
  
        it 'gets all users' do
          expect(json['users']).to be_an Object
          expect(json.length).to eq(1)
        end
  
        it 'returns status code 200' do
          expect(response).to have_http_status(200)
        end
      end
    end
  
    describe 'PUT /users/:id' do
      let!(:normal_user) { create(:user, :regular_user, role_id: @regular.id)}
      context 'when updating a profile by admin' do

      end
    end
  
    describe 'DELETE /users/:id' do
    end
  end
end