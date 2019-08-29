# Ironhack data docker

Docker image with batteries included to partake the third module of the Ironhack data bootcamp.

## What is it?

This image consists of a slim ubuntu stretch with Python 3.7.4 already installed.

Also, It comes with these dependencies already in the system:
```
jupyter
numpy
pandas
scikit-learn
matplotlib
seaborn
nltk
tensorflow
keras
```

All nltk corpuses are already downloaded and ready to use.


This image will launch a jupyter notebook instance on `http://localhost:8888``. The password is `ironhack`.


## How to use it
First, you'll need both [Docker](https://docs.docker.com/install/) and [docker-compose](https://docs.docker.com/compose/install/) installed.

Once you have it installed, you can either use `docker-compose`:
```
docker-compose up # Brings the container up
docker-compose down # Turns the container off
```

Or use the image as you like (`javierluna/ironhack-data:0.0.1` on [Docker Hub](https://hub.docker.com/r/javierluna/ironhack-data)).


