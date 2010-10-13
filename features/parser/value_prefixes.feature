Feature: test python code generation

Scenario: test simple equalities
    Parse artist: =Toto and album: (old or may)
    The python code is artist.lower() == u'toto' and ( u'old' in album.lower() or u'may' in album.lower() )

Scenario: test more complex equalities
    Parse artist: =Toto and album: (old or may)
    The python code is artist.lower() == u'toto' and ( u'old' in album.lower() or u'may' in album.lower() )

Scenario: test more complex equalities
    Parse (artist: =Toto or album: winter) and album: (old or may)
    The python code is ( artist.lower() == u'toto' or u'winter' in album.lower() ) and ( u'old' in album.lower() or u'may' in album.lower() )

Scenario: test more complex equalities
    Parse (artist: =Toto and ! album: winter) and album: (old or may)
    The python code is ( artist.lower() == u'toto' and not u'winter' in album.lower() ) and ( u'old' in album.lower() or u'may' in album.lower() )

Scenario: test not keyword "!"
    Parse ! artist: dave
    The python code is not u'dave' in artist.lower()

    Parse ! Artist: dave
    The python code is not u'dave' in artist

    Parse !artist: =dave
    The python code is not artist.lower() == u'dave'

    Parse (!artist:=dave  album:sky)or(Album:Moon)
    THE python code is ( not artist.lower() == u'dave' and u'sky' in album.lower() ) or ( u'Moon' in album )

    Parse length: 60
    The python code is 59 <= length <= 61

    Parse length: =60
    The python code is length == 60

    Parse not length: 60
    The python code is not 59 <= length <= 61

    Parse not length: <6
    The python code is not length < 6

    Parse artist: =A and score: >4
    The python code is artist.lower() == u'a' and score > 4

    Parse Artist: =A and score: >4
    The python code is artist == u'A' and score > 4

Scenario: test implicit "or" between ()
    Parse (!artist:=dave  album:sky)(Album:Moon)
    The python code is ( not artist.lower() == u'dave' and u'sky' in album.lower() ) or ( u'Moon' in album )

Scenario: group and equality prefix
  Parse Artist: (=Noir désir or =Björk)
  The python code is ( artist == u'Noir d\xe9sir' or artist == u'Bj\xf6rk' )
