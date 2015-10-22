class StaticPagesController < ApplicationController
  skip_before_filter :require_login, :only => [:index, :home]

  def home

  end
end
