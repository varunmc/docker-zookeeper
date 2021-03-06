# docker-zookeeper
_Docker image for Zookeeper_

This image combines Zookeeper and Exhibitor and is intended to be used as part of the [Stack](https://github.com/varunmc/docker-stack). By default, Exhibitor is configured with _exhibitor.properties_ and runs Zookeeper in standalone mode.

## Getting Started
The [AWS CodeFormation](https://console.aws.amazon.com/cloudformation/home?region=us-east-1#/stack/detail?stackId=arn:aws:cloudformation:us-east-1:497513737772:stack%2FZookeeper%2Fcf599b10-9165-11e7-a6e5-50a686e4bb1e) template _stack.yml_ will create an [AWS CodePipeline](https://console.aws.amazon.com/codepipeline/home?region=us-east-1#/view/Zookeeper) with an [AWS CodeBuild](https://console.aws.amazon.com/codebuild/home?region=us-east-1#/projects/Zookeeper/view) builder as defined in _buildspec.yml_. The continuous pipeline will build and publish the image to [AWS ECR](https://console.aws.amazon.com/ecs/home?region=us-east-1#/repositories/mc.varun:zookeeper#images;tagStatus=ALL).

## Links
* [Apache Zookeeper](https://zookeeper.apache.org)
* [Netflix Exhibitor](https://github.com/soabase/exhibitor)
