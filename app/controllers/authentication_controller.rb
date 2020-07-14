class AuthenticationController < ApplicationController
    def login 
        @user = User.find_by username: params[:username]

        if @user

            if @user.authenticate(params[:password])
                token = createToken(@user)
                render json: {token: token}
            else
                render json: {message: "username does not match"}, status: :unauthorized
            end 
        else 
            render json: {message: "username does not match"}, status: :unauthorized
        end
    end

end

