class Comment < ApplicationRecord
  belongs_to :article
  has_and_belongs_to_many :users
  has_many :pictures, as: :imageable
end
