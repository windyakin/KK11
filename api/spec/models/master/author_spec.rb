# == Schema Information
#
# Table name: master_authors
#
#  id          :bigint           not null, primary key
#  name        :string(255)      not null
#  name_kana   :string(255)      not null
#  description :text(65535)
#  twitter_id  :string(255)
#  pixiv_id    :string(255)
#  website_url :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_master_authors_on_name        (name)
#  index_master_authors_on_pixiv_id    (pixiv_id)
#  index_master_authors_on_twitter_id  (twitter_id)
#

require 'rails_helper'

RSpec.describe Master::Author, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:name_kana) }

    it { should allow_value('Napple Team').for(:name_kana) }
    it { should_not allow_value('ナップルチーム').for(:name_kana) }

    it { should allow_value('MITLicense').for(:twitter_id) }
    it { should_not allow_value('Napple-Team').for(:twitter_id) }
    it { should allow_value('168635').for(:pixiv_id) }
    it { should_not allow_value('windyakin').for(:pixiv_id) }
    it { should allow_value('https://napple.team').for(:website_url) }
    it { should_not allow_value('ssh://napple.team').for(:website_url) }
  end
end
