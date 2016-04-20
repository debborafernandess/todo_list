class List < ActiveRecord::Base
  belongs_to  :user

  has_many    :tasks

  has_many :favorites
  has_many :favorite_users, through: :favorites

  accepts_nested_attributes_for :tasks

  validates :user, :name, presence: true

  scope :public_view,	  -> { where(private_visibility: false) }
  scope :public_or_own, -> (user_id) { where('user_id = ? or private_visibility = false', user_id) }

  def owner?(current_user)
    user == current_user
  end

end
