Feature: auto keyword

Scenario: basic usage in the middle
 Parse Artist: =IAM auto: or artist: blah
 The tokens are:
 | tag | value |
 | Artist | =IAM |
 | auto: | - |
 | or | - |
 | artist | blah |
 The python code is artist == u'IAM'  or u'blah' in artist.lower()
 auto is true
# Note the additional space indicating a special keyword was used (bug?)

Scenario: auto disabled
 Parse artist: john
 auto is false


Scenario: at the end
 Parse artist: toto auto:
 The tokens are:
 |tag| value|
 |artist | toto |
 | auto: | - |

Scenario: In the beginning
 Parse auto: artist: toto
 The tokens are:
 |tag| value|
 | auto: | - |
 |artist | toto |

Scenario: basic usage in the middle + implicit op (Unsupported)
 Parse Artist: =IAM auto: artist: blah
 The tokens are:
 | tag | value |
 | Artist | =IAM |
 | auto: | - |
 | and | - |
 | artist | blah |
 The python code is artist == u'IAM'  and u'blah' in artist.lower()
# Note the additional space indicating a special keyword was used (bug?)

