Rsnw::App.controllers :setup do
  
 
  get :forums do
    @title = "setup::forums"
    render 'forums'
  end

  get :checkforum, :with => :id do
    #ff = Forums.first(:fid => params[:id])    
    Forums.where(:fid => params[:id]).update(:check => 1)

    render 'forums'
  end

end
