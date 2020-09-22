# Fabfile to:
#    - update the remote system(s) 
#    - download and install an application

# Import Fabric's API module
from fabric.api import *

env.hosts = [
    'localhost'
]

# Set the username
env.user   = "www-data"

# Set the password [NOT RECOMMENDED]
env.password = "tmH7vwBE"

def db_dump():
    print("Listing ahmed Domain http data...")
    local("ls /microcloud/domains/tondev/domains/ahmed.tonsoftiles.co.uk/http/")
    print ("Next lisng dev10 Domain http data....")
    local("ls /microcloud/domains/tondev/domains/dev10.tonsoftiles.co.uk/http/")
def down_stream():
    """
        CHECKING DOWNLOADING
        """
    print ("Copying Data from Dev10 Domain to Ahmed Domain from HTTP Folder......")
    result =  local("cp /microcloud/domains/tondev/domains/dev10.tonsoftiles.co.uk/http/ /microcloud/domains/tondev/domains/ahmed.tonsoftiles.co.uk/http/")
    local("ls /microcloud/domains/tondev/domains/ahmed.tonsoftiles.co.uk/http/")
    result.failed
    result.succeeded

def dev_env_setup():

    # Initial Domain Check
    db_dump()
    # Downloading Data from another Domain
    down_stream()