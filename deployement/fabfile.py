# Fabfile to:
#    - update the remote system(s)
#    - download and install an application

# Import Fabric's API module
from fabric.api import *
import timeit
import sys


start = timeit.default_timer()
env.colorize_errors = 'true'
# env.hosts = [
#     'acc.3.magestack.com', 'acc.3.magestack.com'
# ]

# # Set the username
# env.user   = "www-data"

# # Set the password [NOT RECOMMENDED]
# env.password = "tmH7vwBE"
env.roledefs = {
    'dev': ['www-data@acc.3.magestack.com '],
    'prod': ['www-data@acc.3.magestack.com'],
    }
env.password = ""
env.passwords = {'www-data@acc.3.magestack.com':'', 'www-data@acc.3.magestack.com':''}






def down_stream():
    """
        CHECKING DOWNLOADING
        """
    print ("Copying Data from Dev10 Domain to Ahmed Domain from HTTP Folder......")
    result =  get(remote_path="/microcloud/domains/tondev/domains/ahmed.tonsoftiles.co.uk/http/*", local_path="/home/ahmed/http/")
    run("ls /microcloud/domains/tondev/domains/ahmed.tonsoftiles.co.uk/http/")
    local("ls /home/ahmed/http")
    result.failed
    result.succeeded



@roles('dev')
@task
def sync_data():
    print("Listing ahmed Domain http data...")
    run("ls /microcloud/domains/tondev/domains/ahmed.tonsoftiles.co.uk/http/")
    print ("Next lisng dev10 Domain http data....")
    run("ls /microcloud/domains/tondev/domains/dev10.tonsoftiles.co.uk/http/")
    print ("Syncing Data.....................................................")
    print(".................................")
    print("..........DATA RSYNC.............")
    print(".................................")
    run ("time ./rsync_data.sh")
@roles('dev')
@task
def testing():
    """
    Testing Bash Script In a go....
    """
    print(".................................")
    print("........RUNNING BASH.............")
    print(".................................")
    run("ls")
    run("time ./parse_db_data.sh")

@roles('prod')
@task
def data_dump_task():
    print(".................................")
    print("........PRODUCTION ..............")
    print(".................................")
    run("ls")
    run("time ./parse_db_data.sh -p")

@roles('dev')
@task
def data_restore_task():
    print(".................................")
    print("........DEVELOPMENT .............")
    print(".................................")
    run("ls")
    run("time ./parse_db_data.sh -d")

@roles('dev')
@task
def db_url_alter():
    print(".................................")
    print("........DEV DB URL ALT...........")
    print(".................................")
    run("ls")
    run("time ./db_alter.sh")

@task
def dev_env_setup():

    # Initial Domain Check
    # db_dump()
    # Downloading Data from another Domain
    # down_stream()
    execute (sync_data) #on dev bad idea to transfer data using FABRIC
    # execute (testing) #on dev
    # execute (data_dump_task) #on prod
    # execute (data_restore_task) #on dev
    # execute (db_url_alter) #on dev


    stop = timeit.default_timer()
    total_time = stop - start
    mins, secs = divmod(total_time, 60)
    hours, mins = divmod(mins, 60)

    sys.stdout.write("Total running time: %d:%d:%d.\n" % (hours, mins, secs))