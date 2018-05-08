require_dependency "soshi/application_controller"

module Soshi
  class TagsController < ApplicationController
    def index
      @tags = ActsAsTaggableOn::Tag.all
    end

    def show
      @tag = ActsAsTaggableOn::Tag.find(params[:id])
      @posts = Post.tagged_with(@tag.name)
    end
  end
end