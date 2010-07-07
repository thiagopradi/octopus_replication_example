require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe User do
  it "should works" do
    User.create!(:name => "Thiago")
    User.find_by_name("Thiago").should_not be_nil
  end
  
  it "should be replicated" do
    User.read_inheritable_attribute(:replicated).should be_true
  end
end