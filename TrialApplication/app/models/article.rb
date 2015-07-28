class Article < ActiveRecord::Base
  has_one :image, class_name: "ArticleImage", dependent: :destroy
  def viewtext
    text
  end
  def cookie_ref(params)
     #t = cookies[:test]
     if true
       "1"#image_tag "starok.png", :id => article.userid, :onclick => "cookie_savechange(#{params})"
     else
       "0"#image_tag "starng.png", :id => article.userid, :onclick => "cookie_savechange(#{params})"
     end
  end
  
  def cookie_change
     cookie["book#{params[:id]}"] = cookie["book#{params[:id]}"]
     cookie_ref
  end
  accepts_nested_attributes_for :image, allow_destroy: true
end
