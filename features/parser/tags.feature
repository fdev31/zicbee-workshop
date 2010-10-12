Feature: artists parsing
    Test if a single artist can be parsed
    Participates to pattern parsing

    Scenario: case sensitive artist lookup
        Parse Artist: Björk
        The tokens are:
            |   tag |   value   |
            |  Artist |   Björk   |
        The python code is u'Bj\xf6rk' in artist

    Scenario: parse various artists
        Parse artist:Björk
        The tokens are:
            |   tag |   value   |
            |  artist |   Björk   |

        Parse artist:  Bjork
        The tokens are:
            |   tag |   value   |
            |   artist  |   Bjork   |
        The python code is u'bjork' in artist.lower()

        Parse   artist:  Björk    
        The tokens are:
            |   tag |   value   |
            |   artist  |   Björk   |

        Parse     artist:   The Rolling Stones   
        The tokens are:
            |   tag |   value   |
            |   artist  |   The Rolling Stones |

    Scenario: parse playlist tag
        Parse artist: toto pls: #
        The tokens are:
            | tag | value |
            | artist | toto |
            | pls | # |
        The python code is u'toto' in artist.lower()
        

    Scenario: parse playlist tag
        Parse  pls: # artist: toto auto: 10
        The tokens are:
            | tag | value |
            | pls | # |
            | artist | toto |
            | auto | 10 |
        The python code is u'toto' in artist.lower()
        

