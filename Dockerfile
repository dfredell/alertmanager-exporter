FROM python:3-alpine

# Create a group and user
RUN addgroup -S appgroup && adduser -S appuser -G appgroup
# Tell docker that all future commands should run as the appuser user
USER appuser

RUN pip3 install prometheus_client pyaml

COPY exporter/ ~

ENTRYPOINT ["/usr/local/bin/python", "~/exporter.py"]
