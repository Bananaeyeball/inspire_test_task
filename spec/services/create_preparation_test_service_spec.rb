require 'rails_helper'

RSpec.describe CreatePreparationTestService do
  describe '.call' do
    subject { described_class.call(params: params) }

    context 'exam can be created' do
      let(:params) { { name: 'SuperPrepTest' } }
      let!(:questions) { create_list(:preparation_question, 5) }
      let(:question_titles) { questions.pluck(:title).sort }

      it 'returns created exam without errors' do
        expect(subject).to be_kind_of(PreparationTest)
      end

      it 'returns exam with questions' do
        expect(subject.questions.count).to eq 5
        expect(subject.questions.pluck(:title).sort).to eq question_titles
      end
    end
  end
end
