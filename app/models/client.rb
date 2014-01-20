class Client < ActiveRecord::Base
  has_many :projects, dependent: :destroy
  validates :name, presence: true, length: { minimum: 3 }
  validates :code, presence: true, length: { in: 3..6 }
end
