class StaticPagesController < ApplicationController
  def home
  end

  def admin
    authorize! :admin, :controls
  end
end
