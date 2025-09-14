#!/bin/bash

# Start script for OptiScout-Web

echo "🚀 Starting OptiScout-Web..."

# Check if .env exists
if [ ! -f backend/.env ]; then
    echo "❌ backend/.env not found. Please run ./setup.sh first"
    exit 1
fi

# Function to check if port is in use
check_port() {
    if lsof -Pi :$1 -sTCP:LISTEN -t >/dev/null ; then
        echo "⚠️  Port $1 is already in use"
        return 1
    fi
    return 0
}

# Check if required ports are available
check_port 8000 || echo "Backend port 8000 is in use"
check_port 3000 || echo "Frontend port 3000 is in use"

echo "🔧 Starting backend server..."
cd backend
source venv/bin/activate
uvicorn main:app --reload --host 0.0.0.0 --port 8000 &
BACKEND_PID=$!

echo "🔧 Starting frontend server..."
cd ../frontend
npm run dev &
FRONTEND_PID=$!

echo "✅ Services started!"
echo "📱 Frontend: http://localhost:3000"
echo "🔧 Backend API: http://localhost:8000"
echo "📊 API Docs: http://localhost:8000/docs"
echo ""
echo "Press Ctrl+C to stop all services"

# Wait for interrupt
trap 'echo "🛑 Stopping services..."; kill $BACKEND_PID $FRONTEND_PID; exit' INT
wait