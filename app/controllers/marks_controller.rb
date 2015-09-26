class MarksController < ApplicationController

  # GET /marks
  def index
    res = Api::call '/students/5/school_years'

    if params[:school_year].nil?
      @school_year = res['school_years'].last
      @school_year = @school_year['year']
    else
      @school_year = params[:school_year]
    end

    res_marks = Api::call "/students/5/marks/#{@school_year}"

    @school_years = res['school_years']
    @marks = res_marks['marks']
  end
end
