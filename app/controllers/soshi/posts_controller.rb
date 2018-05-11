require_dependency "soshi/application_controller"

module Soshi
  class PostsController < ApplicationController
    before_action :set_post, only: [:edit, :update, :destroy]
    before_action :set_used_tags, only: [:new, :edit, :create, :update]

    # GET /posts
    def index
      @posts = Post.all
    end

    # GET /posts/1
    def show
      category = Category.find_by!(slug: params[:category_slug])
      @post = Post.find_by!(id: params[:id], category: category)
    end

    # GET /posts/new
    def new
      @post = Post.new
    end

    # GET /posts/1/edit
    def edit
    end

    # POST /posts
    def create
      @post = Post.new(post_params)

      if @post.save(validate: !params[:draft].present?)
        change_status
        if params[:draft].present?
          redirect_to edit_post_path(@post), notice: 'Post was successfully saved.'
        else
          redirect_to category_post_path(@post.category, @post), notice: 'Post was successfully created.'
        end
      else
        render :new
      end
    end

    # PATCH/PUT /posts/1
    def update
      @post.assign_attributes(post_params)
      if @post.save(validate: !params[:draft].present?)
        change_status
        if params[:draft].present?
          redirect_to edit_post_path(@post), notice: 'Post was successfully to private.'
        else
          redirect_to category_post_path(@post.category, @post), notice: 'Post was successfully updated.'
        end
      else
        render :edit
      end
    end

    # DELETE /posts/1
    def destroy
      @post.draft!
      @post.destroy
      redirect_to posts_url, notice: 'Post was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_post
        @post = Post.find(params[:id])
      end

      def set_used_tags
        @used_tags = ActsAsTaggableOn::Tag.all
      end

      # Only allow a trusted parameter "white list" through.
      def post_params
        params.require(:post).permit(
          :title,
          :body,
          :category_id,
          :tag_list,
          :description,
          :image,
        )
      end

      def change_status
        if params[:draft].present?
          @post.draft! 
        else
          @post.published! if @post.draft?
        end
      end
  end
end
