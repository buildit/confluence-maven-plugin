!/usr/bin/env python

import xml.etree.ElementTree as ET;
import os;

version = ET.parse(open('pom.xml')).getroot().find('{http://maven.apache.org/POM/4.0.0}version').text
decomposedVersion = version.split('.')

majorVersion = decomposedVersion[0]
minorVersion = decomposedVersion[1]
patchVersion = decomposedVersion[2].split('-')[0]

nextVersion = majorVersion + '.' + minorVersion + '.' + str(int(patchVersion) + 1)

os.system('mvn -DnewVersion=' + nextVersion + ' versions:set versions:commit')
os.system('git add pom.xml)
os.system('git commit -m "Bumping version to: " + nextVersion"')
os.system('git push origin')