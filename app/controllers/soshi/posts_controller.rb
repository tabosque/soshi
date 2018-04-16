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

      if @post.save
        redirect_to category_post_path(@post.category, @post), notice: 'Post was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /posts/1
    def update
      if @post.update(post_params)
        redirect_to category_post_path(@post.category, @post), notice: 'Post was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /posts/1
    def destroy
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
          :description
        )
      end
  end
end
