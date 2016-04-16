class HomeController < ApplicationController
  def index
  	@lists = List.order(created_at: :desc)
  end
end
