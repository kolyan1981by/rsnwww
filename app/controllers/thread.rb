Rsnw::App.controllers :thread do

  get :index, :with => [:id, :page] do
    #LogHelper.log_req(request)


    tp = Topics.first(:smid => params[:id])
    @title = tp.title

    @page = params[:page].to_i
    @posts = Posts.where(:smid => params[:id]).order(:addedat).extension(:pagination).paginate(@page, 20).all

    @responses = tp.responses.to_i
    @url = "/thread/#{params[:id]}"
    render 'index'
  end

end
