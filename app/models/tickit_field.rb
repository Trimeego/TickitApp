class TickitField
  include Mongoid::Document
  include Mongoid::Timestamps 
  field :prompt, :type => String
  
  embedded_in :tickit, :inverse_of => :tickit_fields
end
