class LessonsController < ApplicationController

  def index
    @lessons = current_user.lessons
  end

  def create
    @course = Course.find params[:course_id]
    @lesson = Lesson.new
    @lesson.user = current_user
    @lesson.course = @course
    if @lesson.save
      flash[:success] = t "messages.lesson.new.success"
      redirect_to course_lesson_path @course, @lesson
    else
      flash[:danger] = t "messages.lesson.new.danger"
      redirect_to request.referrer
    end
  end

  def show
    @lesson = Lesson.find params[:id]
  end

  def update
    @lesson = Lesson.find params[:id]
    if @lesson.update_attributes lesson_params
      flash[:success] = t "messages.lesson.update.success"
      redirect_to lesson_answers_path lesson_id: @lesson.id
    else
      flash[:danger] = t "message.lesson.update.danger"
      redirect_to courses_path
    end
  end

  private
    def lesson_params
      params.require(:lesson).permit answers_attributes: [:id, :option_id]
    end
end
