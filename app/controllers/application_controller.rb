class ApplicationController < ActionController::Base
  before_action :init_cats
  def init_cats
    @cats = Category.all
  end
end
