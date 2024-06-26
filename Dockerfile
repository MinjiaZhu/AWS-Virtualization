FROM python:3.6

# Creating Application Source Code Directory
RUN mkdir /src

# Setting Home Directory for containers
WORKDIR /src

# Installing python dependencies
# copy current files to src folder (requirements.txt and classify.py)
COPY requirements.txt classify.py /src/

# install dependencies mentioned in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Application Environment variables. 
# These variables will be used when you run the image. 
# You will also need to pass corresponding DATASET and TYPE variables from the job yaml files of both free-service and default types of jobs.
ENV APP_ENV development
ENV DATASET mnist
ENV TYPE ff

# Exposing Ports
EXPOSE 5035

# Setting Persistent data
VOLUME ["/app-data"]

# Running Python Application (classify.py)
CMD ["python", "classify.py"]
