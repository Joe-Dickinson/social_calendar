require 'spec_helper'

describe Event do
  it{ should have_many(:participants).through(:attendees) } 
end
