# docker-packer-awscli
Docker container with packer and aws-cli

# Details
Installs the following packages:
- aws-cli/1.16.85
- curl
- git
- packer/1.3.4-dev
- py2-pip=10.0.1-r0
- zip

# Instructions for Use
To use packer or aws-cli with this container, you have two options:

1. Pass in your ~/.aws directory that has your credentials file. If you are using a profile other than the default, you will also need to set the environment variable `AWS_PROFILE`.

2. You can pass in the following environment variables:
    - `AWS_ACCESS_KEY_ID`
    - `AWS_SECRET_ACCESS_KEY`

You will also need to pass in the following variable:
- `AWS_DEFAULT_REGION`

# Example Use

## This mounts the credentials file in the container for use
```
docker run --rm -v ~/.aws:/root/.aws -it --entrypoint /bin/sh forgedconcepts/packer-awscli:latest
```

# dockerhub
You can find the container for this here:

https://hub.docker.com/r/forgedconcepts/packer-awscli

# More Information
For more information on environment variables and aws, please refer to the following link:

https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-envvars.html

# Issues
If you have any issues with this Dockerfile, please create an issue or submit a pull request with a fix.
