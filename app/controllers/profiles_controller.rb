class ProfilesController < ApplicationController
    def index
        @profiles = Profile.all

        render json: {profiles: @profiles}
    end 
    def create
        @profile = Profile.create(
            first_name: params[:first_name],
            last_name: params[:last_name],
            email: params[:email],
        )

        render json: {profile: @profile}, status: :created
    end
end
