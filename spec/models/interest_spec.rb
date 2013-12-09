require 'spec_helper'

describe Interest do
  it { should have_many(:participants).through(:likes) } 
end
