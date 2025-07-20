# main.py
from fastapi import FastAPI
from pydantic import BaseModel
import weasyprint

class Payload(BaseModel):
    html: str
    options: dict

app = FastAPI()

@app.post("/generate-pdf")
async def generate_pdf(payload: Payload):
    # production: uploader sur S3 et renvoyer l'URL
    pdf_bytes = weasyprint.HTML(string=payload.html).write_pdf()
    # Ici on simule avec un URL fictif
    pdf_url = f"https://example.com/{payload.options.get('format')}-{hash(payload.html)}.pdf"
    return {"pdf_url": pdf_url}
