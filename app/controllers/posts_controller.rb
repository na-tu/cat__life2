class PostsController < ApplicationController
    def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
       flash[:notice] = "新しく投稿しました！"
    redirect_to post_path(@post)
    else
    @user = current_user#elseの下にこの記述が
    @posts = Post.all
      render :index
    end
    
 end

  def index
    @user = current_user
    @posts = Post.all
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
    @user = @post.user
    @posts = @user.posts
    @post_new = Post.new
    @post_comment = PostComment.new
  end

  def edit
   post = Post.find(params[:id])#editの中だけで確認するためにいれた。
   if current_user==post.user
    @post = Post.find(params[:id])
   else
    redirect_to posts_path
   end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
     flash[:notice] = "更新しました！"
    redirect_to post_path(@post.id)
    else
    render :edit
    end
  end

  def destroy
    post = Post.find(params[:id])  # データ（レコード）を1件取得
    post.destroy  # データ（レコード）を削除
    redirect_to posts_path
  end


  private

  def post_params
    params.require(:post).permit(:title, :body, :image,)
  end
  
end
