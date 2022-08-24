from flask import Flask, request
import requests
import json 
import numpy as np
from transformers import AutoTokenizer, AutoModelForSequenceClassification, AutoModel
import torch
import pickle

tokenizer_rating = AutoTokenizer.from_pretrained('nlptown/bert-base-multilingual-uncased-sentiment')
model_rating = AutoModelForSequenceClassification.from_pretrained('nlptown/bert-base-multilingual-uncased-sentiment')

tokenizer = AutoTokenizer.from_pretrained("distilbert-base-uncased")


def mean_pooling(model_output, attention_mask):
    token_embeddings = model_output[0] #First element of model_output contains all token embeddings
    input_mask_expanded = attention_mask.unsqueeze(-1).expand(token_embeddings.size()).float()
    return torch.sum(token_embeddings * input_mask_expanded, 1) / torch.clamp(input_mask_expanded.sum(1), min=1e-9)
def process(sentence, model):
    X = tokenizer(sentence, padding=True, max_length = 512, truncation=True, return_tensors='pt')
    result_model = mean_pooling(model(**X), X['attention_mask'])[0].detach().numpy()
    return result_model
def sentiment_score(review):
    tokens = tokenizer_rating.encode(review, return_tensors='pt')
    result = model_rating(tokens)
    return int(torch.argmax(result.logits))+1


app = Flask(__name__)

# pkl_model = pickle.load(open('pkl_model.pkl',"rb"))

# @app.route('/predict', methods=['POST'])

# def predict():
#     model = AutoModel.from_pretrained("distilbert-base-uncased")
#     text = request.json
#     text = text["text"]
#     rating = sentiment_scor"e(text)
#     processing = process(text, model)
#     prediction = pkl_model.predict(processing.reshape(1,-1))
#     return '{} {}'.format(rating,prediction)

@app.route('/flask', methods=['GET'])

def index():
    return "Flask server"


if __name__ == '__main__':
    app.run(port=3000, debug=True)
