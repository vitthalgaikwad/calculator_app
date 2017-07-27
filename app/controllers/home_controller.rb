require 'calculator'
class HomeController < ApplicationController
  def index
  end

  def calculate
    c = Calculator.new(params[:expression])
    @answer = c.evaluate
  end
end
