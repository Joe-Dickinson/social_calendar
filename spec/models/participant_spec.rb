require 'spec_helper'

describe Participant do
  it { should have_many(:events).through(:attendees) } 
  it { should have_many(:interests).through(:likes)}
end
