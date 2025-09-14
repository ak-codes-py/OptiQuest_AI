# 🚀 OptiScout-Web

> **Advanced Options Research Platform** - AI-powered research agent that provides comprehensive options trading insights backed by real-time market data and authoritative web sources.

[![Next.js](https://img.shields.io/badge/Next.js-14-black?logo=next.js)](https://nextjs.org/)
[![FastAPI](https://img.shields.io/badge/FastAPI-latest-009688?logo=fastapi)](https://fastapi.tiangolo.com/)
[![Python](https://img.shields.io/badge/Python-3.11+-blue?logo=python)](https://python.org/)
[![TypeScript](https://img.shields.io/badge/TypeScript-5.0-blue?logo=typescript)](https://typescriptlang.org/)

## 🎯 Overview

OptiScout-Web is a sophisticated financial research platform designed for options traders, analysts, and finance professionals. It combines AI-powered analysis with real-time market data and comprehensive web research to deliver accurate, cited, and actionable insights on options trading strategies, market conditions, and risk management.

### ✨ Key Features

- **🔍 Intelligent Research**: Advanced web search with content extraction from authoritative financial sources
- **📊 Live Market Data**: Real-time price feeds and volatility indicators via Polygon.io integration
- **🤖 AI-Powered Analysis**: GPT-4 powered insights with beginner-friendly explanations
- **📝 Structured Responses**: Professional markdown format with citations and data tables
- **⚡ Real-Time Processing**: Fast, concurrent data fetching and analysis
- **🎨 Modern UI**: Responsive design with Fidelity-inspired professional styling

## 🏗️ Architecture

### Frontend Stack

- **Framework**: Next.js 14 with App Router
- **Language**: TypeScript 5.0+
- **Styling**: TailwindCSS with custom Fidelity design system
- **UI Components**: Custom component library with professional styling
- **State Management**: React hooks with optimistic updates

### Backend Stack

- **Framework**: FastAPI with async/await patterns
- **Language**: Python 3.11+
- **AI Integration**: OpenAI GPT-4 with optimized prompts
- **Web Search**: Tavily API for authoritative source discovery
- **Market Data**: Polygon.io integration for live quotes and historical data
- **Content Processing**: Advanced extraction with trafilatura and custom parsers

### Data Flow

```
User Query → Frontend → FastAPI Backend → AI Processing → Web Search + Live Data → Structured Response
```

## 🚀 Quick Start

### Prerequisites

- Python 3.11 or higher
- Node.js 18 or higher
- OpenAI API key
- Tavily API key
- (Optional) Polygon.io API key for live market data

### 1. Backend Setup

```bash
# Navigate to backend directory
cd backend

# Create virtual environment
python -m venv venv
source venv/bin/activate  # Windows: venv\Scripts\activate

# Install dependencies
pip install -r requirements.txt

# Configure environment
cp .env.example .env
# Edit .env with your API keys

# Start the server
uvicorn main:app --reload --host 0.0.0.0 --port 8000
```

### 2. Frontend Setup

```bash
# Navigate to frontend directory
cd frontend

# Install dependencies
npm install

# Start development server
npm run dev
```

### 3. Access the Application

- **Frontend**: [http://localhost:3000](http://localhost:3000)
- **Backend API**: [http://localhost:8000](http://localhost:8000)
- **API Documentation**: [http://localhost:8000/docs](http://localhost:8000/docs)

## ⚙️ Configuration

### Required Environment Variables

Create `backend/.env` with the following:

```env
# Core AI & Search APIs (Required)
OPENAI_API_KEY=your_openai_api_key_here
TAVILY_API_KEY=your_tavily_api_key_here

# Application Settings
ENVIRONMENT=development

# Live Market Data (Optional)
POLYGON_API_KEY=your_polygon_api_key_here
SUPABASE_FUNCTION_URL=your_supabase_function_url_here
```

### LLM Provider (Optional)

By default, the app uses OpenAI models. You can point to any OpenAI-compatible endpoint (e.g., xAI Grok) by setting these variables in `backend/.env`:

```env
# Use an OpenAI-compatible endpoint
OPENAI_BASE_URL=https://api.x.ai/v1
# Choose the model served by that endpoint
OPENAI_MODEL=grok-code-fast-1
```

The backend reads these at startup and will report the active model in `GET /status`.

### Optional Integrations

- **Polygon.io**: For real-time stock and options data
- **Custom Data Sources**: Extend with your own market data APIs

## 💡 Usage Examples

### Basic Options Research

```
Query: "Explain iron condor strategy for beginners"
Response: Comprehensive explanation with visual diagrams, risk profiles, and current market examples
```

### Market Analysis

```
Query: "What's the current implied volatility for SPY options?"
Response: Live IV data, historical context, and trading implications
```

### Strategy Evaluation

```
Query: "Covered call risks for dividend stocks"
Response: Detailed analysis with real examples and risk mitigation strategies
```

## 🎯 Target Audience

- **Options Traders**: Professional and retail traders seeking comprehensive research
- **Financial Analysts**: Research professionals requiring cited, authoritative sources
- **Educators**: Finance instructors teaching options trading concepts
- **Students**: Finance students learning about derivatives and risk management

## 🔧 Development

### Project Structure

```
optiscout-web/
├── backend/                 # FastAPI application
│   ├── main.py             # API entry point
│   ├── agent.py            # Core research agent
│   ├── web_search.py       # Web search and content extraction
│   ├── live_data.py        # Market data integration
│   └── schemas.py          # Data models and validation
├── frontend/               # Next.js application
│   ├── app/                # App router pages
│   ├── components/         # React components
│   └── lib/                # Utility functions
└── docs/                   # Documentation
```

### Running Tests

```bash
# Backend tests
cd backend
pytest

# Frontend tests
cd frontend
npm test
```

### Building for Production

```bash
# Backend
cd backend
pip install -r requirements.txt
gunicorn main:app -w 4 -k uvicorn.workers.UvicornWorker

# Frontend
cd frontend
npm run build
npm start
```

## 🔒 Security & Compliance

- **API Key Security**: Environment variable management with secure defaults
- **Rate Limiting**: Built-in request throttling for external APIs
- **CORS Configuration**: Secure cross-origin resource sharing
- **Input Validation**: Comprehensive request validation and sanitization

## 📊 Performance

- **Response Time**: < 3 seconds for complex research queries
- **Concurrent Users**: Supports 100+ simultaneous users
- **Caching**: Intelligent caching for frequently requested data
- **Scalability**: Horizontal scaling with Docker containers

## 🤝 Contributing

We welcome contributions! Please see our [Contributing Guidelines](CONTRIBUTING.md) for details.

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests
5. Submit a pull request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## ⚠️ Important Disclaimers

**Educational Use Only**: This platform is designed for research and educational purposes only. All content and analysis provided should not be construed as financial advice, investment recommendations, or trading signals.

**No Investment Advice**: The information generated by OptiScout-Web does not constitute professional financial advice. Users should conduct their own research and consult with qualified financial advisors before making investment decisions.

**Market Risk**: Options trading involves substantial risk and is not suitable for all investors. Past performance does not guarantee future results.

---

<div align="center">
  <p><strong>Built with ❤️ for the trading community</strong></p>
  <p>
    <a href="#top">Back to Top</a> •
    <a href="https://github.com/ak-pydev/OptiQuest_AI/issues">Report Bug</a> •
    <a href="https://github.com/ak-pydev/OptiQuest_AI/issues">Request Feature</a>
  </p>
</div>
