class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, #:registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :articles
  has_and_belongs_to_many :comments

  def alias_name(middle_name)
    "#{name} \"#{middle_name}\" #{surname}"
  end
end
