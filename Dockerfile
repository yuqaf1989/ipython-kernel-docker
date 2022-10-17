FROM secretflow/secretflow-anolis8:0.7.7b1

RUN /root/miniconda3/envs/secretflow/bin/pip install ipython ipykernel

COPY entrypoint.sh entrypoint.sh

# At runtime, mount the connection file to /tmp/connection_file.json
ENTRYPOINT [ "./entrypoint.sh"]
