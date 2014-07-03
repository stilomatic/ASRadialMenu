Given /^I am on the Welcome Screen$/ do
  element_exists("view")
  check_element_exists("button")
  sleep(STEP_PAUSE)
end