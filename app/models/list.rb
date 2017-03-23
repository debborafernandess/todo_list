class List < ActiveRecord::Base
  belongs_to  :user

  has_many :favorites
  has_many :favorite_users, through: :favorites
  has_many :tasks

  accepts_nested_attributes_for :tasks

  validates :user, :name, presence: true

  scope :publics, -> { where(private_visibility: false) }

  def owner?(current_user)
    user == current_user
  end

  def self.publics_and_owned(user)
    where('user_id = ? or private_visibility = false', user.id)
  end
end
