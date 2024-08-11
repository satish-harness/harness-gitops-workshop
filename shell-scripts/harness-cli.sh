# Login to harness management workspace
harness login --api-key pat.cPcMSab0TciUK5YVZSZOrQ.66ab8f356564346813b4bb67.GpjqpLMnMNWMCEUdCfhY --account-id cPcMSab0TciUK5YVZSZOrQ

#Create secrets for github and docker hub

harness secret apply --secret-name "github_pat" --token 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
harness secret apply --secret-name "docker_secret" --token dckr_pat_v0zSjF_9RB_CMFBuTqK3KEU_FhY


# Create Connectors for both github and docker using secrets stored in harness

harness connector --file ./cli-manifests/github-connector.yaml apply
harness connector --file ./cli-manifests/docker-connector.yaml apply


# Create CI pipeline 

harness pipeline --file ./cli-manifests/cipipeline.yaml apply


# AGEN_NAME + gitops cluster

export AGENT_NAME=gitopsagentaws

harness gitops-cluster --file ./cli-manifests/gitops-cluster.yaml apply --agent-identifier $AGENT_NAME
harness gitops-repository --file ./cli-manifests/gitops-repo.yaml apply --agent-identifier $AGENT_NAME


ARGO_PROJECT=421ed6a1