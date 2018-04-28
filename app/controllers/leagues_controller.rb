class LeaguesController < ApplicationController
  before_action :set_league, only: [:show, :edit, :update, :destroy]
  def index

  end

  def new
    @league = League.new
  end

  def create
    @league = League.new(league_params)
    if @league.save
      flash[:success] = "#{@league.name} #{@league.year} has been created."
      redirect_to league_path(@league)
    else
      flash.now[:danger] = "League creation failed."
      render 'new'
    end
  end

  def show
  end

  def edit
    
  end

  def update
    if @league.update_attributes(league_params)
      flash[:success] = "Your league has been updated."
      redirect_to league_path(@league)
    else
      flash.now[:danger] = "League update failed."
      render 'edit'
    end
  end

  def destroy
    @league.destroy
    flash[:success] = "Your league has been deleted"
    redirect_to new_league_path
  end

  private

    def league_params
      params.require(:league).permit(:name, :year, :champion)
    end

    def set_league
      @league = League.find(params[:id])
    end
end
