require 'rails_helper'

RSpec.describe PreparationTest, type: :model do
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_uniqueness_of(:name) }

  context 'before_destroy' do
    let!(:preparation_test) { create(:preparation_test_with_questions) }

    it 'calls decrease_counter_on_questions_and_clear' do
      expect(preparation_test).to receive(:decrease_counter_on_questions_and_clear)
      preparation_test.destroy
    end
  end
end
