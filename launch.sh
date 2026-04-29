#!/bin/bash

echo "---------------------------------------"
echo "🚀 Arrancando Test de Vida en Cloudera"
echo "---------------------------------------"

# 1. Forzar logs en tiempo real
export PYTHONUNBUFFERED=1

# 2. Asegurarnos de que las dependencias básicas están (por si no usas el Docker que creamos)
# Si usas tu imagen personalizada, puedes comentar estas líneas para ir más rápido
pip install --no-cache-dir fastapi uvicorn

# 3. Lanzar la aplicación
# Usamos 'exec' para que Python tome el control del proceso del contenedor
echo "Lanzando Uvicorn en el puerto ${CDSW_APP_PORT}..."
exec python3 app.py
