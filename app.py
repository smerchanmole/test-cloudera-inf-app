from fastapi import FastAPI, Request
import os
import uvicorn

app = FastAPI(title="Cloudera Inference Token Test")

@app.get("/alive")
async def alive(request: Request):
    # Esto te permitirá ver en los logs de Cloudera si el token está llegando
    auth_header = request.headers.get("Authorization")
    print(f"DEBUG: Petición recibida. Authorization Header: {auth_header}")
    
    return {
        "status": "estoy vivo",
        "message": "Comunicación exitosa con Cloudera AI Inference",
        "port_used": os.environ.get("CDSW_APP_PORT", "8100")
    }

if __name__ == "__main__":
    # Obtenemos el puerto que Cloudera nos asigna dinámicamente
    port = int(os.environ.get("CDSW_APP_PORT", "8100"))
    # Importante: host 127.0.0.1 para que el proxy de Cloudera pueda entrar
    uvicorn.run(app, host="127.0.0.1", port=port)
