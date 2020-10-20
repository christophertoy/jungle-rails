require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do 
  
  it 'should create a new user with all fields completed' do
    @user = User.new(
    first_name: "Alice", 
    last_name:"Test", 
    email: "test@test.com",
    password:"password",
    password_confirmation:"password"
    )
    @user.save
    @user.valid?
    expect(@user.errors.full_messages).to be_empty
  end

  it 'should receive an error message if first name is not present' do
    @user = User.new(
      first_name: nil, 
      last_name:"Test", 
      email: "test@test.com",
      password:"password",
      password_confirmation:"password"
      )
    @user.save
    @user.valid?
    expect(@user.errors.full_messages).to include("First name can't be blank")
  end

  it 'should receive an error message if last name is not present' do
    @user = User.new(
      first_name: "Alice", 
      last_name: nil, 
      email: "test@test.com",
      password:"password",
      password_confirmation:"password"
      )
    @user.save
    @user.valid?
    expect(@user.errors.full_messages).to include("Last name can't be blank")
  end

  it 'should receive an error message if email is not present' do
    @user = User.new(
      first_name: "Alice", 
      last_name: "Test", 
      email: nil,
      password:"password",
      password_confirmation:"password"
      )
    @user.save
    @user.valid?
    expect(@user.errors.full_messages).to include("Email can't be blank")
  end

  it 'user should be invalid if email is already in use' do
    @user = User.new(
      first_name: "Alice", 
      last_name: "Test", 
      email: "test@test.com",
      password:"password",
      password_confirmation:"password"
      )
    @user.save  

    @user_two = User.new(
      first_name: "Alice", 
      last_name: "Test", 
      email: "TEST@test.com",
      password:"password",
      password_confirmation:"password"
      )
    
    @user_two.save
    expect(@user_two).not_to be_valid
  end

  it 'should receive an error message if password is not present' do
    @user = User.new(
      first_name: "Alice", 
      last_name: "Test", 
      email: "test@test.com",
      password: nil,
      password_confirmation:"password"
      )
    @user.save
    @user.valid?
    expect(@user.errors.full_messages).to include("Password can't be blank")
  end

  it 'should receive an error message if email is not present' do
    @user = User.new(
      first_name: "Alice", 
      last_name: "Test", 
      email: "test@test.com",
      password:"password",
      password_confirmation: nil
      )
    @user.save
    @user.valid?
    expect(@user.errors.full_messages).to include("Password confirmation can't be blank")
  end
  it 'should be invalid user if the passwords are not the same' do
    @user = User.new(
      first_name: "Alice", 
      last_name: "Test", 
      email: "test@test.com",
      password:"password",
      password_confirmation:"12345"
      )
    @user.save
    @user.valid?
    expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
  end

  it 'should receive an error message if password is not atleaast 5 characters' do
    @user = User.new(
      first_name: "Alice", 
      last_name: "Test", 
      email: "test@test.com",
      password:"pass",
      password_confirmation:"pass"
      )
    @user.save
    @user.valid?
    expect(@user.errors.full_messages).to include("Password is too short (minimum is 5 characters)")
  end 
end

  describe '.authenticate_with_credentials' do
  # examples for this class method here
  it 'should return a user if authenticated successfully' do
    @user = User.new(
      first_name: "Alice", 
      last_name: "Test", 
      email: "test@test.com",
      password:"password",
      password_confirmation:"password"
      )
    @user.save 
    @authenticated_user = User.authenticate_with_credentials("test@test.com", "password")
    expect(@user).to eq(@authenticated_user)

  end

  it 'should return a nil if authentication is unsuccessful' do
    @user = User.new(
      first_name: "Alice", 
      last_name: "Test", 
      email: "test@test.com",
      password:"password",
      password_confirmation:"password"
      )
    @user.save 
    @authenticated_user = User.authenticate_with_credentials("tes@test.com", "password")
    expect(@authenticated_user).to eq(nil)

  end

  it 'should authenticate successfully if there are spaces in email' do
    @user = User.new(
      first_name: "Alice", 
      last_name: "Test", 
      email: "test@test.com",
      password:"password",
      password_confirmation:"password"
      )
    @user.save 
    @authenticated_user = User.authenticate_with_credentials("  test@test.com", "password")
    expect(@user).to eq(@authenticated_user)

  end

  it 'email should be case insensitive when loggin in and should authenticate successfully ' do
    @user = User.new(
      first_name: "Alice", 
      last_name: "Test", 
      email: "test@test.com",
      password:"password",
      password_confirmation:"password"
      )
    @user.save 
    @authenticated_user = User.authenticate_with_credentials("TesT@Test.COM", "password")
    expect(@user).to eq(@authenticated_user)

  end

  end


end
