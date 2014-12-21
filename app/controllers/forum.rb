Rsnw::App.controllers :forum do


  get :list do
  	@title = "rsn::forums"
  	render 'list'
  end
 
  get :index, :with => :id do
  	forum = Forums.first(:fid=>params[:id])
  	@title = forum.name
    @topics = Topics.filter(:fid=>params[:id]).reverse_order(:updated_at).all

    render 'index'
  end

end
