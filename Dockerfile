FROM maven:3.6.3-openjdk-11-slim

ARG workdir=/usr/local/lemma2jolie

COPY assembly.xml $workdir/assembly.xml
COPY install.sh $workdir/install.sh
COPY pom.xml $workdir/pom.xml
COPY libs $workdir/libs
COPY src $workdir/src
WORKDIR $workdir

RUN chmod +x install.sh
RUN ./install.sh

ENTRYPOINT ["java", "--add-opens", "java.base/java.lang=ALL-UNNAMED", "-jar", "/usr/local/lemma2jolie/target/lemma2jolie.jar"]
