require 'spec_helper'

describe Organiser do
  it { should have_many(:events) }
  it { should have_many(:happenings).through(:guests) }
  it { should have_many(:interests).through(:likes)}
  it { should have_many(:recommendations)}
end
