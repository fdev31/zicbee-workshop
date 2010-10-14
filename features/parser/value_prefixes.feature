Feature: test python code generation

Scenario: test simple equalities
    Parse artist: =Toto and album: (old or may)
    The python code is artist.lower() == v0 and ( u'old' in album.lower() or u'may' in album.lower() )
    and the variables are:
    | name | val |
    | v0 | toto |

Scenario: test more complex equalities
    Parse artist: =Toto and album: (old or may)
    The python code is artist.lower() == v0 and ( u'old' in album.lower() or u'may' in album.lower() )
    and the variables are:
    | name | val |
    | v0 | toto |

Scenario: test more complex equalities
    Parse (artist: =Toto or album: winter) and album: (old or may)
    The python code is ( artist.lower() == v0 or u'winter' in album.lower() ) and ( u'old' in album.lower() or u'may' in album.lower() )
    and the variables are:
    | name | val |
    | v0 | toto |

Scenario: test more complex equalities
    Parse (artist: =Toto and ! album: winter) and album: (old or may)
    The python code is ( artist.lower() == v0 and not u'winter' in album.lower() ) and ( u'old' in album.lower() or u'may' in album.lower() )
    and the variables are:
    | name | val |
    | v0 | toto |

Scenario: test not keyword "!"
    Parse ! artist: dave
    The python code is not u'dave' in artist.lower()
    and the variables are:
    | name | val |

    Parse ! Artist: dave
    The python code is not u'dave' in artist
    and the variables are:
    | name | val |

    Parse !artist: =dave
    The python code is not artist.lower() == v0 
    and the variables are:
    | name | val |
    | v0 | dave |

    Parse (!artist:=dave  album:sky)or(Album:Moon)
    The python code is ( not artist.lower() == v0 and u'sky' in album.lower() ) or ( u'Moon' in album )
    and the variables are:
    | name | val |
    | v0 | dave |

    Parse length: 60
    The python code is v0 <= length <= v1
    and the variables are:
    | name | val |
    | v0 | 59 |
    | v1 | 61 |

    Parse length: =60
    The python code is length == v0
    and the variables are:
    | name | val |
    | v0 | 60 |

    Parse not length: 60
    The python code is not v0 <= length <= v1
    and the variables are:
    | name | val |
    | v0 | 59 |
    | v1 | 61 |

    Parse not length: <6
    The python code is not length < v0
    and the variables are:
    | name | val |
    | v0 | 6 |

    Parse artist: =A and score: >4
    The python code is artist.lower() == v0 and score > v1
    and the variables are:
    | name | val |
    | v0 | a |
    | v1 | 4 |

    Parse Artist: =A and score: >4
    The python code is artist == v0 and score > v1
    and the variables are:
    | name | val |
    | v0 | A |
    | v1 | 4 |

Scenario: test implicit "or" between ()
    Parse (!artist:=dave  album:sky)(Album:Moon)
    The python code is ( not artist.lower() == v0 and u'sky' in album.lower() ) or ( u'Moon' in album )
    and the variables are:
    | name | val |
    | v0 | dave |

Scenario: group and equality prefix
  Parse Artist: (=Noir désir or =Björk)
  The python code is ( artist == v0 or artist == v1 )
    and the variables are:
    | name | val |
    | v0 | Noir désir |
    | v1 | Björk |

