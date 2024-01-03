@voila @desktop @login.feature
Feature: Login

  Background:
    Given [Desktop] user desktop user visit voila homepage

  @AccountPlatform @Login @AP1 @AP2
    Scenario: [Sign In][Dekstop] user validate sign in page after user click button Sign In on header homepage
    When [Desktop] user click "Sign In" button on sticky navbar
    And [Desktop] user will directed to "/account/login"
    Then [Desktop] user see all component on login page

  @AccountPlatform @Login @AP3
    Scenario: [Sign In][Dekstop] user success to sign in with valid email and password on sign in page
    And [Desktop] user click "Sign In" button on sticky navbar
    And [Desktop] user fill email "voilatesting123@gmail.com" on login page
    And [Desktop] user fill password "Voila99!" on login page
    When [Desktop] user click sign in button on login page
    And [Desktop] user see voila loader disappear
    Then [Desktop] user verify "not see" sign in button on sticky navbar

  @AccountPlatform @Login @AP4
  Scenario: [Sign In][Dekstop] user success to sign in with valid email and password on sign in page
    And [Desktop] user click "Sign In" button on sticky navbar
    And [Desktop] user fill phone number "0899396999" on login page
    And [Desktop] user click sign in button on login page
    And [Desktop] user choose with "Password" on verification method popup
    And [Desktop] user fill password "Voila99!" on verification method popup
    When [Desktop] user click sign in button on verification method popup
    And [Desktop] user see voila loader disappear
    Then [Desktop] user verify "not see" sign in button on sticky navbar