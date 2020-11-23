# == Schema Information
#
# Table name: user_items
#
#  id          :bigint           not null, primary key
#  account_id  :bigint           not null
#  master_type :string(255)      not null
#  master_id   :bigint           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_user_items_on_account_id                                (account_id)
#  index_user_items_on_account_id_and_master_type_and_master_id  (account_id,master_type,master_id) UNIQUE
#  index_user_items_on_master_type_and_master_id                 (master_type,master_id)
#
require 'rails_helper'

RSpec.describe User::Item, type: :model do
  describe 'associations' do
    it { should belong_to(:account) }
    it { should belong_to(:master) }
  end
end
