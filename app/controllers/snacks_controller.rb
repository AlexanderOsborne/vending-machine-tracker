class SnacksController < ApplicationController

  def index
    @snacks = Snack.all
  end

  def show
    @snack = Snack.find(params[:id])
  end
end