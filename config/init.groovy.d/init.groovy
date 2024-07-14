// import jenkins.model.*
// import org.jenkinsci.plugins.github_branch_source.*
// import jenkins.branch.*
// import org.jenkinsci.plugins.workflow.job.properties.*
// import org.jenkinsci.plugins.github_branch_source.GitHubServerConfig
// import org.jenkinsci.plugins.github.webhook.GitHubPushTrigger

// def inst = Jenkins.getInstance()

// // GitHub 서버 설정
// def descriptor = inst.getDescriptorByType(org.jenkinsci.plugins.github_branch_source.GitHubSCMSource.DescriptorImpl)
// descriptor.configure { config ->
//     def servers = config.getServers()
//     servers.add(new GitHubServerConfig("https://api.github.com"))
//     config.save()
// }

// // 예제 Job 설정
// def job = inst.createProject(org.jenkinsci.plugins.workflow.job.WorkflowJob, "example-pipeline")
// job.addProperty(new org.jenkinsci.plugins.workflow.job.properties.PipelineTriggersJobProperty(
//     [new GitHubPushTrigger()]))

// job.save()
