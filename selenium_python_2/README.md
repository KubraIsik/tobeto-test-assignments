
In this particular python test automation scrpits, Selenium automated test cases executed for https://www.saucedemo.com/ website with using pytest framework in VSCode IDE.

For user login scenario 5 different test cases and for product list page 3 different test cases created as pytest functions.
Test case functions are decorated with some pytest decorators. 

# PYTEST DECORATORS

![alt text](https://github.com/[KubraIsik]/[tobeto-test-assignments]/blob/[selenium_python_2]/image.jpg?raw=true)

A pytest decorator is a design pattern that is created to customise and improve the behaviour of test functions. 
Decorators can be used for a variety of reasons, but basically they are used to improve code quality by creating reusable, concise, readable test functions.

There are several specialised pre-defined markers that can be used to decorate a test function. In use, a marker can be defined before the original test function name, simply wrapping it. This allows to the test function to use the functionality of the decorator. Multiple decorators can be used for same test functions.

Can be seen in the example below a test function test_empty_username_pass_login decorated with @pytest.mark.skip marker:
```python 
@pytest.mark.skip
def test_empty_username_pass_login(self):
    ...
```

## skip decorator
```python 
    @pytest.mark.skip()
```
A test function that has to be skipped for execution can be marked using the skip decorator

## parameterize decorator
```python 
    @pytest.mark.parameterize
```
Parameterize decorator allow us to parameterize testing cases which means using the same test case to run multiple sets of data
enables testers to run multiple input data sets using the same test case. Rather than write separate test cases for each input scenario, 
only creating a single test case that accepts different input values is enough. In this way testing processes become more robust and scalable.

## fixture decorator
```python 
    @pytest.fixture
```
Different from parameterize and skip decorator, fixture decorator is used to mark a function different from test case function and the function decorated with fixture is passed as arguments into test function. 
Pytest fixtures are functions attached to the tests which run before the test function is executed. Fixtures are used to feed some data to the tests such as database connections, URLs to test, and some sort of input data. Therefore, instead of running the same code for every test, we can attach a fixture function to the tests, and it will run and return the data to the test before executing each test. They can be used to ensure pre-conditions for test cases.
