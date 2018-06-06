class Admin::AwardsController < Admin::BaseController

  def index
    @awards = Award.all
  end

  def new
    @award = Award.new
  end

  def create
    @award = Award.create(award_params)
    if @award.save
      redirect_to admin_awards_path
    else
      render :new
    end
  end


  private

  def award_params
    params.require(:award).permit(:name)
  end

end
