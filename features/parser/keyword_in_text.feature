Feature: artists parsing
    Test if a single artist can be parsed
    Participates to pattern parsing

    Scenario: tricky pattern1
        Parse artist: Bob marley and the wa
        The tokens are:
            |   tag |   value   |
            |  artist |   bob marley and the wa  |
        The python code is u'bob marley and the wa' in artist.lower()
        and the variables are:
        | name | val |


    Scenario: tricky pattern2
        Parse title: ready or not
        The tokens are:
            |   tag |   value   |
            |  title |   ready or not  |
        The python code is u'ready or not' in title.lower()
        and the variables are:
        | name | val |

    Scenario: tricky pattern3
        Parse artist: Bob marley and the wa or title: should I stay or should I go now
        The tokens are:
            |   tag |   value   |
            |  artist |   bob marley and the wa  |
            | or |   -  |
            | title |   should i stay or should i go now  |
        The python code is u'bob marley and the wa' in artist.lower() or u'should i stay or should i go now' in title.lower()
        and the variables are:
        | name | val |

    Scenario: ends with keyword
        Parse title: grass band or title: thor
        The tokens are:
            |   tag |   value   |
            |  title |   grass band  |
            | or |   -  |
            | title |  thor |
        The python code is u'grass band' in title.lower() or u'thor' in title.lower()
        and the variables are:
        | name | val |

    Scenario: ends with keyword
        Parse title: thor
        The tokens are:
            |   tag |   value   |
            | title |  thor |
        The python code is u'thor' in title.lower()
        and the variables are:
        | name | val |



    Scenario: starts with keyword
        Parse artist: andrew or title: ortence
        The tokens are:
            |   tag |   value   |
            |  artist |   andrew |
            | or |   -  |
            | title |  ortence |
        The python code is u'andrew' in artist.lower() or u'ortence' in title.lower()
        and the variables are:
        | name | val |

