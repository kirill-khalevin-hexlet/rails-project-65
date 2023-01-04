module Web
  class AuthController < ApplicationController
    def callback
      
    end

    private

    def auth
      request.env['omniauth.auth']
    end
  end
end
