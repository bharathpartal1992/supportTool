# Change JAVA_HOME,M2_HOME as per local Java/Maven runtime(e.g : for JAVA_HOME set it to complete path of JDK installation folder and for M2_HOME set it to complete path of Maven folder)
set JAVA_HOME=C:\Program Files\Java\jdk1.8.0_201
set M2_HOME=%CD%\build_tools\apache-maven-3.3.9
set PATH=%JAVA_HOME%\bin;%M2_HOME%\bin;%PATH%
set CLASSPATH=%JAVA_HOME%\lib
set MAVEN_OPTS= -Xmx512m
mvn package -DskipTests

