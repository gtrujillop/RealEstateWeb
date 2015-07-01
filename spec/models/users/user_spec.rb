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

    describe "relation with role" do
      it { should have_many(:roles).through(:user_roles) }
    end

    describe 'callbacks' do
      it 'sets is_active value before saving the user' do
        user = User.new({ username: "user_1", first_name: "Juan",
                          last_name: "Perez", birth_date: '11-09-1988',
                          email:'my_email@email.com',
                          password: 'password_1',
                          password_confirmation: 'password_1'})
        user.save
        expect(User.last.active).to be_truthy
      end

      # it 'sets format to users birth date before validation' do
      #   user = User.new({ username: "user_1", first_name: "Juan",
      #                     last_name: "Perez", birth_date: '06/09/2014',
      #                     email:'my_email@email.com',
      #                     password: 'password_1',
      #                     password_confirmation: 'password_1'})
      #   user.save
      #   expect(User.last.birth_date).to be_a(Date)
      # end
    end

    describe "is_admin?" do
      it 'returns true when the user has Administrator role' do
        admin_role = create(:admin)
        user = create(:user, roles: [admin_role])
        expect(user.is_admin?).to be_truthy
      end
      it 'returns false when the user has no Administrator role' do
        role = create(:role)
        user = create(:user, roles: [role])
        expect(user.is_admin?).to be_falsey
      end
    end

  end
