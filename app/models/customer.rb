class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :shippings, dependent: :destroy       

  def deleted_judge
    if is_deleted
      return '退会'
    else
      return '有効'
    end
  end

  def full_name
  last_name + first_name
  end

  def space_full_name
  last_name + " " + first_name
  end

  def space_full_name_kana
  last_name_kana + " " + first_name_kana
  end

end
