class User < ApplicationRecord
  acts_as_messageable

  def name
    return first_name + ' ' + last_name
  end

  def mailboxer_email(object)
    email
  end

  def self.update_or_create(auth)
    user = User.find_by(uid: auth[:uid]) || User.new
    user.attributes = {
      provider: auth[:provider],
      uid: auth[:uid],
      email: auth[:info][:email],
      first_name: auth[:info][:first_name],
      last_name: auth[:info][:last_name],
      token: auth[:credentials][:token],
      refresh_token: auth[:credentials][:refresh_token],
      oauth_expires_at: auth[:credentials][:expires_at],
      # name: auth[:info][:first_name] + ' ' + auth[:info][:last_name]
    }
    user.save!
    user
  end
end
