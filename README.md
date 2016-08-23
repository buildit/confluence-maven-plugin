[![Build Status](https://travis-ci.org/buildit/confluence-maven-plugin.svg?branch=master)](https://travis-ci.org/buildit/confluence-maven-plugin)
[ ![Download](https://api.bintray.com/packages/buildit/maven/confluence-maven-plugin/images/download.svg) ](https://bintray.com/buildit/maven/confluence-maven-plugin/_latestVersion)
# Confluence Maven Plugin
This is a simple plugin to create documents in confluence. The name and content of the documents are defined explicitly.

| Parameter           | Description                                                                                                        |
|---------------------|--------------------------------------------------------------------------------------------------------------------|
| apiBaseUrl          | The base api URL. For atlassian cloud is usually something like: `https://yourdomain.atlassian.net/wiki/rest/api/` |
| credentialsServerId | The server ID in your build server maven `settings.xml` that contains the confluence credentials.                  |
| spaceKey            | The space to where documents should be created.                                                                    |
| ancestorId          | The ID of the parent document.                                                                                     |
| type                | The type of document to create (page or blog).                                                                     |
| representation      | The format of the document (wiki or storage).                                                                      |
| createParent        | Whether to create a parent page or not (defaults to false).                                                        |
| parentTitle         | The parent document title (only used if createParent is true).                                                     |
| parentContentFile   | The parent document content file (only used if createParent is true).                                              |
| documents           | Pairs of name and local filenames to be created on confluence.                                                     |
| connectionTimeoutMs | The connection timeout of the confluence HTTP client in milliseconds (defaults to 3000).                           |
| readTimeoutMs       | The read timeout of the confluence HTTP client in milliseconds (defaults to 6000).                                 |

#### Usage Example
```xml
<plugin>
    <groupId>com.wiprodigital</groupId>
    <artifactId>confluence-maven-plugin</artifactId>
    <version>1.0.3</version>
    <configuration>
        <apiBaseUrl>http://foo.bar.net/wiki/rest/api/</apiBaseUrl>
        <connectionTimeoutMs>3000</connectionTimeoutMs>
        <readTimeoutMs>6000</readTimeoutMs>
        <credentialsServerId>confluence.credentials</credentialsServerId>
        <spaceKey>AC</spaceKey>
        <ancestorId>1671226</ancestorId>
        <type>page</type>
        <representation>wiki</representation>
        <createParent>true</createParent>
        <parentTitle>Parent Document</parentTitle>
        <parentContentFile>${basedir}/docs-v1/parent.wiki</parentContentFile>
        <documents>
            <property>
                <name>Foo Document</name>
                <value>${basedir}/docs-v1/foo.wiki</value>
            </property>
            <property>
                <name>Bar Document</name>
                <value>${basedir}/docs-v1/bar.wiki</value>
            </property>
        </documents>
    </configuration>
    <executions>
        <execution>
            <id>publish-content</id>
            <phase>validate</phase>
            <goals>
                <goal>publish-content</goal>
            </goals>
        </execution>
    </executions>
</plugin>

```
