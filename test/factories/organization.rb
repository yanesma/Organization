require 'factory_girl'
 
Factory.define :organisation do |m|
  m.sequence(:name) {|n| "Test Organization #{n}"}
end

