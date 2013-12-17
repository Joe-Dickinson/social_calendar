require 'spec_helper'

describe Event do
  it { should have_many(:members).through(:guests) } 
  it { should have_many(:likes).through(:members)}
  it { should have_many(:interests).through(:likes)}
end
