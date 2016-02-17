class Game < ActiveRecord::Base
  has_many :favorites, dependent: :destroy
  has_many :users, through: :favorites, dependent: :destroy

  validates :title, prescence: true
  validates :title, uniqueness: { scope: :platform }

  validates :platform, prescence: true
  validates :developer, prescence: true
  validates :genre, prescence: true
end
