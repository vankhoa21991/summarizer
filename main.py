from fastapi import FastAPI
from configs.conf import HUGGINGFACE_MODEL_ID, MODEL_DIR
from transformers import pipeline

app = FastAPI()

summarizer = pipeline("summarization", model=MODEL_DIR)


@app.post("/summarize")
def summarize(text: str):
    summary = summarizer(text, max_length=150, min_length=40)
    return {"summary": summary}
