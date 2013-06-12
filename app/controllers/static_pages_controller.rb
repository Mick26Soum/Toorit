class StaticPagesController < ApplicationController
  def home
    @title = "Toor It"
    #TODO: update home page to list all products with pagination
    #TODO: need to user partials from products view show templates

  end

  def help
    @title = "Help"
  end

  def aboutus
    @title = "About Toor It"
  end
end
