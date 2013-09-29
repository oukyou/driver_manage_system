# encoding: UTF-8
# author:jairy
class HolidaysController < ApplicationController
  def index
    respond_to do |format|
      format.html
      format.json { render :json => Holiday.all }
    end
  end

  def create
    holiday = Holiday.new
    holiday.title = params[:title]
    holiday.start = Date.parse(params[:start]).strftime("%Y-%m-%d")
    holiday.end = Date.parse(params[:end]).strftime("%Y-%m-%d")

    holiday.save()
    render :json => holiday.to_json
  end

  def destroy
    Holiday.delete(params[:id].to_i)
    render :json => {}
  end
end