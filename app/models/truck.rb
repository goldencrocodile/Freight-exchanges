class Truck < ActiveRecord::Base
  belongs_to :user
  has_many :drivers
	validates :vehicle_number,   :presence => {:message => "can't be blank."}
  validates :driver_name,   :presence => {:message => "can't be blank."}
  # validates :driver_mobile_no,   :presence => {:message => "can't be blank."}
  # validates :truck_weight,   :presence => {:message => "can't be blank."}
  validates :truck_type,   :presence => {:message => "can't be blank."}
  # validates :schedule_date,   :presence => {:message => "can't be blank."}
  validates :truck_from,   :presence => {:message => "can't be blank."}
  validates :truck_to,   :presence => {:message => "can't be blank."}
  validates :driver_mobile_no,:presence => true,
                 :numericality => true,
                 :length => { :minimum => 10, :maximum => 15 }
  validates :licence_number,:presence => true,
                 :length => { :maximum => 15 }
  validates :transit_time,   :presence => true
  validates :current_transporter_name,   :presence => true
PROVIDE_DOCS = { Yes: 1, No: 0 }
FREQUENCY = { monthly: 1, weekly: 2, daily: 3 }
TRANSIT_TIME = {'1': 1,'2':2,'3':3,'4':4,'5':5, '6':6, '7':7,'8':8,'9':9}
TRUCK_STATUS = { request: 0, requesting: 1, accept_request:2 }
TRUCK_BODY = { Open: 1,Close: 2}
SHARE_DOCS = { No: 0,Yes: 1}
TRUCK_CAPICITY = {'LCV (Tata 407)': '2.5 MT', 
  'LCV (Canter / Swaraj Mazda)': '3.5 MT',
  'LPT 709': '4.5 MT',
  'LPT 1109': '7.5 MT',
  'Containerised Truck 24 FT SXL': '7 MT',
  'Containerised Truck 24 FT DBL SXL': '14 MT',
  'Containerised Truck 32 FT SXL': '7 MT',
  'Containerised Truck 32 FT MXL': '14 MT',
  'Open Body Truck': '9 MT',
  'Taurus': '15 MT',
  'Taurus': '21 MT',
  'Trailer': '20 MT',
  'High Bed Trailer (DBL AXLE)': '22 MT',
  'High Bed Trailer Triple AXLE': '27 MT',
  'Trailer Triple AXLE': '32 MT',
  'Semi Low Bed Trailer': '22 MT',
  'Low Bed trailer': '22 MT'
    }
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
