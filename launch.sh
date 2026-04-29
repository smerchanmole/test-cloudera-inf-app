#!/bin/bash
echo "🚀 Arrancando entorno desde GitHub en Cloudera Inference..."

# 1. Variables vitales para que Ubuntu y Python no se quejen
export PIP_BREAK_SYSTEM_PACKAGES=1
export PYTHONUNBUFFERED=1

# 2. Instalación en modo USUARIO (--user) para evitar el error de "Permission denied"
echo "📦 Instalando dependencias en la carpeta local del usuario..."
python3 -m pip install --user --no-cache-dir fastapi uvicorn

# 3. Detectar el puerto correcto (Inference a veces usa PORT en lugar de CDSW_APP_PORT)
APP_PORT="${PORT:-${CDSW_APP_PORT:-8080}}"
echo "🔥 Lanzando Uvicorn en el puerto ${APP_PORT}..."

# 4. Lanzar la aplicación invocando el módulo directamente
exec python3 -m uvicorn app:app --host 127.0.0.1 --port "${APP_PORT}"
