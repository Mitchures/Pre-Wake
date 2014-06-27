class MicropostsController < ApplicationController
  before_action :signed_in_user,  only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

  def create
    @micropost = Micropost.new(micropost_params)
    @micropost.update(user_post: :user_id)
    if @micropost.save
      flash[:success] = "Post created!"
      redirect_to :back
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def destroy
    @micropost.destroy
    redirect_to :back
  end

  private

    def micropost_params
      params.require(:micropost).permit(:content, :user_id, :image)
    end

    def correct_user
      @micropost = current_user.microposts.find_by(id: params[:id])
      redirect_to root_url if @micropost.nil?
    end
end
