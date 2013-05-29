class StaticPagesController < ApplicationController
  def home
    @title = "Toor It"
  end

  def help
    @title = "Help"
  end

  def aboutus
    @title = "About Toor It"
  end
end
