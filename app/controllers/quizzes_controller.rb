class QuizzesController < ApplicationController
  before_action :find_quiz, only: [:edit, :update, :destroy, :show]

  # This action is to list all the quizzes in our database.
  # We access it with GET request to "/quizzes"
  def index
    @quiz = Quiz.all
  end

  # the new action is generally used to display the form to create the record
  # in this case. The new action displays the form to create a quiz.
  def new
    # defining an new Quiz instnace variable to help us generate the
    # form needed to create the quiz
    @quiz = Quiz.new
    # This will render app/views/quizzes/new.html.erb (by convention)
  end

  def create
    # params[:quiz] => {"title"=>"My first quiz", "body"=>"My first quiz body"}

    # This uses Strong Paramters feature of Rails where you must explicit by
    # default about what parameters you'd like to allow for your record
    # in this case we only want the user to enter teh title and the body
    quiz_params = params.require(:quiz).permit([:name, :email, :department, :massage, :action])
    @quiz       = Quiz.new(quiz_params)

    # the quiz.save will return true if it passes validations and saves
    # correctly to the database. Otherwise, it will return false.
    if @quiz.save
      # redirect_to sends a response back to the browser with a new url so the
      # browser can make a new GET request to that URL
      # redirect_to(quiz_path(id: @quiz.id))
      redirect_to quiz_path(@quiz), notice: "Quiz Created"
    else
      # this will render "new.html.erb" inside of "/views/quizzes/" folder
      render :new
    end

    # this is just to show on the page the params we get from the user
    # for testing purposes
    # render text: params[:quiz]
  end

  # you access this action by visiting /quizzes/:id
  # where :id is the id of the quiz we'd like to display
  def show
  end

  # this is used to render a page that will edit an existing record in
  # the database. The URL for it will be /quizzes/:id/edit
  def edit
  end

  def update
    quiz_params = params.require(:quiz).permit([:name, :email, :department, :massage, :action])
    # if the record updates successfully we redirect the user to the
    # quiz show page.
    if @quiz.update(quiz_params)
      redirect_to quiz_path(@quiz), notice: "Quiz Updated"
    else
      # we render the edit page again with errors if the user doesn't enter
      # values that pass validations
      render :edit
    end
  end

  def destroy
    @quiz.destroy
    redirect_to quizzes_path, notice: "Quiz Destroyed"
  end

  private

  def find_quiz
    @quiz = Quiz.find params[:id]
  end

end
