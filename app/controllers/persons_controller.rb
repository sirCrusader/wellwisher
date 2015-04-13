class PersonsController < ApplicationController
  def profile;
    @categories = Category.all
  end
end




# class ProfilesController < ApplicationController
#
#   def new
#     @user = current_user
#     @profile = @user.profile.new
#   end
#
#   def create
#     @user = current_user
#     @profile = @user.profile.build(params[:profile])
#     if @profile.save
#       flash[:success] = "Profile Saved Successfully!"
#       render "show"
#     end
#   end
#
#
# end