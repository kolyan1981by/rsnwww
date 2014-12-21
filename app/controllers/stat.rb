Rsnw::App.controllers :stat do

  # get :index, :map => '/foo/bar' do
  #   session[:foo] = 'bar'
  #   render 'index'
  # end

  # get :sample, :map => '/sample/url', :provides => [:any, :js] do
  #   case content_type
  #     when :js then ...
  #     else ...
  # end

  # get :foo, :with => :id do
  #   'Maps to url '/foo/#{params[:id]}''
  # end

  # get '/example' do
  #   'Hello world!'
  # end

  get :recent_posts do
    from = DateTime.now - (300/1440.0)


    @posts = Posts.filter('addedat > ? ', from).order(:addedat).all

    @page =1
    @responses = @posts.size
    @url = "/stat/recent_posts"
    render 'thread/index'

  end

end
