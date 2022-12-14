class ProfilesController < ApplicationController
  def edit
  end

  def update
    if current_user.update(profile_params)
      redirect_to root_path, notice: "Skills/interests updated!"
    else
      flash[:alert] = "Something bad happened!"
      render :edit
    end
  end

  private

  def profile_params
    params.require(:user).permit({ skill_ids: [] }, { interest_ids: [] })
  end
end