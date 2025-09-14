# Development Guide

## Environment Setup

### API Keys Required

- **OpenAI API Key**: For GPT-4 powered research synthesis
- **Tavily API Key**: For web search capabilities

### Environment Variables

Create `backend/.env`:

```bash
OPENAI_API_KEY=sk-...
TAVILY_API_KEY=tvly-...
ENVIRONMENT=development
```

## Development Commands

### Quick Start

```bash
./setup.sh    # One-time setup
./start.sh    # Start both services
```

### Manual Start

```bash
# Backend
cd backend
source venv/bin/activate
uvicorn main:app --reload

# Frontend (separate terminal)
cd frontend
npm run dev
```

### Docker Development

```bash
docker-compose -f docker-compose.dev.yml up
```

## Architecture Overview

### Backend (FastAPI)

- **FastAPI** web framework with auto-generated OpenAPI docs
- **Tavily** for web search and content extraction
- **OpenAI GPT-4** for research synthesis and markdown generation
- **Pydantic** for request/response validation

### Frontend (Next.js 14)

- **App Router** for modern React development
- **TailwindCSS** for styling
- **TypeScript** for type safety
- Custom markdown renderer with citation support

### Key Files

```
backend/
├── main.py           # FastAPI app and routes
├── agent.py          # OptiScout research agent
├── web_search.py     # Tavily integration
├── schemas.py        # Pydantic models
└── requirements.txt

frontend/
├── app/
│   ├── layout.tsx    # Root layout
│   └── page.tsx      # Main page
├── components/
│   ├── chat-interface.tsx      # Main chat UI
│   ├── markdown-renderer.tsx   # Custom markdown display
│   └── ui/
└── lib/
    └── api.ts        # Backend API client
```

## Research Agent Features

### Web Search

- Prioritizes authoritative sources (OCC, CBOE, SEC, exchanges)
- Configurable recency filter (default: 30 days)
- Extracts clean content using trafilatura

### Response Generation

- GPT-4 synthesis with source grounding
- Structured markdown with citations
- JSON metadata for frontend rendering
- Risk disclaimers on all responses

### Frontend Rendering

- Real-time chat interface
- Custom markdown parser with citation highlighting
- Structured data visualization (tables, entities, highlights)
- Example queries for user guidance

## API Endpoints

### POST /research

```json
{
  "query": "What are SPY options implied volatility levels?",
  "max_sources": 4,
  "recency_days": 30
}
```

Returns structured response with markdown content and metadata.

### GET /health

Health check endpoint

### GET /status

Configuration status (API keys, environment)

## Customization

### Adding New Sources

Edit `web_search.py` `include_domains` list:

```python
"include_domains": [
    "occ.thinkorswim.com",
    "cboe.com",
    "your-custom-domain.com"  # Add here
]
```

### Response Format

Modify `agent.py` system prompt to change output structure.

### Frontend Styling

All styles use TailwindCSS classes. Customize in component files.

## Troubleshooting

### Common Issues

1. **API Key Errors**: Verify keys in `.env` file
2. **Port Conflicts**: Check if 3000/8000 are available
3. **Dependencies**: Run `./setup.sh` to reinstall

### Debug Mode

```bash
# Backend with debug logs
PYTHONPATH=. python -m uvicorn main:app --reload --log-level debug

# Frontend with verbose output
npm run dev -- --verbose
```

### Testing API

```bash
curl -X POST http://localhost:8000/research \
  -H "Content-Type: application/json" \
  -d '{"query": "test query"}'
```
