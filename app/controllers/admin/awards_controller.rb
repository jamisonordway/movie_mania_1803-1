class Admin::AwardsController < Admin::BaseController

  def index
    @awards = Award.all
  end

  def new
    @award = Award.new
  end
end
