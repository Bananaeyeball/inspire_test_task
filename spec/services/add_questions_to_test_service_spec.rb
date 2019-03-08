require 'rails_helper'

RSpec.describe AddQuestionsToTestService do
  describe '.call' do
    subject { described_class.call(test) }

    context 'exam' do
      context 'returns test with assgned questions' do
        let(:test_type) { 'exam' }
        let!(:test)

        before do
          create_list(:exam_question, 5)
        end

        it 'adds questions to test with shuffler' do
          expect(ShuffleQuestionsService).to receive(:call).with(test_type).and_call_original
          subject
        end

        it "adds 5 questions" do
          expect(subject.questions.count).to eq 5
        end

        it "returns test" do
          expect(subject).to be_kind_of(Exam)
        end
      end

      context 'preparation_test' do
        context 'returns test with assgned questions' do
          let(:test) { build(:preparation_test) }
          let!(:preparation_questions) { create_list(:preparation_question, 5) }
          let(:test_type) { 'preparation' }

          it 'adds questions to test with shuffler' do
            expect(ShuffleQuestionsService).to receive(:call).with(test_type).and_call_original
            subject
          end

          it "returns test with questions" do
            expect(subject.questions.count).to eq 5
          end
        end
      end
    end
  end
end
