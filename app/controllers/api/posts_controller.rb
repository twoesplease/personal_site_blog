class Api::PostsController < Api::ApiController

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
      render status:200, json: {
        message: "You did it! Post successfully created.",
        post: post
      }.to_json
    else
      render status: 422, json: {
        message: "Hmm, that didn't work.  Try again.",
        errors: post.errors
      }.to_json
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    render status: 200, json: {
      message: "That post has been successfully deleted."
    }.to_json
  end

  def update
    post = Post.find(params[:id])
    if post.update(post_params)
      render status: 200, json: {
        message: "Post successfully updated.",
        post: post
      }.to_json
    else
      render status: 422, json: {
        message: "The post could not be updated.",
        post: post
      }.to_json
    end
  end

  private
  def post_params
    params.require(:post).permit(:title, :body)
  end
end
