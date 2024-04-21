class HomeController < ApplicationController
  def index
    @total_pages = (Examination.count / 30.0).ceil
    page = params[:page]&.to_i&.between?(1, @total_pages) ? params[:page] : 1

    index = (page.to_i - 1) * 30
    @examinations = Examination.all[index...index + 30]
  end
end
