Rsnw::App.controllers :forum do


  get :list do
  	render 'list'
  end
 
  get :index, :with => :id do
    @topics = Topics.filter(:fid=>params[:id]).reverse_order(:updated_at).all
    render 'index'
  end

end
