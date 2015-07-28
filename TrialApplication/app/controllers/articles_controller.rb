class ArticlesController < ApplicationController
  def index
    ajax_action unless params[:ajax_handler].blank?
    #limit(5)の部分は特に意味は、この時点ではないけど貼り付けておいた。後のため。
    @articles = Article.offset([Article.count-10,0].max).limit(10).reverse
    @expandarticle = 10
    @limitarticle = Article.count
    render "index"
  end
  
  def show
    @article = Article.find(params[:id])
    if params[:format].in?(["jpg","png","gif"])
      send_image
    else
      render "articles/show"
    end
  end
  
  def new
    @article = Article.new
    @article.build_image
  end
  
  def edit
    #現在のIDと一致していない場合は編集不可にする
    @article = Article.find(params[:id])
    @article.build_image unless @article.image
  end
  
  def create
    @article = Article.new(article_params)
    #とりあえずid=1(Admin)にしておく。ordernumberは不要、削除予定
    @article.userid = @current_member.id
    @article.ordernumber = 1
    #日時の取得
    day = Time.now
    @article.submitday = "#{day.year}-#{day.month}-#{day.day}"
    t = @article.save
    if t
      redirect_to play_path, notice: "記事を投稿しました"
    else
      render "new"
    end
  end
  
  def update
    @article = Article.find(params[:id])
    @article.assign_attributes(article_params)
    if @article.save
      redirect_to play_path, notice: "記事を更新しました"
    else
      render "edit"
    end
  end
  
  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to play_path, notice: "記事を削除しました"
  end
  
  
  def favorite
    
  end
  
  private
    def article_params
      attrs = [:text, :title, :image]
      attrs << { image_attributes: [:_destroy, :id, :uploaded_image] }
      params.require(:article).permit(attrs)
    end
    
    def article_params2
      attrs = [:text, :title]
      params.require(:article).permit(attrs)
    end
    
    def send_image
      if @article.image.present?
        send_data @article.image.picture,
         type: @article.image.content_type, disposition: "inline"
      else
         raise NotFound
      end
    end
    
end
