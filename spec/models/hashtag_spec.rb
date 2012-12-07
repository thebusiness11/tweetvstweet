# == Schema Information
#
# Table name: hashtags
#
#  id                :integer          not null, primary key
#  tweet_id          :integer
#  from_user         :string(255)
#  text              :text
#  profile_image_url :text
#  from_user_name    :string(255)
#  created_at        :date             not null
#  hashtag           :string(255)
#  updated_at        :datetime         not null
#  view_count        :integer
#

require 'spec_helper'

describe Hashtag do
  pending "add some examples to (or delete) #{__FILE__}"
end
