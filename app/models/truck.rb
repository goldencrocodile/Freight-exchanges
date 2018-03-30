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
  # validates :current_transporter_name,   :presence => true
PROVIDE_DOCS = { Yes: 1, No: 0 }
FREQUENCY = { monthly: 1, weekly: 2, daily: 3 }
TRANSIT_TIME = {'0' : 0, '1': 1,'2':2,'3':3,'4':4,'5':5, '6':6, '7':7,'8':8,'9':9}
TRUCK_STATUS = { request: 0, requesting: 1, accept_request:2, paid: 3}
TRUCK_BODY = { Open: 1,Close: 2}
SHARE_DOCS = { No: 0,Yes: 1}
LOAD_CAPICITY = [
  '2.5 MT', 
  '3.5 MT',
  '4.5 MT',
  '7.5 MT',
  '7 MT',
  '14 MT',
  '7 MT',
  '14 MT',
  '9 MT',
  '15 MT',
  '21 MT',
  '20 MT',
  '22 MT',
  '27 MT',
  '32 MT'
]
TRUCK_CAPICITY = [
  'LCV (Tata 407)', 
  'LCV (Canter / Swaraj Mazda)',
  'LPT 709',
  'LPT 1109',
  'Containerised Truck 24 FT SXL',
  'Containerised Truck 24 FT DBL SXL',
  'Containerised Truck 32 FT SXL',
  'Containerised Truck 32 FT MXL',
  'Open Body Truck',
  'Taurus',
  'Taurus',
  'Trailer',
  'High Bed Trailer (DBL AXLE)',
  'High Bed Trailer Triple AXLE',
  'Trailer Triple AXLE',
  'Semi Low Bed Trailer',
  'Low Bed trailer']
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
