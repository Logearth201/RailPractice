# coding: utf-8

class SessionsController < ApplicationController
  def create
    member = Member.authenticate(params[:email], params[:password])
    if member
      session[:member_id] = member.id
      redirect_to index_path
    else
      flash.alert = "Emailまたはパスワードが違います。"
      redirect_to login_path
    end
  end
  
  def destroy
    session.delete(:member_id)
    redirect_to index_path
  end
end
