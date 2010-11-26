Feature: artists parsing
    Test if a single artist can be parsed
    Participates to pattern parsing

    Scenario: tricky pattern1
        Parse artist: Bob marley and the wa
        The tokens are:
            |   tag |   value   |
            |  artist |   Bob marley and the wa  |
        The python code is u'Bob marley and the wa' in artist
        and the variables are:
        | name | val |

    Scenario: tricky pattern2
        Parse title: ready or not
        The tokens are:
            |   tag |   value   |
            |  title |   ready or not  |
        The python code is u'ready or not' in title
        and the variables are:
        | name | val |
