class StaticPagesController < ApplicationController
  def home
    @messages = ["hello", "adam", "links", "ok world"]
  end
end
