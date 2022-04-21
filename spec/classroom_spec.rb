require_relative '../classroom'

describe Classroom do
  before(:each) do
    @class = Classroom.new('label')
  end

  it 'check for a classroom object' do
    expect(@class).to be_instance_of(Classroom)
  end
  it 'check instaces ' do
    expect(@class.label).to eq('label')
    expect(@class.students).to eq([])
  end

  it 'add more arguments' do
    expect { Classroom.new('t', 's', 'a') }.to raise_error(ArgumentError)
  end
end
