FROM jupyter/datascience-notebook:latest

ENV JUPYTER_ENABLE_LAB=yes

RUN pip install --no-cache-dir \
    clickhouse-connect \
    filterpy \
    dtaidistance \
    stumpy \
    pyarrow \
    openpyxl \
    plotly \
    kaleido
