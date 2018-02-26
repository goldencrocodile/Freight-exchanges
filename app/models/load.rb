class Load < ActiveRecord::Base
  LOAD_MATERIAL = ['Auto Parts', 'Bardana jute or plastic','Building Materials','Cement','Chemicals','Coal And Ash','Container',
'Cotton seed','Electronics Consumer Durables','Fertilizers','Fruits And Vegetables','Furniture And Wood Products','House Hold Goods','Industrial Equipments',
'Iron sheets or bars or scraps','Liquids in drums','Liquids/Oil','Machinery new or old','Medicals',
'Metals','Mill Jute Oil','Packed Food','Plastic Pipes or other products','powder bags','Printed books or Paper rolls',
'Refrigerated Goods','Rice or wheet or Agriculture Products','Scrap','Spices','Textiles','Tyres And Rubber Products','Vehicles or car'].freeze
LOAD_WEIGHT = ['Upto 3 MT','Upto 5 MT','Upto 7 MT','Upto 9 MT','Upto 15 MT','Upto 20 MT','Upto 25 MT','Upto 28 MT','Above 28']
NO_OF_TRUCKS = ['1','2','3','4','5','6','7','8','9','10']
LOAD_TRUCK_TYPE = ['canter jumbo',
    'Canters 3MT / 4 Wheel',
    'Canters 4.5MT / 4 wheel',
    'Canters 7.5MT / 6 wheel',
    'Container Close Body  32 Feet',
    'Container close body 20 feet',
    'Container Close Body 40 Feet',
    'Container Trucks',
    'Containers close body 24 feet',
    'Flat Bed Trailers (40 Feet)',
    'LCV (Light Commercial Vehicle)',
    'Semi Low Bed Trailer',
    'Tata 407 2.5 MT / 4 wheel',
    'Truck 15MT / 10 wheel',
    'Truck 16MT / 10 wheel',
    'Truck 20MT / 12 wheel',
    'Truck 21MT / 12 wheel',
    'Truck 24/25MT   / 14 wheel',
    'Truck 9MT / 6 wheel'
]
LOAD_TYPE = ['Full Load','Part Load']
validates :load_from, :if => Proc.new{|f| f.load_type == "Full load" },   :presence => {:message => "can't be blank."}
validates :load_to, :if => Proc.new{|f| f.load_type == "Full load" },   :presence => {:message => "can't be blank."}
validates :load_material, :if => Proc.new{|f| f.load_type == "Full load" },   :presence => {:message => "can't be blank."}
validates :load_schedule_date,   :presence => {:message => "can't be blank."}
validates :load_weight, :if => Proc.new{|f| f.load_type == "Full load" },   :presence => {:message => "can't be blank."}
validates :load_no_of_truck, :if => Proc.new{|f| f.load_type == "Full load" },   :presence => {:message => "can't be blank."}
validates :load_truck_type, :if => Proc.new{|f|  f.load_type == "Full load"},   :presence => {:message => "can't be blank."}
validates :source_pin_code, :presence => {:message => "can't be blank."}
validates :load_type, :presence => {:message => "can't be blank."}
validates :destination_pin_code, :presence => {:message => "can't be blank."}
validates :source_pin_code, :destination_pin_code ,:presence => true,
                 :numericality => true,
                 :length => { :minimum => 6, :maximum => 6 }
# default_scope { where(load_enabled: true) }
end
