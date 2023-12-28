# Selenium commands:
         
Commands in Selenium IDE, are used to perform different operations on the different UI elements on the web pages. The commands that create test cases are also refered as Selenes commands. Roughly in a test case scenario these operations can be correspond to steps of a test case. 
![selenium_commands](https://github.com/KubraIsik/tobeto-test-assignments/assets/11259498/ba840f22-60d8-494e-bd13-35277676e904)

Selenes commands are classified into 3 categories: Actions, Accessors, and Assertions.

## Actions
To perfom various events like click on link or buttons.

Some of the commands as examples for action commands:
### 'open' command
Opens base url web page that will be test cases executed on it.
### 'set window size' command
Sets the window size of the web page. A window size can be specified.
### 'click' command
Click on a button or link.
### 'type' command
Type in a texbox the given value.

## Accessors
To access and store the variable of the element intended to select.
Some of the commands as examples for accessor commands:

### 'store value' command
Gets and store the value of the element that is located.

### 'store Xpath count' command
Count and store the number of the element that is located in the web page with given Xpath.

## Assertions
To check various conditions that is expected to verify like checking text of the error message that is appear on the webpage.  

Some of the commands as examples for assertion commands:
### 'assert' command
Check if that a variable is an expected value. 
### 'wait for element visible' command
Simply wait for a given time to Selenium find the element that will be located. To protect test to crash 



The command list goes on, full list of the commands and their brief explanations can be found in selenium docs: 
https://www.selenium.dev/selenium-ide/docs/en/api/commands
