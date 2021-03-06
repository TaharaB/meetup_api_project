class MeetupsController < ApplicationController
  def index
    @meetups = Meetup.all
  end

  def new
    @meetup = Meetup.new
  end

  def show
    @meetup = Meetup.find(params[:id])
    @comment = Comment.new
    @comment.meetup_id = @meetup.id
  end

  def edit
    @meetup = Meetup.find(params[:id])
  end

  def update
    @meetup= Meetup.find(params[:id])
    @meetup.update(meetup_params)

     flash.notice = " The Meetup Idea '#{@meetup.title}' was updated!"
    redirect_to meetup_path(@meetup)
  end

  def destroy
     @meetup = Meetup.find(params[:id])
        @meetup.destroy
        flash.notice = "Meetup '#{@meetup.title}' Destroyed!"
        redirect_to meetups_path
  end

  def create
    @meetup = Meetup.new(meetup_params)
    @meetup.save
    redirect_to meetup_path(@meetup)
  end

  def meetup_params
    params.require(:meetup).permit(:title, :body)
  end


end
