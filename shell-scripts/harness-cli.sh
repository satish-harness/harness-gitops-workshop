


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