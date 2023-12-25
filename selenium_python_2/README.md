# PYTEST DECORATORS

A decorator is a design pattern that allows you to modify the functionality of a function by wrapping it in another function.

## skip decorator
```python 
    @pytest.mark.skip()
```
A test function that has to be skipped for execution can be marked using the skip decorator

## parameterize decorator
@pytest.mark.parameterize decorator
Parameterized testing, which allows us to use the same test case to run multiple sets of data
enables testers to run multiple input data sets using the same test case. Rather than write separate test cases for each input scenario, 
you only need to create a single test case that accepts different input values, making your testing process more robust and scalable.

## fixture decorator
@pytest.fixture decorator
functions return data, setup etc.
pytest fixtures are functions attached to the tests which run before the test function is executed. 
Fixtures are a set of resources that have to be set up before and cleaned up once the Selenium test automation execution is completed.

Fixtures: Fixtures are functions that will run before each test function to which it is applied. Fixtures are used to feed some data to the tests 
such as database connections, URLs to test, and some sort of input data. Therefore, instead of running the same code for every test, 
we can attach a fixture function to the tests, and it will run and return the data to the test before executing each test.
