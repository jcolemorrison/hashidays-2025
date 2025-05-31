# 1. Make an agent pool
# 2. Generate a token and use it here
# 3. Pick a name for your agent (for your reference only)
# 4. Set the Request Forwarding flag to true


export TFC_AGENT_TOKEN=your-token
export TFC_AGENT_NAME=your-agent-name
export TFC_AGENT_REQUEST_FORWARDING=true # Small tweak
docker run -e TFC_AGENT_TOKEN -e TFC_AGENT_NAME -e TFC_AGENT_REQUEST_FORWARDING hashicorp/tfc-agent:latest
