# Change JAVA_HOME,M2_HOME as per local Java/Maven runtime(e.g : for JAVA_HOME set it to complete path of JDK installation folder and for M2_HOME set it to complete path of Maven folder)
export JAVA_HOME=/usr/lib/jvm/java-<version>                                                                                                                               
export M2_HOME=/opt/lib/maven                                                                                                                                                                                                                                                                                                                                                                                                                  
export PATH=$JAVA_HOME/bin:$M2_HOME:$PATH
export MAVEN_OPTS= -Xmx512m
mvn package -DskipTests                                                                                                                    
 