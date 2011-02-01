Given /^I instantiate an active record model$/ do
  instantiate
end

Given /^I instantiate an invalid active record model$/ do
  instantiate :valid => false
end

When /^I attach a(?:nother)? file to it$/ do
  attach(attached? ? other_original_file : original_file)
end

When /^I(?: try to)? save it(?: again)?$/ do
  instance.save
end

When /^I destroy it$/ do
  instance.destroy
end

When /^I detach the file from it$/ do
  detach
end

Then /^it should not be saved$/ do
  instance.should_not be_persisted
end

Then /^the(?: second)? file should be stored$/ do
  File.exist?(last_attachment).should be_true
  read_file(last_attachment).should == read_file(last_file)
end

Then /^the file should not(?: still)? be stored$/ do
  last_attachment.should_not be_nil
  File.exist?(last_attachment).should be_false
end

Then /^the first file should not still be stored$/ do
  first_attachment.should_not be_nil
  File.exist?(first_attachment).should be_false
end
