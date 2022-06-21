class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :programs
  has_many :applications
  has_one_attached :photo
  acts_as_voter


  enum user_type: { Employer: 0, Student: 1 }#, default: :nil

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :location, presence: true
  validates :organization_name, presence: true, if: :Employer?
  validates :organization_name, uniqueness: true, if: :Employer?
  #Is age necessary though?  Fuark.  
  validates :age, presence: true, numericality: { only_integer: true }, if: :Student?
  validates :user_type, presence: true
  validates :photo, attached: true, size: { less_than: 5.megabytes , message: 'Your photo must be less than 5 mb' }
  
end
