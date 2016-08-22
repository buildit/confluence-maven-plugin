#!/usr/bin/env python

import xml.etree.ElementTree as ET;
import os;

currentVersion = ET.parse(open('pom.xml')).getroot().find('{http://maven.apache.org/POM/4.0.0}version').text

bintrayUrl = 'https://api.bintray.com/content/buildit/maven/confluence-maven-plugin/' + currentVersion + '/confluence-maven-plugin-' + currentVersion + '.jar?publish=1'
os.system('curl -u ' + os.environ['BINTRAY_USERNAME'] + ':' + os.environ['BINTRAY_PASSWORD'] + ' -T target/*.jar "' + bintrayUrl + '"')

decomposedVersion = currentVersion.split('.')

majorVersion = decomposedVersion[0]
minorVersion = decomposedVersion[1]
patchVersion = decomposedVersion[2].split('-')[0]

nextVersion = majorVersion + '.' + minorVersion + '.' + str(int(patchVersion) + 1)

os.system('mvn -DnewVersion=' + nextVersion + ' versions:set versions:commit')
os.system('git add pom.xml')
os.system('git commit -m "[skip ci] Bumping version to ' + nextVersion + '"')
os.system('git push')

