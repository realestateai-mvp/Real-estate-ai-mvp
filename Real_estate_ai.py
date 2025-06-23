from fastapi import FastAPI
app = FastAPI()

@app.get("/")
def root():
    return {"message": "Real estate backend live"}
