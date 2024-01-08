@voila @desktop @login.feature
Feature: Sample Feature

  Background:
    Given [Desktop] user desktop user visit voila homepage
    And [Desktop] user click "Sign In" button on sticky navbar

  @sample.login.1
  Scenario: Verify user able to login with a valid username and password
    And [Desktop] user fill email or phone "irsyad@machtwatch.co.id" on login page
    And [Desktop] user fill password "voila-UF5" on login page
    When [Desktop] user click sign in button on login page
    And [Desktop] user see voila loader disappear
    And [Desktop] user will directed to "voila-web.machtwatch.net"
    Then [Desktop] user verify "not see" sign in button on sticky navbar

  @sample.login.2
  Scenario: Test YML
    Given [Desktop] user sign in with email using account "data_1"