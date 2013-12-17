require 'spec_helper'

describe Interest do
  it { should have_many(:organisers).through(:likes)}
  it { should have_many(:guests).through(:organisers)}
  it { should have_many(:events).through(:guests)}
end
