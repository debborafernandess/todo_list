class HomeController < ApplicationController
  skip_before_filter :authenticate_user!, only: :index

  def index
    @lists = List.publics.order(created_at: :desc)
  end
end
