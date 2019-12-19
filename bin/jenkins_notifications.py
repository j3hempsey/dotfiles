#!/usr/env/bin python
"""
Pop up notifications for jenkins builds
"""
import os
import json
import requests
import zipfile
from StringIO import StringIO
from Foundation import NSUserNotification
from Foundation import NSUserNotificationCenter
from Foundation import NSUserNotificationDefaultSoundName
import jenkinsapi
from jenkinsapi.jenkins import Jenkins

username=""
password=""
job_name=""
jenkins_url=""

def notify(title, message):
    notification = NSUserNotification.alloc().init()
    notification.setTitle_(title)
    notification.setInformativeText_(message)

    center = NSUserNotificationCenter.defaultUserNotificationCenter()
    center.deliverNotification_(notification)

try:
    # Log in
    j = Jenkins(jenkins_url, username=username, password=password)
    # Get build
    b = j.get_job(job_name)
    last = b.get_last_completed_build()
except Exception:
    # Cant access jenkins
    print "Cannot access"
    exit(0)

# if last.is_running():
#     # print "{} is running".format(last.get_number())
#     # notify("{0}".format(job_name), "{0} build {1}".format(last.get_params()["BRANCH"], last.get_number()))
#     exit(0)
#     last.block_until_complete()
#     last_number = last.get_number()
#     last = b.get_build(last_number)
# else:
try:
    with open("/tmp/build_number", "r+") as f:
        data = f.read()
        last_number = last.get_number()
        last_number = "{0}".format(last_number)
        if data is None or data == "":
            f.write(last_number)
        elif last_number != data:
            f.seek(0)
            f.write(last_number)
            f.truncate()
            branch = last.get_params()["BRANCH"]
            status = last.get_status()
            print "notify for {0}: {1}".format(branch, last_number)
            notify("{0} {1}".format(job_name, last_number), "{0} build {1}".format(branch, status))
except IOError:
    print "Creating file" 
    with open("/tmp/build_number", "w+") as f:
        last_number = last.get_number()
        last_number = "{0}".format(last_number)
        f.write(last_number)
