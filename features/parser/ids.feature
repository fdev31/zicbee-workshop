Feature: id keyword

Scenario: a simple id
 Parse id: 10k
 The tokens are:
 | tag | value |
 | id  | 10k |
 The python code is __id__ == v0
 and the variables are:
 | name | val |
 | v0  | 3864 |

Scenario: multi-id
 Parse id: 10k or id: jU
 The tokens are:
 | tag | value |
 | id  | 10k |
 | or  | - |
 | id  | jU |
 The python code is __id__ == v0 or __id__ == v1
 and the variables are:
 | name | val |
 | v0   | 3864 |
 | v1 | 1234 |
