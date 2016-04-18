class HomeController < ApplicationController
  skip_before_filter :authenticate_user!, only: :index

  def index
    @lists = List.public_view.order(created_at: :desc)
  end
end
