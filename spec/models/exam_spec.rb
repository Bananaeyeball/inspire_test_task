require 'rails_helper'

RSpec.describe Exam, type: :model do
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_uniqueness_of(:name) }

  context 'validate question presnce' do
    let(:exam) { build(:exam) }

    it 'validates the quantity of questions available' do
      expect(exam.valid?).to be false
      expect(exam.errors.full_messages).to eq ['There are not enough questions for the exam. Please create 5 more']
    end
  end
end
