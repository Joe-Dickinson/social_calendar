require 'spec_helper'

describe Interest do
  it { should have_many(:organisers).through(:likes)}
end
