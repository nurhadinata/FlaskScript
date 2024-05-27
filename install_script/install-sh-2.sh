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

# Check if the destination directory already exists
if [ -d "$DESTINATION_DIR" ]; then
    echo "Destination directory '$DESTINATION_DIR' already exists."
else
    echo "Cloning repository..."
    git clone -b "$BRANCH_NAME" --single-branch "$REPO_URL" "$DESTINATION_DIR"

    echo "Repository cloned successfully."

fi

# Clone the repository


# Install Python 3.10 using pyenv
echo "Installing Python 3.10..."
pyenv install 3.10.5


# Set Python 3.10 as the global version
pyenv global 3.10.5

echo 'alias python="$HOME/.pyenv/pyenv-win/versions/3.10.5/python3.exe"'>>~/.bashrc
source ~/.bashrc

echo "Python 3.10 has been successfully installed."

cd $DESTINATION_DIR

if [ -d "venv" ]; then
    # Delete the directory and its contents
    rm -rf "venv"
fi


if [ "$OS_NAME" = "macOS" ]; then
    echo "Creating virtual environment..."
	pip install virtualenv

	virtualenv venv


	source venv/bin/activate
	echo "Virtual Environment has been successfully created."

	echo "Installing dependencies..."
	pip3 install -r data/requirements.txt
	echo "Dependencies has been successfully installed."

	export THONUNBUFFERED=1
	export FLASK_APP=run.py
	export FLASK_DEBUG=1

	venv/bin/flask run
elif [ "$OS_NAME" = "Windows" ]; then
    echo "Creating virtual environment..."
	pip install virtualenv

	virtualenv venv


	source venv/Scripts/activate
	echo "Virtual Environment has been successfully created."

	echo "Installing dependencies..."
	pip3 install -r data/requirements.txt
	echo "Dependencies has been successfully installed."

	export THONUNBUFFERED=1
	export FLASK_APP=run.py
	export FLASK_DEBUG=1

	venv/Scripts/flask run
fi
