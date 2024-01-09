@voila @desktop @account.platform @login.feature
Feature: Login

  Background:
    Given [Desktop] user desktop user visit voila homepage

  @login @AP1 @AP2
    Scenario: [Sign In][Dekstop] user validate sign in page after user click button Sign In on header homepage
    When [Desktop] user click "Sign In" button on sticky navbar
    And [Desktop] user will directed to "/account/login"
    Then [Desktop] user see all component on login page

  @account.platform @login @AP3
    Scenario: [Sign In][Dekstop] user success to sign in with valid email and password on sign in page
    And [Desktop] user click "Sign In" button on sticky navbar
    And [Desktop] user fill email or phone "voilatesting123@gmail.com" on login page
    And [Desktop] user fill password "Voila99!" on login page
    When [Desktop] user click sign in button on login page
    And [Desktop] user see voila loader disappear
    Then [Desktop] user verify "not see" sign in button on sticky navbar

  @account.platform @login @AP4
  Scenario: [Sign In][Dekstop] user success to sign in with valid email and password on sign in page
    And [Desktop] user click "Sign In" button on sticky navbar
    And [Desktop] user fill email or phone "0899396999" on login page
    And [Desktop] user click sign in button on login page
    And [Desktop] user choose with "Password" on verification method popup
    And [Desktop] user fill password "Voila99!" on verification method popup
    When [Desktop] user click sign in button on verification method popup
    And [Desktop] user see voila loader disappear
    Then [Desktop] user verify "not see" sign in button on sticky navbar