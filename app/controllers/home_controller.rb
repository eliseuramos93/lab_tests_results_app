class HomeController < ApplicationController
  def index
    @examinations = Examination.all
  end
end
