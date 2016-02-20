class StaticPagesController < ApplicationController
  def home
  end
  def contact
  end
  def guide
  end
  def lets_encrypt
    render text: ENV['LETSENCRYPT']
  end
end
