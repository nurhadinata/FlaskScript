#!/bin/bash
DB_USER="purchase"
DB_PASSWORD="root"
DB_NAME="purchase_app"
DB_HOST="localhost"
PG_USER="postgres"
PG_PASSWORD="12345678"

REPO_URL="https://github.com/alamkamajana/purchaseApp.git"
DESTINATION_DIR="flaskApp"
BRANCH_NAME="development"

check_os() {
    # Determine the OS type
    OS_TYPE=$(uname)
    case "$OS_TYPE" in
        "Linux")
            if [ -f /etc/os-release ]; then
                . /etc/os-release
                OS_NAME=$NAME
                OS_VERSION=$VERSION
            elif type lsb_release >/dev/null 2>&1; then
                OS_NAME=$(lsb_release -si)
                OS_VERSION=$(lsb_release -sr)
            elif [ -f /etc/lsb-release ]; then
                . /etc/lsb-release
                OS_NAME=$DISTRIB_ID
                OS_VERSION=$DISTRIB_RELEASE
            elif [ -f /etc/debian_version ]; then
                OS_NAME="Debian"
                OS_VERSION=$(cat /etc/debian_version)
            elif [ -f /etc/redhat-release ]; then
                OS_NAME="Red Hat"
                OS_VERSION=$(cat /etc/redhat-release)
            else
                OS_NAME=$(uname -s)
                OS_VERSION=$(uname -r)
            fi
            ;;
        "Darwin")
            OS_NAME="macOS"
            OS_VERSION=$(sw_vers -productVersion)
            ;;
        "CYGWIN"*|"MINGW"*|"MSYS"*)
            OS_NAME="Windows"
            OS_VERSION=$(uname -r)
            ;;
        *)
            OS_NAME="Unknown"
            OS_VERSION="Unknown"
            ;;
    esac
}

check_os

cd $DESTINATION_DIR

if [ "$OS_NAME" = "macOS" ]; then
	source venv/bin/activate
	
	export THONUNBUFFERED=1
	export FLASK_APP=run.py
	export FLASK_DEBUG=1

	venv/bin/flask run
elif [ "$OS_NAME" = "Windows" ]; then
	source venv/Scripts/activate
	
	export THONUNBUFFERED=1
	export FLASK_APP=run.py
	export FLASK_DEBUG=1

	venv/Scripts/flask run
fi
