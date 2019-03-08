require 'rails_helper'

RSpec.describe PreparationQuestion, type: :model do
  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_presence_of(:body) }
  it { is_expected.to validate_uniqueness_of(:title) }
  it { is_expected.to validate_uniqueness_of(:body) }
end
