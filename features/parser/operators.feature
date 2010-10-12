Feature: operators parsing
    Just let some operators to be tested

    Scenario: check simple operator
        Parse artist: Toto or artist: Ben
        The tokens are:
            | tag | value |
            | artist | Toto |
            | or | - |
            | artist | Ben |

        Parse artist:The rolling and album: Toto or artist: Ben
        The tokens are:
            | tag | value |
            | artist | The rolling |
            | and | - |
            | album | Toto |
            | or | - |
            | artist | Ben |

        Parse title: A       and    artist: b
        The tokens are:
            | tag | value |
            | title | A |
            | and | - |
            | artist | b |

        Parse artist:The rolling and album: Toto or artist: Ben
        The tokens are:
            | tag | value |
            | artist | The rolling |
            | and | - |
            | album | Toto |
            | or | - |
            | artist | Ben |

