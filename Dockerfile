# AIdrac MCP Server - Docker Image
# AI-Powered Out-of-Band Management via DTMF, Ultrasonic, Morse
#
# Build: docker build -t mcp-server-aidrac .
# Run:   docker run -i mcp-server-aidrac
#
# Part of HumoticaOS - https://humotica.com

FROM python:3.11-slim

LABEL maintainer="Jasper van de Meent <info@humotica.com>"
LABEL org.opencontainers.image.source="https://github.com/jaspertvdm/mcp-server-aidrac"
LABEL org.opencontainers.image.description="AI-Powered Out-of-Band Management - The open alternative to iDRAC/iLO"
LABEL org.opencontainers.image.licenses="AGPL-3.0"

# Install system dependencies for audio
RUN apt-get update && apt-get install -y --no-install-recommends \
    libsndfile1 \
    && rm -rf /var/lib/apt/lists/*

# Install from PyPI
RUN pip install --no-cache-dir mcp-server-aidrac

# MCP servers communicate via stdio
ENTRYPOINT ["python", "-m", "mcp_server_aidrac"]
