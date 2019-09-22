FROM python:3.7.4-slim-stretch

WORKDIR /ironhack-data

# Allow overcommit to avoid memory errors
RUN echo 1 > /proc/sys/vm/overcommit_memory

# This is so the jupyter kernel doesn't die on us
ENV TINI_VERSION v0.6.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /usr/bin/tini
RUN chmod +x /usr/bin/tini
ENTRYPOINT ["/usr/bin/tini", "--"]


# Dependencies and other stuff for c python libs and opencv.
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y build-essential cmake unzip pkg-config curl git libjpeg-dev libpng-dev libtiff-dev libatlas-base-dev gfortran clang


# Install requirements
RUN pip install pipenv
COPY Pipfile* ./
RUN python -m pipenv install --ignore-pipfile --system --deploy

# Download all nltk corpus
RUN python -m nltk.downloader all

# Put jupyter's password to avoid token things
RUN jupyter notebook --generate-config && echo 'c.NotebookApp.password="sha1:908057adeec2:f338a30939275c19575fb377fddfc3241c7c3c14"' >> /root/.jupyter/jupyter_notebook_config.py


EXPOSE 8888

CMD ["jupyter", "notebook", "--port=8888", "--no-browser","--allow-root", "--ip=0.0.0.0"]
