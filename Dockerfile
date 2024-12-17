FROM tensorflow/tensorflow:1.2.1 as dev_tf_121

LABEL org.opencontainers.image.authors="Stefan Grandl"

# update packages, start virtual environment
RUN python -m pip install --trusted-host pypi.org --trusted-host files.pythonhosted.org --upgrade pip setuptools
RUN apt-get update && apt-get install -y apt-utils --no-install-recommends libgl1 \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# COPY . .

COPY requirements.txt .
RUN pip install -r requirements.txt


#---------------------------------------------------------------------------
#----------- NEW IMAGE: NEW TENSORFLOW -----------------------
#---------------------------------------------------------------------------
FROM tensorflow/tensorflow:2.13.0-gpu as dev_tf_2130

LABEL org.opencontainers.image.authors="Stefan Grandl"

# update packages, start virtual environment
RUN python -m pip install --trusted-host pypi.org --trusted-host files.pythonhosted.org --upgrade pip setuptools
RUN apt-get update && apt-get install -y apt-utils --no-install-recommends libgl1 \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# COPY . .

COPY requirements.txt .
RUN pip install -r requirements.txt
