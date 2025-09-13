# OptiScout-Web

An options trading research agent that grounds every statement in recent, reputable web sources.

## Architecture

- **Frontend**: Next.js 14 (App Router) + TypeScript + TailwindCSS + shadcn/ui
- **Backend**: FastAPI + Python 3.11+ with Tavily web search
- **Features**:
  - Real-time web search and content extraction
  - Structured responses with citations
  - Options trading mechanics and strategy research
  - Interactive markdown rendering with JSON data visualization

## Quick Start

### Backend Setup

```bash
cd backend
python -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate
pip install -r requirements.txt
cp .env.example .env  # Add your API keys
uvicorn main:app --reload
```

### Frontend Setup

```bash
cd frontend
npm install
npm run dev
```

### Environment Variables

Create `backend/.env`:

```
OPENAI_API_KEY=your_openai_key
TAVILY_API_KEY=your_tavily_key
```

## Usage

1. Start both backend (port 8000) and frontend (port 3000)
2. Navigate to http://localhost:3000
3. Ask options trading research questions
4. Get grounded, cited responses with structured data

## Example Queries

- "What are the current implied volatility levels for SPY options?"
- "Explain covered call strategy mechanics and risk profile"
- "What are the OCC margin requirements for short puts?"
- "When is the next FOMC meeting and typical options impact?"

## Features

- ✅ Web search integration with Tavily
- ✅ Content extraction and citation
- ✅ Structured JSON responses
- ✅ Markdown rendering with syntax highlighting
- ✅ Options strategy explanations
- ✅ Risk and caveat analysis
- ✅ Primary source prioritization (OCC, CBOE, exchanges)

## Not Financial Advice

This tool is for research and education only. All outputs include appropriate disclaimers.
# OptiQuest_AI
