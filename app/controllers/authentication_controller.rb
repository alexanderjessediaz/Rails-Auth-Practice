class AuthenticationController < ApplicationController
    def login 
        @user = User.find_by username: params[:username]

        if !@user
            render json: {error: "No user with that username"}, status: :unauthorized
        
        else 
            if !@user.authenticate params[:password]
                render json: {error: "Invalid password"}, status: :unauthorized
            else 

                payload = {
                    user_id: @user.id
                }
                secret = "a_secret"
                token = JWT.encode payload, secret

                render json: {token: token}
            end 
        end
    end
end

