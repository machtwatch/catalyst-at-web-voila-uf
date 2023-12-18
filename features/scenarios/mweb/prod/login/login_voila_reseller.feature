@mweb @regression @login @production
Feature: login voila.id reseller platform via mobile web

  @sanity
  Scenario: [Mweb][Prod] user login to voila.id reseller platform with valid credentials
    Given [Mweb][Prod] user access login page voila reseller platform
    And [Mweb][Prod] user enters username with "VALID_USERNAME" on the login page
    And [Mweb][Prod] user enters password with "VALID_PASSWORD" on the login page
    When [Mweb][Prod] user clicks button Masuk on the login page
    Then [Mweb][Prod] user success login

  Scenario: [Mweb][Prod] user login to voila.id reseller platform with invalid credentials
    Given [Mweb][Prod] user access login page voila reseller platform
    And [Mweb][Prod] user enters username with "INVALID_USERNAME" on the login page
    And [Mweb][Prod] user enters password with "INVALID_PASSWORD" on the login page
    When [Mweb][Prod] user clicks button Masuk on the login page
    Then [Mweb][Prod] user see error message invalid credentials

  Scenario: [Mweb][Prod] user login with empty field username
    Given [Mweb][Prod] user access login page voila reseller platform
    And [Mweb][Prod] user enters username with "" on the login page
    And [Mweb][Prod] user enters password with "VALID_PASSWORD" on the login page
    When [Mweb][Prod] user clicks button Masuk on the login page
    Then [Mweb][Prod] user can see error message "Username harus diisi" on the username field

  Scenario: [Mweb][Prod] user login with empty field password
    Given [Mweb][Prod] user access login page voila reseller platform
    And [Mweb][Prod] user enters username with "VALID_USERNAME" on the login page
    And [Mweb][Prod] user enters password with "" on the login page
    When [Mweb][Prod] user clicks button Masuk on the login page
    Then [Mweb][Prod] user can see error message "Password harus diisi" on the password field

  Scenario: [Mweb][Prod] user login with empty field username and password
    Given [Mweb][Prod] user access login page voila reseller platform
    And [Mweb][Prod] user enters username with "" on the login page
    And [Mweb][Prod] user enters password with "" on the login page
    When [Mweb][Prod] user clicks button Masuk on the login page
    Then [Mweb][Prod] user can see error message "Username harus diisi" on the username field
    And [Mweb][Prod] user can see error message "Password harus diisi" on the password field

  @sanity
  Scenario Outline: [Mweb][Prod] user can chat Admin by cliks button chat via telegram on the login page
    Given [Mweb][Prod] user access login page voila reseller platform
    When [Mweb][Prod] user clicks button chat via telegram on the login page
    And [Mweb][Prod] user success to open pop up Chat via Telegram from login page
    And [Mweb][Prod] user clicks on CTA "<list_admin>" on pop up Chat via Telegram from login page
    Then [Mweb][Prod] user redirected to telegram page "<list_admin>"

    Examples: 
      | list_admin   |
      | Admin Sales  |
      | Admin Gudang |

  Scenario: [Mweb][Prod] user login to voila.id reseller platform with remember me checkbox is checked
    Given [Mweb][Prod] user access login page voila reseller platform
    And [Mweb][Prod] user enters username with "VALID_USERNAME" on the login page
    And [Mweb][Prod] user enters password with "VALID_PASSWORD" on the login page
    And [Mweb][Prod] user "check" checkbox remember me
    When [Mweb][Prod] user clicks button Masuk on the login page
    Then [Mweb][Prod] user success login

  Scenario: [Mweb][Prod] user login to voila.id reseller platform with remember me checkbox is unchecked
    Given [Mweb][Prod] user access login page voila reseller platform
    And [Mweb][Prod] user enters username with "VALID_USERNAME" on the login page
    And [Mweb][Prod] user enters password with "VALID_PASSWORD" on the login page
    And [Mweb][Prod] user "uncheck" checkbox remember me
    When [Mweb][Prod] user clicks button Masuk on the login page
    Then [Mweb][Prod] user success login

  @sanity
  Scenario Outline: [Mweb][Prod] user can see a new tab privacy and return policy page from the login page
    Given [Mweb][Prod] user access login page voila reseller platform
    When [Mweb][Prod] user click button privacy and return policy on the login page
    And [Mweb][Prod] user will redirected to new tab privacy and return policy page
    And [Mweb][Prod] user click tab "<tab>" on new tab privacy and return policy page from the login page
    Then [Mweb][Prod] user will see tab "<tab>" on new tab privacy and return policy page from the login page

    Examples: 
      | tab            |
      | Privacy Policy |
      | Return Policy  |
