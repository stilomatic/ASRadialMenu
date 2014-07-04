Feature: Running a test
  As an iOS developer
  I want to have a sample feature file
  So I can begin testing quickly

Scenario: Menu Test
  Given I am on the Welcome Screen
  Then I press "openMenu"
  And I wait until I don't see "Menu is Open"
  Then I press "closeMenu"
  And I wait until I don't see "Menu is Closed"
  And take picture


