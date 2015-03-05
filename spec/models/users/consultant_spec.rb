require 'rails_helper'

describe Consultant do
	describe "password validations" do
		it "fails because no password" do
    	expect(Consultant.new({ username: "user_1",birth_date: '11-09-1988', first_name: "Juan", last_name: "Perez", email:'my_email@email.com'}).save).to be false
  	end

  	it "fails because password is short" do
    	expect(Consultant.new({username: "user_1",birth_date: '11-09-1988', first_name: "Juan", last_name: "Perez", password: 'blah', email:'my_email@email.com'}).save).to be false
  	end

  	it "fails because password confirmation does not match" do
    	expect(Consultant.new({username: "user_1", first_name: "Juan",birth_date: '11-09-1988', last_name: 
    						"Perez", password: 'password_1', password_confirmation: 'password_2', email:'my_email@email.com'}).save).to be false
  	end

  	it "saves because password is valid" do
    	expect(Consultant.new({username: "user_1",birth_date: '11-09-1988', first_name: "Juan", last_name: 
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

	describe "date validations" do
		it 'does not allow save users with invalid dates' do
    	expect(Consultant.new({ username: "user_1", first_name: "Juan", 
    										last_name: "Perez", birth_date: 'blah', 
    										email:'my_email@email.com', 
    										password: 'password_1', 
    										password_confirmation: 'password_1'}).save).to be false
		end

		it 'allows save users with valid dates' do
    	expect(Consultant.new({ username: "user_1", first_name: "Juan", 
    										last_name: "Perez", birth_date: '11-09-1988', 
    										email:'my_email@email.com', 
    										password: 'password_1', 
    										password_confirmation: 'password_1'}).save).to be true
		end
	end

	describe 'after validations' do
		it 'sets active value before saving the user' do
			user = Consultant.new({ username: "user_1", first_name: "Juan", 
    										last_name: "Perez", birth_date: '11-09-1988', 
    										email:'my_email@email.com', 
    										password: 'password_1', 
    										password_confirmation: 'password_1'})
			user.save
			expect(Consultant.last.active).to be_truthy
		end
	end

end