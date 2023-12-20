Selenium Test Automation Scripts written for Test Cases:

Test Case 1:
 When empty user name and password are used to login, expected result: "Epic sadface: Username is required" error message should be shown.
 Test Case 2:
 When only password is empty and user attempt to login, expected result: "Epic sadface: Password is required" error message should be shown.
 Test Case 3:
 When user name "locked_out_user" and password "secret_sauce" are used to login, expected result: "Epic sadface: Sorry, this user has been locked out." error message should be shown.
 Test Case 4:
 When user name  "standard_user" and password "secret_sauce" are used to login, expected results: user should navigated to "/inventory.html" page 
 and after a succesfull login, number of products will be shown on the page should be "6" in total.

Test cases executed on: https://www.saucedemo.com/ website pages.
