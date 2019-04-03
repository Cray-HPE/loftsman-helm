@Library('dst-shared@master') _

dockerBuildPipeline {
        repository = "anajjar"
        masterBranch = "feature/build-pipeline"
        imagePrefix = "loftsman"
        app = "helm"
        name = "loftsman-helm"
        description = "Loftsman Helm"
        useEntryPointForTest = "false"
        dockerArguments = "--build-arg loftsman_docker_kubectl_image_version=latest --build-arg helm_version=2.13.1"
}