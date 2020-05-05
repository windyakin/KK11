
require 'rails_helper'

RSpec.describe Account, type: :model do
  describe 'associations' do
    it { should have_many(:items).class_name('User::Item') }
  end

  describe 'validations' do
    it { should validate_presence_of(:username) }

    it { should allow_value('nappleteam').for(:username) }
    it { should allow_value('napple_team').for(:username) }
    it { should_not allow_value('NappleTeam').for(:username) }
    it { should_not allow_value('ナップルチーム').for(:username) }
  end
end
