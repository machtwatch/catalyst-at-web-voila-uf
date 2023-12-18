@desktop @regression @login @production
Feature: login voila.id reseller platform via desktop web

  @sanity
  Scenario: [Desktop][Prod] user login to voila.id reseller platform with valid credentials
    Given [Desktop][Prod] user access login page voila reseller platform
    And [Desktop][Prod] user enters username with "VALID_USERNAME" on the login page
    And [Desktop][Prod] user enters password with "VALID_PASSWORD" on the login page
    When [Desktop][Prod] user clicks button Masuk on the login page
    Then [Desktop][Prod] user success login

  Scenario: [Desktop][Prod] user login to voila.id reseller platform with invalid credentials
    Given [Desktop][Prod] user access login page voila reseller platform
    And [Desktop][Prod] user enters username with "INVALID_USERNAME" on the login page
    And [Desktop][Prod] user enters password with "INVALID_PASSWORD" on the login page
    When [Desktop][Prod] user clicks button Masuk on the login page
    Then [Desktop][Prod] user see error message invalid credentials

  Scenario: [Desktop][Prod] user login with empty field username
    Given [Desktop][Prod] user access login page voila reseller platform
    And [Desktop][Prod] user enters username with "" on the login page
    And [Desktop][Prod] user enters password with "VALID_PASSWORD" on the login page
    When [Desktop][Prod] user clicks button Masuk on the login page
    Then [Desktop][Prod] user can see error message "Username harus diisi" on the username field

  Scenario: [Desktop][Prod] user login with empty field password
    Given [Desktop][Prod] user access login page voila reseller platform
    And [Desktop][Prod] user enters username with "VALID_USERNAME" on the login page
    And [Desktop][Prod] user enters password with "" on the login page
    When [Desktop][Prod] user clicks button Masuk on the login page
    Then [Desktop][Prod] user can see error message "Password harus diisi" on the password field

  Scenario: [Desktop][Prod] user login with empty field username and password
    Given [Desktop][Prod] user access login page voila reseller platform
    And [Desktop][Prod] user enters username with "" on the login page
    And [Desktop][Prod] user enters password with "" on the login page
    When [Desktop][Prod] user clicks button Masuk on the login page
    Then [Desktop][Prod] user can see error message "Username harus diisi" on the username field
    And [Desktop][Prod] user can see error message "Password harus diisi" on the password field

  @sanity
  Scenario Outline: [Desktop][Prod] user can chat Admin by cliks button chat via telegram on the login page
    Given [Desktop][Prod] user access login page voila reseller platform
    When [Desktop][Prod] user clicks button chat via telegram on the login page
    And [Desktop][Prod] user success to open pop up Chat via Telegram from login page
    And [Desktop][Prod] user clicks on CTA "<list_admin>" on pop up Chat via Telegram from login page
    Then [Desktop][Prod] user redirected to telegram page "<list_admin>"

    Examples: 
      | list_admin   |
      | Admin Sales  |
      | Admin Gudang |

  Scenario: [Desktop][Prod] user login to voila.id reseller platform with remember me checkbox is checked
    Given [Desktop][Prod] user access login page voila reseller platform
    And [Desktop][Prod] user enters username with "VALID_USERNAME" on the login page
    And [Desktop][Prod] user enters password with "VALID_PASSWORD" on the login page
    And [Desktop][Prod] user "check" checkbox remember me
    When [Desktop][Prod] user clicks button Masuk on the login page
    Then [Desktop][Prod] user success login

  Scenario: [Desktop][Prod] user login to voila.id reseller platform with remember me checkbox is unchecked
    Given [Desktop][Prod] user access login page voila reseller platform
    And [Desktop][Prod] user enters username with "VALID_USERNAME" on the login page
    And [Desktop][Prod] user enters password with "VALID_PASSWORD" on the login page
    And [Desktop][Prod] user "uncheck" checkbox remember me
    When [Desktop][Prod] user clicks button Masuk on the login page
    Then [Desktop][Prod] user success login

  @sanity
  Scenario Outline: [Desktop][Prod] user can see a new tab privacy and return policy page from the login page
    Given [Desktop][Prod] user access login page voila reseller platform
    When [Desktop][Prod] user click button privacy and return policy on the login page
    And [Desktop][Prod] user will redirected to new tab privacy and return policy page
    And [Desktop][Prod] user click tab "<tab>" on new tab privacy and return policy page from the login page
    Then [Desktop][Prod] user will see tab "<tab>" on new tab privacy and return policy page from the login page

    Examples: 
      | tab            |
      | Privacy Policy |
      | Return Policy  |
