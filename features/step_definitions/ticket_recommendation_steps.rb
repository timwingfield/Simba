Given /^the ticket wizard is initialized$/ do
  @wizard = TicketWizard.new
end

Given /^the park hopper price is set$/ do
  @park_hopper_price = 52
end

Given /^the user has entered (\d+) into the wizard$/ do |no_of_days|
  @wizard.days = no_of_days
end

Given /^they want the park hopper option$/ do
  @wizard.park_hopping = true
end

When /^they ask for recommendations$/ do
  @ticket_list = @wizard.recommend
end

Then /^the recommended tickets should have an adult magic your way ticket$/ do
  @ticket_list.keys.should include("Adult Magic Your Way")
end

Then /^the adult price should be (\d+)$/ do |adult_price|
  @ticket_list["Adult Magic Your Way"].should be(adult_price.to_i)
end

Then /^the recommended tickets should have a child magic your way ticket$/ do
  @ticket_list.keys.should include("Child Magic Your Way")
end

Then /^the child price should be (\d+)$/ do |child_price|
  @ticket_list["Child Magic Your Way"].should be(child_price.to_i)
end

Then /^the adult price should be (\d+) plus the park hopper price$/ do |adult_price|
  total_price = adult_price.to_i + @park_hopper_price
  @ticket_list["Adult Magic Your Way"].should be(total_price)
end

Then /^the child price should be (\d+) plus the park hopper price$/ do |child_price|
  total_price = child_price.to_i + @park_hopper_price
  @ticket_list["Child Magic Your Way"].should be(total_price)
end
