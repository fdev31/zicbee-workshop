Feature: artists parsing
    Test if a single artist can be parsed
    Participates to pattern parsing

    Scenario: case sensitive artist lookup
        Parse Artist: Björk
        The tokens are:
            |   tag |   value   |
            |  Artist |   Björk   |
        The python code is v0 in artist
        and the variables are:
        | name | val |
        | v0   |Björk |

    Scenario: parse various artists
        Parse artist:Björk
        The tokens are:
            |   tag |   value   |
            |  artist |   björk   |

        Parse artist:  Bjork
        The tokens are:
            |   tag |   value   |
            |   artist  |   bjork   |
        The python code is v0 in artist.lower()
        and the variables are:
        | name | val |
        | v0  | bjork |

        Parse   artist:  Björk
        The tokens are:
            |   tag |   value   |
            |   artist  |   björk   |

        Parse     artist:   The Rolling Stones
        The tokens are:
            |   tag |   value   |
            |   artist  |   the rolling stones |

    Scenario: parse playlist tag
        Parse artist: toto pls: #
        The tokens are:
            | tag | value |
            | artist | toto |
            | pls | # |
        The python code is v0 in artist.lower()
        and the variables are:
        | name | val |
        | v0 | toto |


    Scenario: parse playlist tag
        Parse  pls: # artist: toto auto: 10
        The tokens are:
            | tag | value |
            | pls | # |
            | artist | toto |
            | auto | 10 |
        The python code is v0 in artist.lower()
        and the variables are:
        | name | val |
        | v0 | toto |


