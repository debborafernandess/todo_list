class List < ActiveRecord::Base
  belongs_to :user

  validates :user, presence: true

  scope :public_view,	-> { where(private_visibility: false) }
end
