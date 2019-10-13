#!/bin/sh
# Some actions to perform after "make dev.up"
echo "Installin llpa plugin on LMS"
docker-compose exec lms bash -c "source /edx/app/edxapp/devstack.sh && cd /edx/src/llpa_openedx_extensions && pip install -e ."
echo "Installin llpa plugin on CMS"
docker-compose exec studio bash -c "source /edx/app/edxapp/devstack.sh && cd /edx/src/llpa_openedx_extensions && pip install -e ."
