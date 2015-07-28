class ArticleImage < ActiveRecord::Base
  belongs_to :article
  IMAGE_TYPES = { "image/jpeg" => "jpg" , "image/png" => "png" , "image/gif" => "gif" }
  attr_reader :uploaded_image
  validate :check_image
  #attr_accessible :uploaded_image
  #attr_accessible :uploaded_image, as: :admin Ver 4.0- :none
  
  def extension
    IMAGE_TYPES[content_type]
  end
  
  def uploaded_image=(image)
    self.content_type = convert_content_type(image.content_type)
    self.picture = image.read
    @uploaded_image = image
  end
  
  private
    def convert_content_type(ctype)
      ctype = ctype.rstrip.downcase
      case ctype
        when "image/pjpeg" then "image/jpeg"
        when "image/jpg" then "image/jpeg"
        when "image/x-png" then "image/png"
        else ctype
      end
    end
    
    def check_image
    if @uploaded_image
      if picture.size > 15 * 1024 * 1024
        errors.add(:uploaded_image, :too_big_image)
      end
      unless IMAGE_TYPES.has_key?(content_type)
        errors.add(:uploaded_image, :invalid_image)
      end
    end
  end
end
