### LEMMA-to-Jolie Encoder

This repository comprises the source code of an encoder that transforms [LEMMA](https://github.com/SeelabFhdo/lemma) domain models into [Jolie](https://jolie-lang.org) programs.

There are basically two possibilities to invoke the encoder.

### Docker-Based Invocation
1. Clone the repository, `cd` into the cloned folder and run the `docker-build.sh` Bash script. The script will build the encoder's container image `lemma2jolie:latest`.
2. Run the `docker-run-sample.sh` Bash script to start a container based on the `lemma2jolie:latest` image and invoke the encoder on the `sample.data` LEMMA domain model in the cloned repository folder. This invocation results in the file `sample.ol` in the cloned repository folder. It comprises the Jolie code corresponding to the LEMMA domain model.
3. To invoke the encoder on another LEMMA domain model than `sample.data`, run the `docker-run.sh` Bash script with the respective LEMMA domain model. Upon success, the encoder will produce a Jolie file in the same directory and with the same base name as the LEMMA domain model. For instance, the LEMMA domain model `/tmp/domain.data` will be encoded in the Jolie file `/tmp/domain.ol`.

### Local Invocation
**Prerequisites:** Java 11 and Maven >= 3.6.3.

1. Clone the repository, `cd` into the cloned folder and run the `install.sh` Bash script. The script will install all necessary dependencies for the encoder in your local Maven repository and finally invoke `mvn clean install`. The latter command results in the executable encoder file `target/lemma2jolie.jar`.
2. Run the `run-sample.sh` Bash script to invoke the encoder's JAR file on the `sample.data` LEMMA domain model in the cloned repository folder. This invocation results in the file `sample.ol` in the cloned repository folder. It comprises the Jolie code corresponding to the LEMMA domain model.
3. To invoke the encoder on another LEMMA domain model than `sample.data`, run the `run.sh` Bash script with the respective LEMMA domain model. Upon success, the encoder will produce a Jolie file in the same directory and with the same base name as the LEMMA domain model. For instance, the LEMMA domain model `/tmp/domain.data` will be encoded in the Jolie file `/tmp/domain.ol`.