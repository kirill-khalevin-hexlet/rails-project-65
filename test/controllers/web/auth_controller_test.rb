require 'test_helper'

module Web
  class AuthControllerTest < ActionDispatch::IntegrationTest
    setup do
      @auth_hash = {
        provider: 'github',
        uid: '12345',
        info: {
          email: Faker::Internet.email,
          name: Faker::Name.first_name
        }
      }
    end

    test 'check github auth' do
      post auth_request_path('github')
      assert_response :redirect
    end

    test 'create' do
      OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash::InfoHash.new(@auth_hash)

      get callback_auth_url('github')
      assert_response :redirect

      assert User.find_by(email: @auth_hash[:info][:email].downcase)
      assert signed_in?
    end
  end
end
