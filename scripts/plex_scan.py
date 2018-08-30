#!/usr/bin/env python

from plexapi.server import PlexServer
import yaml
import os
import sys

script_path = os.path.dirname(os.path.realpath(sys.argv[0]))

with open('{}/../secrets.yaml'.format(script_path)) as file:
    secrets = yaml.load(file)

plex_ip = secrets['plex_ip']
token = secrets['plex_token']
baseurl = 'http://{}:32400'.format(plex_ip)
plex = PlexServer(baseurl, token)

plex.library.update()
