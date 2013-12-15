require 'spec_helper'

describe Like do
  it { should belong_to(:organiser)}
  it { should belong_to(:interest)}
end
