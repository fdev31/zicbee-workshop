Feature: implicit operators
    Allow some to not always write the default (and) operator

    Scenario: double artist
        Parse artist: toto artist: tata
        The tokens are:
            | tag | value |
            | artist | toto |
            | and | - |
            | artist | tata |

    Scenario: tripple artist
        Parse artist: toto artist: tata artist: titi
        The tokens are:
            | tag | value |
            | artist | toto |
            | and | - |
            | artist | tata |
            | and | - |
            | artist | titi |

# Some comments looks allowed
    Scenario: mixing complex
        Parse artist: toto and artist: tata artist: titi or artist: A artist: B artist: C and artist: D
        The tokens are:
            | tag | value |
            | artist | toto |
            | and | - |
            | artist | tata |
            | and | - |
            | artist | titi |
            | or | - |
            | artist | A |
            | and | - |
            | artist | B |
            | and | - |
            | artist | C |
            | and | - |
            | artist | D |

