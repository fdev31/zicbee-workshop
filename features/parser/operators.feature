Feature: operators parsing
    Just let some operators to be tested

    Scenario: check simple operator
        Parse Artist: Toto or artist: Ben
        The tokens are:
            | tag | value |
            | Artist | Toto |
            | or | - |
            | artist | ben |

        Parse artist:The rolling and album: Toto or artist: Ben
        The tokens are:
            | tag | value |
            | artist | the rolling |
            | and | - |
            | album | toto |
            | or | - |
            | artist | ben |

        Parse title: A       and    artist: b
        The tokens are:
            | tag | value |
            | title | a |
            | and | - |
            | artist | b |

        Parse artist:The rolling and album: Toto or artist: Ben
        The tokens are:
            | tag | value |
            | artist | the rolling |
            | and | - |
            | album | toto |
            | or | - |
            | artist | ben |

