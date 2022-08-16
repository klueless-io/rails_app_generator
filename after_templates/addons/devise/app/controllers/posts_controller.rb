class PostsController < ApplicationController
  before_action :authenticate_user!, except: %i[show index]
  before_action :set_post, only: %i[show edit update destroy]
  before_action :require_permission, only: %i[edit destroy]

  def index
    @posts = Post.all.order(updated_at: :desc)
  end

  def show
    @post.update(views: @post.views + 1)
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user

    respond_to do |format|
      if @post.save
        format.html { redirect_to post_url(@post), notice: "Post was successfully created." }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to post_url(@post), notice: "Post was successfully updated." }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url, notice: "Post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:title, :body, :views, :user_id)
    end

    def require_permission
      current_user_name     = current_user.name.capitalize
      post_user_name        = @post.user.name.capitalize
      post_user_name_plural = "#{post_user_name}#{post_user_name.ends_with?('s') ? "'" : "s"}"

      flash.notice = "#{current_user_name} is trying to #{action_name} #{post_user_name_plural} post."

      return if current_user.admin?                                     # Administrators can do anything
      return if current_user.moderator? && action_name == "edit"        # Moderators can edit any post (but not delete)
      return if current_user.user? && @post.user == current_user        # Users can edit or delete their own posts

      flash.alert = "You do not have permission to #{action_name} #{post_user_name_plural} post."

      redirect_back(fallback_location: root_path)
    end
end
