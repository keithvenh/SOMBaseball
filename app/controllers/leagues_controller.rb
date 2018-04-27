class LeaguesController < ApplicationController

  def index

  end

  def new
    @league = League.new()
  end

  def create
    @league = League.create(league_params)
    if @league.save
      render 'index'
    else
      flash[:danger] = "League failed to save"
      redirect_to 'new'
    end
  end

  def show

  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

    def league_params
      params.require(:league).permit(:name, :year, :champion)
    end
end
