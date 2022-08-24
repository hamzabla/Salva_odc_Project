from flask import Flask, request
import requests
import json 
import numpy as np
from transformers import AutoTokenizer, AutoModelForSequenceClassification
import torch
tokenizer = AutoTokenizer.from_pretrained('nlptown/bert-base-multilingual-uncased-sentiment')

model = AutoModelForSequenceClassification.from_pretrained('nlptown/bert-base-multilingual-uncased-sentiment')

def sentiment_score(review):
    tokens = tokenizer.encode(review, return_tensors='pt')
    result = model(tokens)
    return int(torch.argmax(result.logits))+1


app = Flask(__name__)


@app.route('/predict', methods=['POST'])

def predict():
    text = request.json
    text = text["text"]
    prediction = sentiment_score(text)
    return str(prediction)


if __name__ == '__main__':
    app.run(debug=True)
