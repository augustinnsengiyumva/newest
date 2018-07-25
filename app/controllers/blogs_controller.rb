class BlogsController < ApplicationController
   before_action :set_blog, only: [:show, :edit, :update, :destroy] 
  
  
  def index
    @blogs = Blog.all
  end

  # Add
  def new
  if params[:back]
      @blog = Blog.new(blog_params)
    else
       @blog = Blog.new    
  end
  
  end
  def create
     
     @blog = Blog.new(blog_params)
    @blog.user_id = current_user.id
    if @blog.save
      # Switch to the list screen and display a message saying "You have created new blog!"
      redirect_to blogs_path, Notice: "You have created new blog!"
    else
      # Redraw the input form.
      render 'new'
    end
  end
  def show
    # 追記する
     @blogs = Blog.find(params[:id])
  end
  def edit
     @blogs = Blog.find(params[:id])
  end
    
    def update
    @blog = Blog.find(params[:id])
    if @blog.update(blog_params)
      redirect_to blogs_path, notice: "You have edited this blog！"
    else
      render 'edit'
    end
  end
  
  def destroy
    @blogs.destroy
    redirect_to blogs_path, Notice: "You have deleted the blog!"
  end
  
  

  #Omitted
  private
  #Before_action : Set_blog, only: [:show, :edit, :update, :destroy] 
   def blog_params
    params.require(:blog).permit(:title, :content)
  end
  
  def set_blog
    @blog = Blog.find(params[:id])
  end
end  
  #Omission
  
  #Omission
  #Omitted

