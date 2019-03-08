require 'rails_helper'

RSpec.describe CreateExamService do
  describe '.call' do
    subject { described_class.call(params) }

    context 'exam can be created' do
      let(:params) { title: 'SuperExam' }

      it 'returns created exam without errors' do

      end
    end
  end
end
