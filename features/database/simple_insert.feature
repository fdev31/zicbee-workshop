Feature: Test simple insertion in database

 Scenario: simple insertion
   Given I have a fresh database
   When I scan the test songs
   Then I have 8 songs in the database
 
