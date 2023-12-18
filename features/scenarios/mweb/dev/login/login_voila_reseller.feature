@mweb @regression @login 
Feature: login voila.id reseller platform via mobile web

  @sanity 
  Scenario: [Mweb][Dev] user login to voila.id reseller platform with valid credentials
    Given [Mweb][Dev] user access login page voila reseller platform
    And [Mweb][Dev] user enters username with "VALID_USERNAME" on the login page
    And [Mweb][Dev] user enters password with "VALID_PASSWORD" on the login page
    When [Mweb][Dev] user clicks button Masuk on the login page
    Then [Mweb][Dev] user success login
    And [Mweb][Dev] user close pop up banner if exits

  Scenario: [Mweb][Dev] user login to voila.id reseller platform with invalid credentials
    Given [Mweb][Dev] user access login page voila reseller platform
    And [Mweb][Dev] user enters username with "INVALID_USERNAME" on the login page
    And [Mweb][Dev] user enters password with "INVALID_PASSWORD" on the login page
    When [Mweb][Dev] user clicks button Masuk on the login page
    Then [Mweb][Dev] user see error message invalid credentials

  Scenario: [Mweb][Dev] user login with empty field username
    Given [Mweb][Dev] user access login page voila reseller platform
    And [Mweb][Dev] user enters username with "" on the login page
    And [Mweb][Dev] user enters password with "VALID_PASSWORD" on the login page
    When [Mweb][Dev] user clicks button Masuk on the login page
    Then [Mweb][Dev] user can see error message "Username harus diisi" on the username field

  Scenario: [Mweb][Dev] user login with empty field password
    Given [Mweb][Dev] user access login page voila reseller platform
    And [Mweb][Dev] user enters username with "VALID_USERNAME" on the login page
    And [Mweb][Dev] user enters password with "" on the login page
    When [Mweb][Dev] user clicks button Masuk on the login page
    Then [Mweb][Dev] user can see error message "Password harus diisi" on the password field

  Scenario: [Mweb][Dev] user login with empty field username and password
    Given [Mweb][Dev] user access login page voila reseller platform
    And [Mweb][Dev] user enters username with "" on the login page
    And [Mweb][Dev] user enters password with "" on the login page
    When [Mweb][Dev] user clicks button Masuk on the login page
    Then [Mweb][Dev] user can see error message "Username harus diisi" on the username field
    And [Mweb][Dev] user can see error message "Password harus diisi" on the password field

 @sanity
  Scenario Outline: [Mweb][Dev] user can chat Admin by cliks button chat via telegram on the login page
    Given [Mweb][Dev] user access login page voila reseller platform
    When [Mweb][Dev] user clicks button chat via telegram on the login page
    And [Mweb][Dev] user success to open pop up Chat via Telegram from login page
    And [Mweb][Dev] user clicks on CTA "<list_admin>" on pop up Chat via Telegram from login page
    Then [Mweb][Dev] user redirected to telegram page "<list_admin>"
    Examples:
    | list_admin   |
    | Admin Sales  |
    | Admin Gudang |

  Scenario: [Mweb][Dev] user login to voila.id reseller platform with remember me checkbox is checked
    Given [Mweb][Dev] user access login page voila reseller platform
    And [Mweb][Dev] user enters username with "VALID_USERNAME" on the login page
    And [Mweb][Dev] user enters password with "VALID_PASSWORD" on the login page
    And [Mweb][Dev] user "check" checkbox remember me
    When [Mweb][Dev] user clicks button Masuk on the login page
    Then [Mweb][Dev] user success login

  Scenario: [Mweb][Dev] user login to voila.id reseller platform with remember me checkbox is unchecked
    Given [Mweb][Dev] user access login page voila reseller platform
    And [Mweb][Dev] user enters username with "VALID_USERNAME" on the login page
    And [Mweb][Dev] user enters password with "VALID_PASSWORD" on the login page
    And [Mweb][Dev] user "uncheck" checkbox remember me
    When [Mweb][Dev] user clicks button Masuk on the login page
    Then [Mweb][Dev] user success login

  @sanity
  Scenario Outline: [Mweb][Dev] user can see a new tab privacy and return policy page from the login page
    Given [Mweb][Dev] user access login page voila reseller platform
    When [Mweb][Dev] user click button privacy and return policy on the login page
    And [Mweb][Dev] user will redirected to new tab privacy and return policy page
    And [Mweb][Dev] user click tab "<tab>" on new tab privacy and return policy page from the login page
    Then [Mweb][Dev] user will see tab "<tab>" on new tab privacy and return policy page from the login page
    And [Mweb][Dev] user click mingjaya logo on the page
    Then [Mweb][Dev] user will redirected to new tab mingjaya website  
  Examples:
  | tab            |
  | Privacy Policy |
  | Return Policy  |

  Scenario: [Mweb][Dev] user can see a new tab after click mingjaya from login page
    Given [Mweb][Dev] user access login page voila reseller platform
    When [Mweb][Dev] user click mingjaya logo on the page
    Then [Mweb][Dev] user will redirected to new tab mingjaya website