class Admin::GenresController < ApplicationController
  before_action :require_admin

  def index
    @genres = Genre.all
  end

  def create
    @genres = Genre.create
  end

  private
     def require_admin
       render file: "/public/404" unless current_admin?
     end
end
