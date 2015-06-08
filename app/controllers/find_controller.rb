class FindController < ApplicationController
  def index
  end
  def create
  #  @quiz = Quiz.where(action: params[:name]).all
  #  @quiz = Quiz.where(name: params[:name]).where(email: params[:email]).where(department: params[:department]).where(action: params[:action]).all
  @quiz = Quiz.order(action: :desc)
  end
end
