#!/bin/sh
# Some actions to perform after "make dev.up"
echo "Installin campus plugin on LMS"
docker-compose exec lms bash -c "source /edx/app/edxapp/devstack.sh && cd /edx/src/campusromero-openedx-extensions && pip install -e ."
echo "Installin campus plugin on CMS"
docker-compose exec studio bash -c "source /edx/app/edxapp/devstack.sh && cd /edx/src/campusromero-openedx-extensions && pip install -e ."
