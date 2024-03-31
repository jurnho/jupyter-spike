FROM debian:bookworm

RUN apt update && apt install -y pip
RUN apt update && apt install -y python3-venv
RUN useradd --create-home jupyter
USER jupyter
WORKDIR /home/jupyter
RUN python3 -m venv jupyter
WORKDIR /home/jupyter/jupyter
RUN ./bin/pip install jupyterlab
RUN ./bin/pip install pandas
RUN ./bin/pip install matplotlib

RUN mkdir /home/jupyter/notebook
ENTRYPOINT  ./bin/jupyter-lab --ip 0.0.0.0 --notebook-dir /home/jupyter/notebook/
