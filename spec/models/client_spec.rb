require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Client do
  it "should works" do
    Client.create!(:name => "Thiago")
    Client.find_by_name("Thiago").should_not be_nil
  end
  
  it "should be replicated" do
    Client.read_inheritable_attribute(:replicated).should be_nil
  end
end