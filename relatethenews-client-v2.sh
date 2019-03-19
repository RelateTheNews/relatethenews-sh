#!/bin/bash

# copyright 2019 RelateTheNews

# WARRANTY
# NO Warranty is expressed or implied with this script.

##### BEGIN ACCESS CONFIG #####
#
# All values below will be provided
# by RelateTheNews to licensed users
#
# Each of the following can be specified at runtime
# if interactivity section remains (see below)
# or provided here to have a fully autonomous
# API client.
#
###############################

# Specify the URL provided for API access. DO NOT include a trailing slash
 URLROOT="https://api.sample.com"

# Specify the Email address provided for Access
 EMAIL="api-access@relatethenews.client.com"

# Specify the Password provided
 PASSWORD=""

# Specify the provided API key
 APIKEY=''

# Specify provided Referer information
 REFERRER="RelateTheNews Client ID NNNN"

#### END ACCESS CONFIG #######

#### BEGIN SCRIPT CONFIG #####

# Should script interactively prompt for connection information
 INTERACTIVE=true

# Location and Name of file to contain
# output from API requests.
#
# NOTE: ALL output for a given year, month, day is appended
#   to this file. This means that ALL endpoint data will be
#   in the specified OUTFILE. Additionally all subsequent
#   requests on the same year, month, day will be in the
#   same OUTFILE.
#
# Default provides a file with year-month-day appended
 OUTFILE="relatethenews-apiresults-$(date +%Y%m%d).out"

# Logfile location this will log all script status messages
 LOGFILE="relatethenews-api-$(date +%Y%m%d).log"

#### END SCRIPT CONFIG #######
##############################

#### DO NOT MODIFY SETTINGS Below this line ##############
# Curl and File Config for Testing
 HEADERS="X-RTN-API-key:"
 COOKIEJAR="relatethenews-sh-cookies.txt"

#### BEGIN Interactivity Section #####

 if [ "$INTERACTIVE" = true ]
 then
     echo "URL Root: (default $URLROOT) "
     read CUSTOMROOT
     echo "API Key: (default $APIKEY) "
     read CUSTOMAPIKEY
     echo "Email to use for this test cycle: (default $EMAIL) "
     read CUSTOMEMAIL
     echo "Password for this test cycle: (default $PASSWORD) "
     read -s CUSTOMPASSWORD

     if [ -n "$CUSTOMROOT" ]
     then
         URLROOT=$CUSTOMROOT
     fi

     if [ -n "$CUSTOMAPIKEY" ]
     then
         APIKEY=$CUSTOMAPIKEY
     fi

     if [ -n "$CUSTOMEMAIL" ]
     then
         EMAIL=$CUSTOMEMAIL
     fi

     if [ -n "$CUSTOMPASSWORD" ]
     then
         PASSWORD=$CUSTOMPASSWORD
     fi
 fi

#### END Interactivity Section #####

# Set URLROOT value with trailing slash
 URLROOT="$URLROOT/"

# SET options for curl
# DO NOT modify these settings
STDOPTIONS="-v -i -H $USERAGENT --header $HEADERS$APIKEY -u $EMAIL:$APIKEY"

 ## BEGIN SAMPLE API ENDPOINT ACCESS ##
 #
 # Repeat as many of these sequences as needed
 # to access a variety of RelateTheNews API endpoints
 #
 # NOTE: ALL data is written(appended) to the same
 #  OUTFILE.
 #
 ######################################
 URI="example-endpoint"
 DATA=""
 TYPE="GET"
 EXPECTEDRESULT='200'
 printf "\n######### Trying $URLROOT$URI...\n" >> $LOGFILE
 printf "\n--------------EXPECTED RESULT: $EXPECTEDRESULT ----------------\n\n" >> $LOGFILE
 printf "\n##############DATA SEPARATOR###################################\n">>$OUTFILE
 curl  $STDOPTIONS $URLROOT$URI >> $OUTFILE
 printf "\n####################################################################\n" >> $LOGFILE
 ## END SAMPLE API ENDPOINT ACCESS ##

 ##### LOGGING SECTION
 printf "\n#### \n" >> $LOGFILE
 printf "#### \n" >> $LOGFILE
 printf "#### END SESSION #########################################\n" >> $LOGFILE
