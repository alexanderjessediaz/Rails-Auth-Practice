class AuthenticationController < ApplicationController
    def login 
        @user = User.find_by username: params[:username]

        if !@user
            render json: {error: "No user with that username"}, status: :unauthorized
        
        else 

            render json: {user: @user}, status: :created
        end 
    end
end
