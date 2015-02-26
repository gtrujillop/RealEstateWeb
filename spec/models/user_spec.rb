require 'rails_helper'

describe User do

	describe "password validations" do
		it "fails because no password" do
    	expect(User.new({ username: "user_1",birth_date: '11-09-1988', first_name: "Juan", last_name: "Perez", email:'my_email@email.com'}).save).to be false
  	end

  	it "fails because password is short" do
    	expect(User.new({username: "user_1",birth_date: '11-09-1988', first_name: "Juan", last_name: "Perez", password: 'blah', email:'my_email@email.com'}).save).to be false
  	end

  	it "fails because password confirmation does not match" do
    	expect(User.new({username: "user_1", first_name: "Juan",birth_date: '11-09-1988', last_name: 
    						"Perez", password: 'password_1', password_confirmation: 'password_2', email:'my_email@email.com'}).save).to be false
  	end

  	it "saves because password is valid" do
    	expect(User.new({username: "user_1",birth_date: '11-09-1988', first_name: "Juan", last_name: 
    						"Perez", password: 'password_1', password_confirmation: 'password_1', email:'my_email@email.com'}).save).to be true
  	end
	end

	describe "presence validations" do

		it { should validate_presence_of(:email) }
		it { should validate_presence_of(:password) }
		it { should validate_presence_of(:password_confirmation) }

	end

	describe "format validations" do

		it do
			should allow_value('my_email@email.com').
				for(:email).
				on(:create)	
		end

		it { should validate_length_of(:password).is_at_least(3) }

	end


	#describe "relation with role" do
	#	it { should have_many(:roles).through(:user_roles) }
	#end
  
end