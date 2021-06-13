Feature: Create a new task on Todoist
  As a user
  In order to create a new task
  I need to send POST request using Todoist API

  Scenario: Create a simple task with single mandatory content field
    When I create a task named "Simple task"
    Then I should see a 200 status code in response
    And I should see "Simple task" in "content" field

  Scenario: Create a complex task with all fields set
    When I create a task with data:
    """
    {"content": "Complex task",
    "project_id": 2237019745,
    "section_id": 0,
    "parent": 3929864419,
    "order": 100,
    "label_ids": [],
    "priority": 1,
    "due_lang": "en",
    "due_date": "2020-09-27"
    }
    """
    Then I should see a 200 status code in response
    And I should see "Complex task" in "content" field
    And I should see "2237019745" in "project_id" field
    And I should see "3929864419" in "parent" field
    And I should see "100" in "order" field
    And I should see "1" in "priority" field
    And I should see "2020-09-27" in "due_date" field