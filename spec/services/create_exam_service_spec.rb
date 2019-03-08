require 'rails_helper'

RSpec.describe CreateExamService do
  describe '.call' do
    subject { described_class.call(params: params) }

    context 'exam can be created' do
      let(:params) { { name: 'SuperExam' } }
      let!(:exam_questions) { create_list(:exam_question, 5) }

      it 'returns created exam without errors' do
        expect(subject).to be_kind_of(Exam)
      end

      it 'returns exam with questions' do
        expect(subject.questions).to eq exam_questions
      end
    end
  end
end
