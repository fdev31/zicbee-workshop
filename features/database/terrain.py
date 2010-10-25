from lettuce import world
from zicbee.db.dbe import Database

DB_NAME="lettuce_test"

def reset():
    if hasattr(world, 'db'):
        db = world.db.databases[DB_NAME]['handle']
        for song in db:
            db.delete(song)
        world.db.close()
    world.db = Database(DB_NAME)
    world.dbe = world.db.databases[DB_NAME]['handle']

reset()

