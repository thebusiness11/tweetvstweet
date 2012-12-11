# == Schema Information
#
# Table name: hashlogs
#
#  id         :integer          not null, primary key
#  tag        :string(255)
#  count      :integer
#  latest     :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe Hashlog do
  pending "add some examples to (or delete) #{__FILE__}"
end
