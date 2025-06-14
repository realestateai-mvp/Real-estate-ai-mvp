from fastapi import FastAPI

app = FastAPI()

@app.get("/")
def read_root():
    return {"message": "Real estate backend live"}
