class QuestionsController < ApplicationController
  before_action :set_question, only: %i[update show destroy hide edit]
  def create
    @question = Question.create(question_params)

    if @question.save
      redirect_to user_path(@question.user), notice: 'Новый вопрос создан!'
    else
      flash.now[:alert] = 'Вы неправильно заполнили поле для вопроса'
      render :new
    end
  end

  def update
    @question.update(question_params)
    redirect_to user_path(@question.user), notice: 'Вопрос сохранён!'
  end

  def destroy
    @user = @question.user
    @question.destroy
    redirect_to user_path(@user), notice: 'Вопрос удалён!'
  end

  def show
  end

  def index
    @questions = Question.all
    @question = Question.new
  end

  def new
    @user = User.find(params[:user_id])
    @question = Question.new(user: @user)
  end

  def edit
  end

  def hide
    @question.update(hidden: true)
    redirect_to questions_path, notice: 'Вопрос скрыт!'
  end

  private

  def question_params
    params.require(:question).permit(:body, :user_id, :hidden)
  end

  def set_question
    @question = Question.find(params[:id])
  end
end
