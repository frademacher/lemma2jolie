### LEMMA2Jolie: A Tool to Generate Jolie APIs from LEMMA Domain Models

This repository comprises the source code of a code generator that transforms [LEMMA](https://github.com/SeelabFhdo/lemma) domain models into [Jolie](https://jolie-lang.org) APIs.

There are basically two possibilities to invoke the generator.

### Docker-Based Invocation
1. Clone the repository, `cd` into the cloned folder and run the `docker-build.sh` Bash script. The script will build the generator's container image `lemma2jolie:latest`.
2. Run the `docker-run-sample.sh` Bash script to start a container based on the `lemma2jolie:latest` image and invoke the generator on the `sample.data` LEMMA domain model in the cloned repository folder. This invocation results in the file `sample.ol` in the cloned repository folder. It comprises the Jolie code corresponding to the LEMMA domain model.
3. To invoke the generator on another LEMMA domain model than `sample.data`, run the `docker-run.sh` Bash script with the respective LEMMA domain model. Upon success, the generator will produce a Jolie file in the same directory and with the same base name as the LEMMA domain model. For instance, the LEMMA domain model `/tmp/domain.data` will be generated in the Jolie file `/tmp/domain.ol`.

### Local Invocation
**Prerequisites:** Java 11 and Maven >= 3.6.3.

1. Clone the repository, `cd` into the cloned folder and run the `install.sh` Bash script. The script will install all necessary dependencies for the generator in your local Maven repository and finally invoke `mvn clean install`. The latter command results in the executable generator file `target/lemma2jolie.jar`.
2. Run the `run-sample.sh` Bash script to invoke the generator's JAR file on the `sample.data` LEMMA domain model in the cloned repository folder. This invocation results in the file `sample.ol` in the cloned repository folder. It comprises the Jolie code corresponding to the LEMMA domain model.
3. To invoke the generator on another LEMMA domain model than `sample.data`, run the `run.sh` Bash script with the respective LEMMA domain model. Upon success, the generator will produce a Jolie file in the same directory and with the same base name as the LEMMA domain model. For instance, the LEMMA domain model `/tmp/domain.data` will be generated in the Jolie file `/tmp/domain.ol`.
