class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  belongs_to :role
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  validates :first_name,:presence => true
  validates :last_name,:presence => true
  validates :mobile_number,   :presence => {:message => 'Mobile number with 10 digit!'},
                     :numericality => true,
                     :length => { :minimum => 10, :maximum => 11}
validates :address_pin_code,   :presence => {:message => 'Pin number with 6 digit!'},
	:numericality => true,
	:length => {:maximum => 6}
  validates :address_line1,:presence => true
  validates :address_line2,:presence => true
  validates :address_pin_code,:presence => true
  validates :address_country,:presence => true
  validates :address_state,:presence => true
  validates :address_city,:presence => true
  validates :company_type,:presence => true
  validates :company_pan_no,:presence => true
  validates :role_id,:presence => true
  validates :other_detail_aadhaar_no, :presence => {:message => 'Aadhaar card number should be 12 digit!'}, :numericality => true,
  :length => {:maximum => 12, :minimum=> 12}
  validates :email, :password, presence: true
end