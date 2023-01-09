module Web
  class AuthController < ApplicationController
    def callback
      redirect_to root_path if session[:user_id]

      request.env['omniauth.auth']
      session[:user_id] = user_id

      redirect_to root_path
    end

    private

    def user_id
      user&.id
    end

    def user
      User.find_by(email: request.env.dig('omniauth.auth', 'info', 'email')) ||
        User.create(
          email: request.env.dig('omniauth.auth', 'info', 'email'),
          name: request.env.dig('omniauth.auth', 'info', 'name')
        )
    end
  end
end
