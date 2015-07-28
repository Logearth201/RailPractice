class GetterController < ApplicationController
  def review_content
    logger.debug("現在の取得数：#{params[:getid]}")
    #取得可能な数を数える
    leftnum = Article.count - params[:getid].to_i #残り記事数
    
    getnum = [leftnum,params[:setcontentnum].to_i].min #取得する記事数
    rootnum = leftnum - getnum #記事取得の基点
    @sendtime = params[:sendparam]
    
    if getnum <= 0
       render text: "end"
    else
       @articles = Article.offset(rootnum).limit(getnum).reverse
    end
  end
end