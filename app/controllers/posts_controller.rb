class PostsController < ApplicationController
  before_action :set_profile, only: %i[new create]

  def new
    @post = @profile.posts.build
  end

  def create
    @post = @profile.posts.build post_params

    return render :new unless @post.save

    redirect_to @profile
  end

private

  def set_profile
    @profile = Profile.find params[:profile_id]
  end

  def post_params
    params.require(:post).permit(:text)
  end
end
