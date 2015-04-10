class User < ActiveRecord::Base
  include Harvestable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:google_oauth2]

  def to_s
    name
  end

  def name
    "#{first_name} #{last_name}"
  end

private 


  def self.find_or_create_by_google(data)
    user = User.where(:email => data.email).first
    user = User.create(first_name: data.name.split(" ").first,
                       last_name: data.name.split(" ").last,
                       email: data.email,
                       password: Devise.friendly_token[0,20]) unless user
    user
  end


end
