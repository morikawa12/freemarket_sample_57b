class ProfilesController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update]
  def edit
    @profile = Profile.find(current_user.id)
    @user = User.find(current_user.id)
  end

  def update
    @profile = Profile.find(params[:id])
    if @profile.update(profile_params)
      redirect_to edit_profile_path

    else
      render :edit
    end
  end

  private
  def profile_params
    params.require(:profile).permit(:profile_content)
  end
end
