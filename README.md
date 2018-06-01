# Digital Earth Australia - Continuous Integration
This repo defines the infrastructure as code used to manage Digital Earth Australia's Concourse Deployment https://ci.dea.gadevs.ga 

# Requirements
1. AWS Creds configured
2. Terraform

# Setup
1. Install [concourse-up](https://github.com/EngineerBetter/concourse-up)
2. Configure a route53 domain (ci.dea.gadevs.ga)
3. `concourse up deploy --region ap-southeast-2 --domain ci.dea.gadevs.ga dea-ci
4. Install [credhub-cli](https://github.com/cloudfoundry-incubator/credhub-cli)
5. Configure it `eval "$(concourse-up info dea-ci --region ap-southeast-2 --env)"`


# Further reading
* [Concourse-ci](https://concourse-ci.org/)
* [Concourse-ci tutorials](https://concoursetutorial.com/)