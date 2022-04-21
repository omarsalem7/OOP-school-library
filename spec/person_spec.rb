p require_relative '../person'

describe Person do
  before(:each) do
    @person = Person.new(22, 'omar', parent_permission: true)
  end

  it 'check for a perosn object' do
    expect(@person).to be_instance_of(Person)
  end
  it 'check instaces ' do
    expect(@person.age).to eq(22)
    expect(@person.name).to eq('omar')
    expect(@person.parent_permission).to be true
  end

  it 'check if can use services' do
    expect(@person.can_use_services?).to be true
  end

  it 'add more arguments' do
    expect { Person.new('t', 's', 'a') }.to raise_error(ArgumentError)
  end
end
