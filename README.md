# Social Media Analysis for Situation Awareness during Crises (SMASAC) Tutorial
![SMASAC](header.png "SMASAC")

[![Binder](https://mybinder.org/badge.svg)](https://mybinder.org/v2/gh/evhart/smasac-tutorial/master)

Recent disasters and crises (such as Hurricanes Irma, Harvey and Maria) have affected many regions of the globe, causing damage in the billions of dollars and hundreds of lives. Communication technologies, such as social media, can play an important role in preventing some of this damage by helping first responders and humanitarian organizations mobilize resources effectively. Social media has emerged as a powerful tool for the crisis informatics community because it serves as a field-level, rich source of real-time information that would otherwise not be available.

Unfortunately, gaining situation awareness from social media content using semi-automatic methods is a difficult task due to the velocity, volume and noise associated with such data. In this tutorial, we will cover the primary steps that can be used for analysing crisis-related social media content in real-world crisis situations.

We will present a situation-awareness data analysis pipeline that focuses on some of the challenges that occur when dealing with social media, including steps ranging from data collection and filtering to event extraction and visualization. The methods, tools and lessons covered will draw on our real-world experience in crisis informatics research, and will include interactions and code demonstrations.

## Organisers:
* Grégoire Burel, KMi, The Open University, UK ([@evhart](https://twitter.com/evhart))
* Mayank Kejriwal, University of Southern California, USA ([@kejriwal_mayank](https://twitter.com/kejriwal_mayank))
* Prashant Khare, KMi, The Open University, UK ([@prash_khare](https://twitter.com/prash_khare))

## Agenda and Slides
* Slides Part 1: Introduction: [pptx](slides/pptx/1-introduction.pptx) / [pdf](slides/pdf/1-introduction.pdf)
* Slides Part 2: Crisis Data Collection and Filtering: [pptx](slides/pptx/2-data-collection.pptx) / [pdf](slides/pdf/2-data-collection.pdf)
* Slides Part 3: Concepts and Entities Extraction: [pptx](slides/pptx/3-entity-extraction.pptx) / [pdf](slides/pdf/3-entity-extraction.pdf)
* Slides Part 4: Classification and Categorisation: [pptx](slides/pptx/4-classification.pptx) / [pdf](slides/pdf/4-classification.pdf)
* Slides Part 5: Event Extraction: [pptx](slides/pptx/5-event-extraction.pptx) / [pdf](slides/pdf/5-event-extraction.pdf)
* Slides Part 6: Visualisation: [pptx](slides/pptx/6-visualisation.pptx) / [pdf](slides/pdf/6-visualisation.pdf)

## References
The references of the important papers used in the slides and relevant to the tutorial are available as separate bib files (and as markdown for each presentation):
* References Part 1: Introduction: [bib](references/bib/1-introduction.bib) / [md](references/md/1-introduction.md)
* References Part 2: Crisis Data Collection and Filtering: [bib](references/bib/2-data-collection.bib) / [md](references/md/2-data-collection.md)
* References Part 3: Concepts and Entities Extraction: [bib](references/bib/3-entity-extraction.bib) / [md](references/md/3-entity-extraction.md)
* References Part 4: Classification and Categorisation: [bib](references/bib/4-classification.bib) / [md](references/md/4-classification.md)
* References Part 5: Event Extraction: [bib](references/bib/5-event-extraction.bib) / [md](references/md/5-event-extraction.md)
* References Part 6: Visualisation: [bib](references/bib/6-visualisation.bib) / [md](references/md/6-visualisation.md)



## Source Code and Notebooks
The tutorial hands-on sessions are mostly coded in Python and provided as Jupyter notebooks. The notebooks can be locally installed or visualsised online.

There is different methods for runing and studying the notebooks:
1. Interactive notebook environment on mybinder
2. Rendered HTML notebooks on nbviewer (non-interactive)
3. Interactive local notebook environment:
    * Docker build or DockerHub (see below)
    * Native installation

## Notebooks
* Notebooks: Data Collection: [ipynb](notebooks/2-data-collection.ipynb) / [nbviewer](http://nbviewer.jupyter.org/github/evhart/smasac-tutorial/blob/master/notebooks/2-data-collection.ipynb) / [jupyter](http://127.0.0.1:8888/notebooks/2-data-collection.ipynb)
* Notebooks: Entity Extraction: 
    * fastText Embeddings: [ipynb](notebooks/3-1-entity-extraction-fasttext-embedding.ipynb) / [nbviewer](http://nbviewer.jupyter.org/github/evhart/smasac-tutorial/blob/master/notebooks/3-1-entity-extraction-fasttext-embedding.ipynb) / [jupyter](http://127.0.0.1:8888/notebooks/3-1-entity-extraction-fasttext-embedding.ipynb)
    * Hashtag Visualisation: [ipynb](notebooks/3-2-entity-extraction-hashtag-visualization.ipynb) / [nbviewer](http://nbviewer.jupyter.org/github/evhart/smasac-tutorial/blob/master/notebooks/3-2-entity-extraction-hashtag-visualization.ipynb) / [jupyter](http://127.0.0.1:8888/notebooks/3-2-entity-extraction-hashtag-visualization.ipynb)
    * NER with Displacy: [ipynb](notebooks/3-3-entity-extraction-NER-displacy.ipynb) / [nbviewer](http://nbviewer.jupyter.org/github/evhart/smasac-tutorial/blob/master/notebooks/3-3-entity-extraction-NER-displacy.ipynb) / [jupyter](http://127.0.0.1:8888/notebooks/3-3-entity-extraction-NER-displacy.ipynb) 
    * Twitter NER: [ipynb](notebooks/3-4-entity-extraction-twitter-NER.ipynb) / [nbviewer](http://nbviewer.jupyter.org/github/evhart/smasac-tutorial/blob/master/notebooks/3-4-entity-extraction-twitter-NER.ipynb) / [jupyter](http://127.0.0.1:8888/notebooks/3-4-entity-extraction-twitter-NER.ipynb)
* Notebooks: Classification: [ipynb](notebooks/4-classification.ipynb) / [nbviewer](http://nbviewer.jupyter.org/github/evhart/smasac-tutorial/blob/master/notebooks/4-classification.ipynb) / [jupyter](http://127.0.0.1:8888/notebooks/4-classification.ipynb)


## Running and Installing the Notebooks
You can either run the tutorial using docker or installing all the required software manually. It is recommanded to use docker.


## Installation
You can either install the notebooks and the code using [docker](https://docker.com/) or run the code natively.

### Docker Installation (Recommended)
The [docker](https://docker.com/) installation is the recommended approach as it is more likely to work without any configuration issues.

#### Pull or Build Image
You can either pull the image directly from [Docker Hub](https://hub.docker.com) or build it from the source.

For installing the image from Docker Hub, you need to execute the following command:
```sh
docker pull evhart/smasac-tutorial
```

If you prefer you can clone this git repository and then build the image from the source using the following command:
```sh
docker build -t evhart/smasac-tutorial:latest .
```

#### Run Docker Image and Start Jupyter 
The Jupyter server can be started by starting the container using the following command:
```sh
docker run -it -p 8888:8888  -p 5000:5000 --name smasac-tutorial evhart/smasac-tutorial:latest
```

Then, the Jupyter server should start and output the URI that needs to be used for connecting to the server. For example:
```
Copy/paste this URL into your browser when you connect for the first time,
    to login with a token:
        http://localhost:8888/?token=<SOME_TOKEN>
```

Simply copy the URI from your terminal into your web browser for accessing the Jupyter server.


### Native installation
If you need to edit the notebooks directly, edit them or do not have Docker installed, you can configure the tutorial directly on your machine. 

#### Requirements, Virtual Environment and Configuration
The code used for the tutorial requires Python 3 (tested on Python 3.5 and 3.7) and Jupyter. The different libraries used for the tutorial are listed in *requirements.txt* (You can install them using pip3).

There is some potential installation issues when using pip v10 so we recommand to use pip 9.x and have git and cython installed as well as a c++11 compliler.

Geopandas also requires some additional dependecies. Please check [geopandas' website](http://geopandas.org/).

Before starting the Jupyter server and installing the required libraries, it is recommended to create a virtual environment using venv.


Create a virtual environment for the tutorial in the current directory (you may need to install venv: e.g., apt-get install python3-venv):
```sh
python3 -m venv smasac-env
```

And, activate the environemnt:
```sh
source smasac-env/bin/activate
```

Finally install all the required libraries:
```sh
pip install -r requirements.txt
```

You will also need to activate the Jupyter widgets:
```sh
jupyter nbextension enable --py widgetsnbextension
```

#### Starting Jupyter
After completing the previous stesps, you can start the Jupyter notebook using the following command:
```sh
jupyter notebook
```

Then, the Jupyter server should start and output the URI that needs to be used for connecting to the server. For example:
```
Copy/paste this URL into your browser when you connect for the first time,
    to login with a token:
        http://localhost:8888/?token=<SOME_TOKEN>
```

Simply copy the URI from your terminal into your web browser for accessing the Jupyter server.
## Acknowledgment
This tutorial has received support from the European Union's Horizon 2020 research and innovation programme under grant agreement No 687847 (COMRADES).
