Feature: auto keyword

Scenario: basic usage in the middle
 Parse Artist: =IAM auto: or artist: blah
 The tokens are:
 | tag | value |
 | Artist | =IAM |
 | auto | - |
 | or | - |
 | artist | blah |
 The python code is artist == v0  or u'blah' in artist.lower()
 The variables are:
 | name | val |
 | v0   | IAM |

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
 | auto | - |

Scenario: In the beginning
 Parse auto: artist: toto
 The tokens are:
 |tag| value|
 | auto | - |
 |artist | toto |

Scenario: basic usage in the middle + implicit op (Unsupported)
 Parse Artist: =IAM auto: artist: blah
 The tokens are:
 | tag | value |
 | Artist | =IAM |
 | auto | - |
 | and | - |
 | artist | blah |
 The python code is artist == v0  and u'blah' in artist.lower()
 The variables are:
 | name | val |
 | v0   | IAM |
# Note the additional space indicating a special keyword was used (bug?)


Scenario: more realistic example
 Parse Artist: =IAM or artist: blah auto:
 The tokens are:
 | tag | value |
 | Artist | =IAM | 
 | or | - |
 | artist | blah |
 | auto | - |
 
 The python code is artist == v0 or u'blah' in artist.lower()
 The variables are:
 | name | val |
 | v0   | IAM |


Scenario: more realistic example with value passing
 Parse Artist: =IAM or artist: blah auto: 15
 The tokens are:
 | tag | value |
 | Artist | =IAM | 
 | or | - |
 | artist | blah |
 | auto | 15 |
 
 The python code is artist == v0 or u'blah' in artist.lower()
 The variables are:
 | name | val |
 | v0   | IAM |

