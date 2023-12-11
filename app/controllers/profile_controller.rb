class ProfileController < ApplicationController
  def edit
  end

  def update
    current_user.avatar.purge
    current_user.avatar.attach(profile_params[:avatar])
    current_user.update
  end


  private 

  def profile_params
    params.require(:user).permit(:avatar)
  end

end
