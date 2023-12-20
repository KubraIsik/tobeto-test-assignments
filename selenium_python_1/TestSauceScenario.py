from selenium import webdriver
from selenium.webdriver.common.by import By
from webdriver_manager.chrome import ChromeDriverManager
from time import sleep

class Test_Sauce_Login:

    def __init__(self,user_name_input,password_input) -> None:
        self.user_name_input= user_name_input
        self.password_input=password_input

    # load webpage and maximize the window
    def load_page(self):
        driver = webdriver.Chrome() 
        driver.get("https://saucedemo.com/")
        driver.maximize_window() 
        sleep(5)
        return driver
    
    # find username, password textboxes, enter given user_name and password and click button
    def login_test(self):
        Test_Sauce_class = Test_Sauce_Login(self.user_name_input,self.password_input)
        driver = Test_Sauce_class.load_page()

        usernameInput= driver.find_element(By.ID, "user-name")
        usernameInput.send_keys(self.user_name_input)
        sleep(5)
        passwordInput= driver.find_element(By.ID, "password")
        passwordInput.send_keys(self.password_input)
        sleep(5)

        loginButton = driver.find_element(By.ID, "login-button")
        loginButton.click()
        sleep(5)
        return driver

    # check expected result of the empty username&password login and print test result
    def empty_username_pass_login(self):
        Test_Sauce_class = Test_Sauce_Login(self.user_name_input,self.password_input)
        driver = Test_Sauce_class.login_test()

        errorMessage = driver.find_element(By.XPATH, "//*[@id='login_button_container']/div/form/div[3]/h3" )# "//*[@id='login_button_container']/div/form/div[3]/h3/text()")  
        testResult = errorMessage.text ==   "Epic sadface: Username is required"
        print(f"Boş kullanıcı ve şifre alanı Login Test Sonucu: {testResult}")
        
    # check expected result of the empty password login and print test result
    def empty_pass_login(self):
        Test_Sauce_class = Test_Sauce_Login(self.user_name_input,self.password_input)
        driver = Test_Sauce_class.login_test()

        errorMessage = driver.find_element(By.XPATH, "//*[@id='login_button_container']/div/form/div[3]/h3")
        testResult = errorMessage.text ==   "Epic sadface: Password is required"
        print(f"Boş şifre alanı Login Test Sonucu: {testResult}")
    
    # check expected result of the locked out user login and print test result
    def locked_login(self):
        Test_Sauce_class = Test_Sauce_Login(self.user_name_input,self.password_input)
        driver = Test_Sauce_class.login_test()

        errorMessage = driver.find_element(By.XPATH, "//*[@id='login_button_container']/div/form/div[3]/h3")
        testResult = errorMessage.text ==   "Epic sadface: Sorry, this user has been locked out."
        print(f"Kilitli kullanıcı Login Test Sonucu: {testResult}")
    
    # check expected results of the standard user login and print test result
    def standard_user_login(self):
        Test_Sauce_class = Test_Sauce_Login(self.user_name_input,self.password_input)
        driver = Test_Sauce_class.login_test()

        sleep(5)

        current_page_test_result= driver.current_url == "https://www.saucedemo.com/inventory.html"
        print(f"Yönlendirilen sayfa Test Sonucu: {current_page_test_result}")

        listOfCourses = driver.find_elements(By.CLASS_NAME, "inventory_item")
        testResult = len(listOfCourses) == 6 # control
        print(f"Standard kullancı Login Test Sonucu: {testResult}")


# empty username & empty password login test call
empty_user_pass = Test_Sauce_Login("","")
empty_user_pass.empty_username_pass_login()

# Locked username login test call
locked_class = Test_Sauce_Login("locked_out_user","secret_sauce")
locked_class.locked_login()

# empty password login test call
empty_pass_class = Test_Sauce_Login("user","")
empty_pass_class.empty_pass_login()

# standard user login test call
standard_class = Test_Sauce_Login("standard_user","secret_sauce")
standard_class.standard_user_login()