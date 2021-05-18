# frozen_string_literal: true

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, 
         :registerable,
         :recoverable, 
         :rememberable, 
         :validatable,
         :confirmable, 
         :trackable
  include DeviseTokenAuth::Concerns::User

  has_many :denuncias, dependent: :destroy
  before_create :set_values

  private
  def set_values
    self[:uid] = self[:email] if self[:uid].blank? && self[:email].present?
  end

  public
  def token_validation_response     
    auth_header = self.create_new_auth_token(DeviseTokenAuth::TokenFactory.client)
    self[:access_token] =  auth_header["access-token"]
    self[:client] = auth_header["client"]
    UserSerializer.new(self).as_json
  end

  def create_new_auth_token(client = nil)
    now = Time.zone.now

    token = create_token(
      client: client,
      last_token: tokens.fetch(client, {})['token'],
      updated_at: now
    )

    update_auth_header(token.token, token.client)
  end
end
