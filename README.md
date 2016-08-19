# Confluence Maven Plugin

```xml
<plugin>
    <groupId>@project.groupId@</groupId>
    <artifactId>@project.artifactId@</artifactId>
    <version>@project.version@</version>
    <configuration>
        <apiBaseUrl>http://foo.bar.net/wiki/rest/api/</apiBaseUrl>
        <readTimeoutMs>3000</readTimeoutMs>
        <connectionTimeoutMs>5000</connectionTimeoutMs>
        <credentialsServerId>confluence.credentials</credentialsServerId>
        <spaceKey>AC</spaceKey>
        <ancestorId>1671226</ancestorId>
        <type>page</type>
        <representation>wiki</representation>
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