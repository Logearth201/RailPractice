class MembersController < ApplicationController
  def index
    @members = Member.order("id")
    render "index"
  end
  
  def show
    @member = Member.find(params[:id])
    #@articles = Article.where(userid: @member.id).reverse
  end
  
  def new
    @member = Member.new
    render "new"
  end
  
  def edit
    @member = Member.find(params[:id])
  end
  
  
  def create
    @member = Member.new(member_params)
    @member.score = 0
    @member.life = 3
    if @member.save
      redirect_to index_path, notice: "会員登録が完了しました。ログインしてください。"
    else
      render "new"
    end
  end
  
  def update
    @member = Member.find(params[:id])
    @member.assign_attributes(member_params2)
    
    if @member.save
      redirect_to @member, notice: "会員情報を更新しました"
    else
      render "edit"
    end
  end
  
  def destroy
    @member = Member.find(params[:id])
    @member.destroy
    redirect_to :members, notice: "会員を削除しました"
  end
  
  def search
    @members = Member.search(params[:q])
    render "index"
  end
  
  private
  
    def member_params
      params.require(:member).permit(:name, :email, :password, :password_confirmation)
    end
    def member_params2
      params.require(:member).permit(:name, :email)
    end
end
