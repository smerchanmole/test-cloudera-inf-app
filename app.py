from fastapi import FastAPI, Request

app = FastAPI()

# Cloudera Inference hace "pings" a la ruta raíz (/) para comprobar que la app no ha muerto
@app.get("/")
@app.get("/alive")
async def alive(request: Request):
    # Capturamos el token para verificar que el proxy de Cloudera lo deja pasar
    auth_header = request.headers.get("Authorization", "Sin Token")
    print(f"DEBUG - Header recibido: {auth_header}")
    
    return {
        "status": "estoy vivo en Inference", 
        "token_recibido": auth_header
    }
