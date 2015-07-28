# coding: utf-8
class IndexController < ApplicationController
  def index
    render "index"
  end
  
  def about
    render "about"
  end
  
  def favorite
    render "favorite"
  end
  
end
