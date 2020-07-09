#! /bin/bash

# Must be run from the same folder (e.g. `source activate.bash`)

# The directory to get the settings from
SETTINGS_DIR="scripts"

# Get the settings
source "$SETTINGS_DIR/settings.bash"

# Activate the virtual enviroment
source "$VIRTUALENV_DIR/bin/activate"
echo "Activated Python virtual enviroment... ($( python --version ))"

# Set up some aliases
MANAGE="python $DIR/$PROJECT_NAME/manage.py"

alias manage="$MANAGE"
alias makemigrations="manage makemigrations"
alias migrate="manage migrate"
alias collectstatic="manage collectstatic"
alias runserver="manage runserver 0.0.0.0:$TEST_PORT"

# Assumes you're using gunicorn/nginx
alias restart="sudo systemctl restart gunicorn; sudo service nginx restart"

alias backup="bash $SCRIPT_DIR/backup.bash"

