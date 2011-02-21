class Tickit
  include Mongoid::Document
  include Mongoid::Timestamps 
  field :title, :type => String
  field :description, :type => String
  field :prompt, :type => String
  field :created_at, :type => Date
  field :created_by, :type => String
  field :updated_at, :type => Date
  field :updated_by, :type => String
  
  validates_presence_of :title, :description, :prompt
  embeds_many :tickit_fields
  
  accepts_nested_attributes_for :tickit_fields
    
  embedded_in :user, :inverse_of => :tickits
end
