require 'student'
require 'test'
require 'feedback'

describe Student do
  subject(:student) { Student.new }
  let(:feedback_1) { double :feedback, :happiness => 4 }
  let(:feedback_2) { double :feedback, :happiness => 4 }
  # let(:answer) { double :answer, :correct? => true }
  let(:test_1) { double :test, :score => 1, :pretty_date_taken => Date.today.to_s, :correct? => true }
  let(:test_2) { double :test, :score => 1, :pretty_date_taken => Date.today.to_s, :correct? => true }

  describe '#full_name' do
    it 'returns the student first name and last name' do
      student = Student.new(first_name: "Sian", last_name: "McAvoy")

      expect(student.full_name).to eq "Sian McAvoy"
    end

    it 'defaults to "Joe Bloggs"' do
      expect(student.full_name).to eq "Joe Bloggs"
    end
  end

  describe '#happiness' do
    it 'returns the average happiness reported' do
#      feedback_1 = Feedback.new(4, Date.today)
#      feedback_2 = Feedback.new(4, Date.today)
      student = Student.new(feedbacks: [feedback_1, feedback_2])

      expect(student.happiness).to eq 4
    end

    it 'defaults to zero' do
      expect(student.happiness).to eq 0
    end
  end

  describe '#test_scores' do
    it 'returns all test scores' do
      # test_1 = Test.new(Date.today, [answer])
      # test_2 = Test.new(Date.today, [answer])
      student = Student.new(tests: [test_1, test_2])

      expect(student.test_scores).to eq({ "#{ Date.today.to_s }" => [1, 1] })
    end

    it 'defaults to being empty' do
      expect(student.test_scores).to be_empty
    end
  end

  describe '#attendance' do
    it 'describes the student attendance' do
    end
  end
end
