#!/usr/bin/env python

import xml.etree.ElementTree as ET;
import os;

currentVersion = ET.parse(open('pom.xml')).getroot().find('{http://maven.apache.org/POM/4.0.0}version').text

# tag
os.system('git -c user.name="travis" -c user.email="travis" tag -a ' + currentVersion + ' -m "[skip ci] Built version: ' + currentVersion + '"')
os.system('git push --tags --repo ' + os.environ['GITHUB_AUTH_REPO_URL'])

# bintray upload
bintrayVersionUrl = 'https://api.bintray.com/maven/buildit/maven/confluence-maven-plugin/;publish=1/com/wiprodigital/confluence-maven-plugin/' + currentVersion + '/confluence-maven-plugin-' + currentVersion
bintrayJarUrl = bintrayVersionUrl + '.jar'
bintrayPomUrl = bintrayVersionUrl + '.pom'
os.system('curl -u ' + os.environ['BINTRAY_USERNAME'] + ':' + os.environ['BINTRAY_PASSWORD'] + ' -T target/*.jar "' + bintrayJarUrl + '"')
os.system('curl -u ' + os.environ['BINTRAY_USERNAME'] + ':' + os.environ['BINTRAY_PASSWORD'] + ' -T pom.xml "' + bintrayPomUrl + '"')

# bump version
decomposedVersion = currentVersion.split('.')

majorVersion = decomposedVersion[0]
minorVersion = decomposedVersion[1]
patchVersion = decomposedVersion[2].split('-')[0]

nextVersion = majorVersion + '.' + minorVersion + '.' + str(int(patchVersion) + 1)

os.system('mvn -DnewVersion=' + nextVersion + ' versions:set versions:commit')
os.system('git add pom.xml')
os.system('git -c user.name="travis" -c user.email="travis" commit -m "[skip ci] Bumping version to ' + nextVersion + '"')
os.system('git push --repo ' + os.environ['GITHUB_AUTH_REPO_URL'])
