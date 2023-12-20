# Selenium Test Automation Scripts written for Test Cases:

## Test Case 1:
 When _empty user name and password_ are used to login, __expected result:__ "Epic sadface: Username is required" error message should be shown.
## Test Case 2:
 When only _password is empty_ and user attempt to login, __expected result:__ "Epic sadface: Password is required" error message should be shown.
## Test Case 3:
 When _user name "locked_out_user"_ and _password "secret_sauce"_ are used to login, __expected result:__ "Epic sadface: Sorry, this user has been locked out." error message should be shown.
## Test Case 4:
 When _user name "standard_user"_ and _password "secret_sauce"_ are used to login, __expected results:__ user should navigated to "/inventory.html" page 
 and after a succesfull login, number of products will be shown on the page should be "6" in total.

Test cases executed on: https://www.saucedemo.com/ website pages.
