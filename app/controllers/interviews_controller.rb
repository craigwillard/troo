class InterviewsController < ApplicationController
  before_filter :find_interviewee
  before_filter :authorize

  def index
    if @interviewee
      @interviews = @interviewee.interviews_as_interviewee
    else
      @interviews = Interview.all
    end

    respond_to do |format|
      format.html
      format.json { render json: @interviews }
    end
  end

  def show
    if @interviewee
      @interview = @interviewee.interviews_as_interviewee.find(params[:id])
    else
      @interview = Interview.find(params[:id])
    end

    respond_to do |format|
      format.html
      format.json { render json: @interview }
    end
  end

  def new
    @interview = Interview.new

    if @interviewee
      @interview.interviewee_id = @interviewee.id
    end

    if @interviewer
      @interview.interviewer_id = @interviewer.id
    end

    respond_to do |format|
      format.html
      format.json { render json: @interview }
    end
  end

  def edit
    @interview = Interview.find(params[:id])
  end

  def create
    @interview = Interview.new(params[:interview])

    respond_to do |format|
      if @interview.save
        format.html { redirect_to @interview.interviewee, notice: 'Interview was successfully created.' }
        format.json { render json: @interview, status: :created, location: @interview }
      else
        format.html { render action: "new" }
        format.json { render json: @interview.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @interview = Interview.find(params[:id])

    respond_to do |format|
      if @interview.update_attributes(params[:interview])
        format.html { redirect_to @interview.interviewee, notice: 'Interview was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @interview.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @interview = Interview.find(params[:id])

    @interview.destroy

    respond_to do |format|
      if @interviewee
          format.html { redirect_to @interviewee }
          format.json { head :no_content }
      else
          format.html { redirect_to interviews_url }
          format.json { head :no_content }
      end
    end
  end

private
  def find_interviewee
    @interviewee = User.find(params[:user_id]) if params[:user_id]
  end
end
