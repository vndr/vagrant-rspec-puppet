# spec/classes/init_spec.rb

require 'spec_helper'

describe "git::init" do
  it { should create_class('git::package') }
end
