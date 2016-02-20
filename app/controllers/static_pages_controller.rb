class StaticPagesController < ApplicationController
  def home
  end
  def contact
  end
  def guide
  end
  def lets_encrypt
    if params[:id] = ENV['LE_URL']
      render text: ENV['LE_RESP'] 
    else
      render status: :not_found
    end
  end
end
