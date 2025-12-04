# Multi-stage Docker build for SysMap
FROM python:3.11-slim as builder

# Set working directory
WORKDIR /build

# Install build dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Copy project files
COPY pyproject.toml README.md LICENSE ./
COPY src/ ./src/

# Install the package
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir build && \
    python -m build

# Final stage
FROM python:3.11-slim

# Set labels
LABEL org.opencontainers.image.title="SysMap"
LABEL org.opencontainers.image.description="A comprehensive system inventory tool"
LABEL org.opencontainers.image.authors="Lorenzo Uriel"
LABEL org.opencontainers.image.source="https://github.com/lorenzouriel/sysmap"
LABEL org.opencontainers.image.licenses="MIT"

# Set working directory
WORKDIR /app

# Install runtime dependencies (package managers)
RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    git \
    && rm -rf /var/lib/apt/lists/*

# Optional: Install snap, flatpak if needed
# RUN apt-get update && apt-get install -y snapd flatpak

# Copy wheel from builder
COPY --from=builder /build/dist/*.whl /tmp/

# Install SysMap
RUN pip install --no-cache-dir /tmp/*.whl && \
    rm /tmp/*.whl

# Create volume for output
VOLUME ["/output"]

# Set environment variable for output directory
ENV SYSMAP_OUTPUT_DIR=/output

# Set entrypoint
ENTRYPOINT ["sysmap"]

# Default command
CMD ["scan", "--output", "/output/SYSTEM_SUMMARY.md"]