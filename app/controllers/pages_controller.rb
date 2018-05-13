class PagesController < ApplicationController

  def index
    @life_posts = Post.by_branch('life').limit(8)
    @physical_posts = Post.by_branch('physical').limit(8)
    @applied_posts = Post.by_branch('applied').limit(8)
  end

	
end
