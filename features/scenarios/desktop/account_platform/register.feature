@voila @desktop @register.feature
Feature: Register

  Background:
    Given [Desktop] user desktop user visit voila homepage

  @AccountPlatform @Register @AP6 @AP7
  Scenario: [Register][Dekstop] user validate register page after user click button Register on header homepage
    When [Desktop] user click "Register" button on sticky navbar
    And [Desktop] user will directed to "/account/register"
    Then [Desktop] user see all component on register page