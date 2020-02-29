# == Schema Information
#
# Table name: accounts
#
#  id                     :bigint           not null, primary key
#  provider               :string(255)      default("email"), not null
#  uid                    :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  allow_password_change  :boolean          default("0")
#  remember_created_at    :datetime
#  confirmation_token     :string(255)
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string(255)
#  name                   :string(255)
#  nickname               :string(255)
#  image                  :string(255)
#  email                  :string(255)
#  tokens                 :text(65535)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_accounts_on_confirmation_token    (confirmation_token) UNIQUE
#  index_accounts_on_email                 (email) UNIQUE
#  index_accounts_on_reset_password_token  (reset_password_token) UNIQUE
#  index_accounts_on_uid_and_provider      (uid,provider) UNIQUE
#
class Account < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
  include DeviseTokenAuth::Concerns::User
end
