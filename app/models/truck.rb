class Truck < ActiveRecord::Base
  belongs_to :user
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
  validates :transit_time,   :presence => true
PROVIDE_DOCS = { Yes: 1, No: 0 }
FREQUENCY = { monthly: 1, weekly: 2, daily: 3 }
TRANSIT_TIME = {'1': 1,'2':2,'3':3,'4':4,'5':5, '6':6, '7':7,'8':8,'9':9}
TRUCK_STATUS = { request: 0, requesting: 1, accept_request:2 }
  # default_scope { where(truck_enabled: true) }
  def booked(truck)
    if truck.truck_booked == true
    end
  end
  def self.search(params)
    if params
      find(:all, :conditions=>["truck_from LIKE ? AND truck_to LIKE ? AND vehicle_number LIKE ?", "%#{params[:truck_from]}%","%#{params[:truck_to]}%","%#{params[:vehicle_number]}%"])
    else
      find(:all)
    end
  end
end