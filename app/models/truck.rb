class Truck < ActiveRecord::Base
	validates :vehicle_number,   :presence => {:message => "can't be blank."}
  validates :driver_name,   :presence => {:message => "can't be blank."}
  # validates :driver_mobile_no,   :presence => {:message => "can't be blank."}
  validates :truck_weight,   :presence => {:message => "can't be blank."}
  validates :truck_type,   :presence => {:message => "can't be blank."}
  # validates :schedule_date,   :presence => {:message => "can't be blank."}
  validates :truck_from,   :presence => {:message => "can't be blank."}
  validates :truck_to,   :presence => {:message => "can't be blank."}
  validates :driver_mobile_no,:presence => true,
                 :numericality => true,
                 :length => { :minimum => 10, :maximum => 15 }
  # default_scope { where(truck_enabled: true) }
end