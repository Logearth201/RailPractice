module ApplicationHelper
  def article_image_tag(article, options = {})
    logger.debug(article.image.present?)
    if article.image.present?
      path = article_path(article, format: article.image.extension)
      image_tag(path, { alt: article.title }.merge(options))
    else
      ""
    end
  end
end
