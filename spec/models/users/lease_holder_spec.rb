require 'rails_helper'

describe LeaseHolder do
	describe "password validations" do
		it "fails because no password" do
    	expect(LeaseHolder.new({ username: "user_1",birth_date: '11-09-1988', first_name: "Juan", last_name: "Perez", email:'my_email@email.com', is_active: true }).save).to be false
  	end

  	it "fails because password is short" do
    	expect(LeaseHolder.new({username: "user_1",birth_date: '11-09-1988', first_name: "Juan", last_name: "Perez", password: 'blah', email:'my_email@email.com', is_active: true}).save).to be false
  	end

  	it "fails because password confirmation does not match" do
    	expect(LeaseHolder.new({username: "user_1", first_name: "Juan",birth_date: '11-09-1988', last_name: 
    						"Perez", password: 'password_1', password_confirmation: 'password_2', email:'my_email@email.com', is_active: true}).save).to be false
  	end

  	it "saves because password is valid" do
    	expect(LeaseHolder.new({username: "user_1",birth_date: '11-09-1988', first_name: "Juan", last_name: 
    						"Perez", password: 'password_1', password_confirmation: 'password_1', email:'my_email@email.com', is_active: true}).save).to be true
  	end
	end

	describe "presence validations" do

		it { should validate_presence_of(:username) }
		it { should validate_presence_of(:first_name) }
		it { should validate_presence_of(:last_name) }
		it { should validate_presence_of(:email) }
		it { should validate_presence_of(:password) }
  	it { should validate_presence_of(:is_active).on(:create) }


	end

	describe "format validations" do

		it do
			should allow_value('my_email@email.com').
				for(:email).
				on(:create)	
		end

		it { should validate_length_of(:username).is_at_most(8) }


	end

	describe "date validations" do
		it 'does not allow save users with invalid dates' do
    	expect(LeaseHolder.new({ username: "user_1", first_name: "Juan", 
    										last_name: "Perez", birth_date: 'blah', 
    										email:'my_email@email.com', 
    										password: 'password_1', 
    										password_confirmation: 'password_1', is_active: true}).save).to be false
		end

		it 'allows save users with valid dates' do
    	expect(LeaseHolder.new({ username: "user_1", first_name: "Juan", 
    										last_name: "Perez", birth_date: '11-09-1988', 
    										email:'my_email@email.com', 
    										password: 'password_1', 
    										password_confirmation: 'password_1', is_active: true}).save).to be true
		end
	end

	describe "relation with property model" do
		it { should have_many(:properties) }
	end

end