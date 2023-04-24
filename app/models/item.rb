class Item < ApplicationRecord

  has_one_attached :image

   belongs_to :genre
   has_many :cart_items, dependent: :destroy
   
   
  def active_judge
    if is_active
      return '販売中'
    else
      return '販売停止中'
    end
  end
    
  

  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/default-image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [width, height]).processed
  end

end
