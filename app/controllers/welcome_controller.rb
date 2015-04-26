class WelcomeController < ApplicationController
  def home
    if current_user
     redirect_to websites_path
    else
      render home
    end        
  end
end
