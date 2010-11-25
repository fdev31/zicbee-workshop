Feature: no keyword given
 Just test the behavior for a simple string request 

 Scenario: check a simple input
 Parse hello world 
 The tokens are:
 | tag | value |
 | artist   | hello world |
 | or | - |
 | album | hello world |
 | or | - |
 | title | hello world |
 The python code is u'hello world' in artist.lower() or u'hello world' in album.lower() or u'hello world' in title.lower()

 Scenario: check a simple mixed case input
 Parse HeLLo WORld 
 The tokens are:
 | tag | value |
 | artist   | hello world |
 | or | - |
 | album | hello world |
 | or | - |
 | title | hello world |
 The python code is u'hello world' in artist.lower() or u'hello world' in album.lower() or u'hello world' in title.lower()

 Scenario: check a simple input
 Parse =hello world 
 The tokens are:
 | tag | value |
 | artist   | =hello world |
 | or | - |
 | album | =hello world |
 | or | - |
 | title | =hello world |
 The python code is artist.lower() == v0 or album.lower() == v1 or title.lower() == v2
 and the variables are:
 | name | val |
 | v0 | hello world |
 | v1 | hello world |
 | v2 | hello world |

 Scenario: check keywords in non keyword request
 Parse wax tailor
 The tokens are:
 | tag | value |
 | artist | wax tailor |
 | or | - |
 | album | wax tailor |
 | or | - |
 | title | wax tailor |

