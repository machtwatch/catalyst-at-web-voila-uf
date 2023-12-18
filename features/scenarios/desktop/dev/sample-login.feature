@voila @desktop @login.feature
Feature: Sample Feature

  Background:
    Given [Desktop] user desktop user visit voila homepage
    And [Desktop] user click "Sign In" button on sticky navbar

  @sample.login
  Scenario: Verify user able to login with a valid username and password
    And [Desktop] user fill email "irsyad@machtwatch.co.id" on login page
    And [Desktop] user fill password "voila-UF5" on login page
    And [Desktop] user click sign in button on login page
    And [Desktop] user see voila loader disappear
    And [Desktop] user will directed to "voila-web.machtwatch.net"
    Then [Desktop] user verify "not see" sign in button on sticky navbar

