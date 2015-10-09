class CoursesController < ApplicationController
  def index
    @courses = Course.paginate page: params[:page]
  end
end
