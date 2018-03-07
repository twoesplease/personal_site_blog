class Api::PostsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render json: Post.all
  end

  def show
    post = Post.find(params[:id])
    render json: post
  end

  def create
    post = Post.new(post_params) 
    if post.save
      head 200
    else
      head 500
    end
  end

  private
  def post_params
    params.require("post").permit("title")
  end
end
