# == Schema Information
#
# Table name: master_circles
#
#  id          :bigint           not null, primary key
#  name        :string(255)      not null
#  name_kana   :string(255)      not null
#  description :text(65535)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_master_circles_on_name  (name)
#

require 'rails_helper'

RSpec.describe Master::Circle, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:name_kana) }

    it { should allow_value('Napple Team').for(:name_kana) }
    it { should_not allow_value('ナップルチーム').for(:name_kana) }
  end
end
