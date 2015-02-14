require 'rails_helper'

describe User do

	describe "password validations" do
		it "fails because no password" do
    	expect(User.new({ username: "user_1", first_name: "Juan", last_name: "Perez" }).save).to be false
  	end

  	it "fails because password is short" do
    	expect(User.new({username: "user_1", first_name: "Juan", last_name: "Perez", password: 'blah'}).save).to be false
  	end

  	it "fails because password confirmation does not match" do
    	expect(User.new({username: "user_1", first_name: "Juan", last_name: 
    						"Perez", password: 'password_1', password_confirmation: 'password_2'}).save).to be false
  	end

  	it "saves because password is valid" do
    	expect(User.new({username: "user_1", first_name: "Juan", last_name: 
    						"Perez", password: 'password_1', password_confirmation: 'password_1'}).save).to be false
  	end
	end

	describe "presence validations" do

		it { should validate_presence_of(:username) }
		it { should validate_presence_of(:first_name) }
		it { should validate_presence_of(:last_name) }
		it { should validate_presence_of(:email) }
		it { should validate_presence_of(:password) }

	end

	describe "format validations" do

		it do
			should allow_value('my_email@email.com').
				for(:email).
				on(:create)	
		end

	end
  
end
