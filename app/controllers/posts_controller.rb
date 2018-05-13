class PostsController < ApplicationController
	def show
    @post = Post.find(params[:id])
  	end

  def life
    posts_for_branch(params[:action])
  end

  def physical
    posts_for_branch(params[:action])
  end

  def applied
    posts_for_branch(params[:action])
  end





 private

	def posts_for_branch(branch)
	  @categories = Category.where(branch: branch)
	  @posts = get_posts.paginate(page: params[:page])

    respond_to do |format|
      format.html
      format.js { render partial: 'posts/posts_pagination_page' }
    end

    

	end


  def get_posts
    PostsForBranchService.new({
      search: params[:search],
      category: params[:category],
      branch: params[:action]
    }).call
  end







end
