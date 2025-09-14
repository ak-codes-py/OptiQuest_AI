#!/bin/bash

# Setup script for OptiScout-Web

echo "🚀 Setting up OptiScout-Web..."

# Check if required tools are installed
command -v python3 >/dev/null 2>&1 || { echo "❌ Python 3 is required but not installed. Aborting." >&2; exit 1; }
command -v node >/dev/null 2>&1 || { echo "❌ Node.js is required but not installed. Aborting." >&2; exit 1; }
command -v npm >/dev/null 2>&1 || { echo "❌ npm is required but not installed. Aborting." >&2; exit 1; }

echo "✅ Required tools found"

# Setup backend
echo "📦 Setting up Python backend..."
cd backend

# Create virtual environment
python3 -m venv venv
source venv/bin/activate

# Install Python dependencies
pip install -r requirements.txt

echo "✅ Backend setup complete"

# Setup frontend
echo "📦 Setting up Next.js frontend..."
cd ../frontend

# Install Node.js dependencies
npm install

echo "✅ Frontend setup complete"

# Create environment file
cd ..
if [ ! -f backend/.env ]; then
    echo "📝 Creating environment configuration..."
    cp backend/.env.example backend/.env
    echo "⚠️  Please edit backend/.env with your API keys:"
    echo "   - OPENAI_API_KEY=your_openai_key"
    echo "   - TAVILY_API_KEY=your_tavily_key"
fi

echo ""
echo "🎉 Setup complete!"
echo ""
echo "To start the application:"
echo "1. Edit backend/.env with your API keys"
echo "2. Run: ./start.sh"
echo ""
echo "Or start services individually:"
echo "Backend:  cd backend && source venv/bin/activate && uvicorn main:app --reload"
echo "Frontend: cd frontend && npm run dev"