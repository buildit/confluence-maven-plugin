#!/usr/bin/env python

import os;

os.system(
    'curl -u ' + os.environ['BINTRAY_USERNAME'] + ':' + os.environ['BINTRAY_PASSWORD'] +
    ' -T target/*.jar "https://api.bintray.com/content/buildit/maven/confluence-maven-plugin/${pomVersion}/confluence-maven-plugin-${pomVersion}.jar?publish=1"'
