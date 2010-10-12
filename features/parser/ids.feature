Feature: id keyword

Scenario: a simple id
 Parse id: 10k
 The tokens are:
 | tag | value |
 | id  | 3864 |
 The python code is id == 3864

Scenario: multi-id
 Parse id: 10k or id: jU
 The tokens are:
 | tag | value |
 | id  | 3864 |
 | or  | - |
 | id  | 1234 |
 The python code is id == 3864 or id == 1234
