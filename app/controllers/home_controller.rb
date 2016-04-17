class HomeController < ApplicationController
  def index
    @lists = List.public_view.order(created_at: :desc)
  end
end
