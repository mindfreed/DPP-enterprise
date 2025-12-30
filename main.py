import uvicorn
from dpp_final import app  # Your DPP code

if __name__ == "__main__":
    uvicorn.run(app, host="0.0.0.0", port=8080)
