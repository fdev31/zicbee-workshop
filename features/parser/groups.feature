Feature: test group parsing

Scenario: test tag groupping
    Parse artist: (Pearl Jam or The radiohead)
    The tokens are
        | tag | value |
        | artist | Pearl Jam |
        | or | - |
        | artist | The radiohead |

# weired but tested behavior,
# all () in that special case are removed !

Scenario: test tag groupping
    Parse artist: ((((Pearl Jam or The radiohead))))
    The tokens are
        | tag | value |
        | ( | - |
        | artist | Pearl Jam |
        | or | - |
        | artist | The radiohead |
        | ) | - |

Scenario: test tag groupping
    Parse artist:(a or b or c)and title:free
    The tokens are
        | tag | value |
        | ( | - |
        | artist | a |
        | or | - |
        | artist | b |
        | or | - |
        | artist | c |
        | ) | - |
        | and | - |
        | title | free |


Scenario: test a null group
    Parse (artist: foobar)
    The tokens are
        | tag | value |
        | ( | - |
        | artist | foobar |
        | ) | - |

Scenario: test a standard
    Parse (artist: foobar or artist: pitocha)
    The tokens are
        | tag | value |
        | ( | - |
        | artist | foobar |
        | or | - |
        | artist | pitocha |
        | ) | - |

Scenario: test an obfuscated group
    Parse (artist: foobar or artist: pitocha)and(artist: foo)
    The tokens are
        | tag | value |
        | ( | - |
        | artist | foobar |
        | or | - |
        | artist | pitocha |
        | ) | - |
        | and | - |
        | ( | - |
        | artist | foo |
        | ) | - |

Scenario: test a text group
    Parse                     (  tralala       )         
    The tokens are
        | tag | value |
        | ( | - |
        | tralala | - |
        | ) | - |

