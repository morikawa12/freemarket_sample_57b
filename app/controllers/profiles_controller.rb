class ProfilesController < ApplicationController

  def edit
  end

  def update
    @profile = Profile.find(params[:id])
    if @profile.update(profile_params)
      redirect_to controller: :profiles, action: :edit
    else
      render :edit
    end
  end

  private
  def profile_params
    params.require(:profile).permit(:profile_content)
  end
end
