@Library('dst-shared@master') _

dockerBuildPipeline {
        repository = "loftsman"
        app = "helm"
        name = "loftsman-helm"
        description = "Loftsman Helm"
        useEntryPointForTest = "false"
        dockerArguments = "--build-arg loftsman_docker_kubectl_image_version=latest --build-arg helm_version=v2.16.6"
        product = "shasta-premium,shasta-standard"
}
