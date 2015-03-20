FactoryGirl.define do
	factory :role do
  	name 'User'
  	description 'Cliente'
  end
  
  factory :leaseholder, class: Role do
  	name 'LeaseHolder'
  	description 'Cliente'
  end

  factory :consultant, class: Role do
  	name 'Consultant'
  	description 'Asesor Inmobiliario'
  end
  
  factory :admin, class: Role do
  	name 'Administrator'
  	description 'Administrador del Sistema'
  end
end
