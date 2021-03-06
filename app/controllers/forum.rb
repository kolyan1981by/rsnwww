Rsnw::App.controllers :forum do


  get :index do
    LogHelper.log_req(request)
  	@title = "rsn::forums:list"
    @forums = Forums.filter(:priority=>1).reverse_order(:bot_updated_at).all
    render 'list'
  end
  get :list do
    LogHelper.log_req(request)
    @title = "rsn::forums:list"
    @forums = Forums.filter(:priority=>1).reverse_order(:bot_updated_at).all
    render 'list'
  end
  get :index, :with => :id do
    LogHelper.log_req(request)
  	forum = Forums.first(:fid=>params[:id])
  	@title = forum.name
    @topics = Topics.filter(:fid=>params[:id]).reverse_order(:updated_at).all

    render 'index'
  end

end
