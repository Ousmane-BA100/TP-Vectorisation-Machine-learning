# Utiliser une image Python avec Jupyter préinstallé
FROM jupyter/scipy-notebook:latest

# Définir le dossier de travail
WORKDIR /home/jovyan/work

# Copier les fichiers du projet dans le conteneur
COPY train.csv Vectorisation.ipynb requirements.txt ./

# Installer les bibliothèques nécessaires
RUN pip install -r requirements.txt

# Télécharger les ressources NLTK (punkt, stopwords, wordnet)
RUN python -c "import nltk; nltk.download('punkt'); nltk.download('stopwords'); nltk.download('wordnet')"

# Exposer le port de Jupyter
EXPOSE 8888

# Lancer Jupyter Notebook
CMD ["start-notebook.sh", "--NotebookApp.token=''"]
