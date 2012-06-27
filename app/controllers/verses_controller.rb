class VersesController < ApplicationController
  def index
    @verses = Verse.order("id desc")

    respond_to do |format|
      format.html
      format.json { render json: { verses: @verses } }
    end
  end

  def show
    @verse = Verse.find(params[:id])
    render json: @verse
  end

  def create
    @verse = Verse.new(params[:verse])

    if @verse.save
      render json: @verse, status: :created, location: @verse
    else
      render json: @verse.errors, status: :unprocessable_entity
    end
  end

  def update
    @verse = Verse.find(params[:id])
    if @verse.update_attributes(params[:verse])
      render json: nil, status: :ok
    else
      render json: @verse.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @verse = Verse.find(params[:id])
    if @verse.destroy
      render json: nil, status: :ok
    else
      render json: @verse.errors, status: :unprocessable_entity
    end
  end
end
