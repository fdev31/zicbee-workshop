from lettuce import *
from zicbee.db.dbe import Database
from terrain import reset
import os

E = AssertionError

@step('Given I have a fresh database')
def clear_database(step):
    reset()

@step('I scan the test songs')
def scantest(step):
    db = world.db
    assert len(list(db.merge(db.db_name, directory=os.path.curdir))) == 8

@step('I have (\d+) songs? in the database')
def checklen(step, size):
    db = world.dbe
    if len(db) != int(size):
        raise E('Expected %r, got %r!'%(int(size), len(db)))

