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

      @title = "rsn:recent"
      from = DateTime.now.new_offset(0) - (24/24.0)

      @forums = Forums.to_hash(:fid,:name)
      @topics = Topics.filter('updated_at > ?',from).to_hash(:smid)

      @posts = Posts.join(:topics, :smid=>:smid).exclude(fid:[33,34,84]).filter('addedat > ? ', from).order(:addedat).all

      @page =1
      @responses = @posts.size
      @url = "/stat/recent_posts"
      render 'posts_grouped_by_thread'

    end

end
