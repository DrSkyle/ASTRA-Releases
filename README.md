# ASTRA: The Context Protocol (God Tier)

ASTRA is the **Vestibular System for AI Agents**.
It is a Model Context Protocol (MCP) Server that provides mathematical "Constraints" to prevent Agents from hallucinating or breaking critical infrastructure.

## Only for the "God Tier"
This is not for consumers. This is for Architects.

## The Protocol (MCP)
ASTRA listens on Stdio. Connect it to your AI Agent (Cursor/Windsurf).

**Request:**
```bash
echo "src/User.ts" | ./astra serve
```

**Response (Context Vector):**
```json
{
  "uri": "src/User.ts",
  "topology": {
    "blast_radius": 412,
    "critical_dependents": ["Payment.ts"]
  },
  "volatility": {
    "panic_ratio": 0.45,
    "churn_rate": "HIGH"
  },
  "constraints": [
    "IMMUTABLE_INTERFACE",
    "HIGH_RISK_ZONE"
  ]
}
```

## The Engines
1.  **Spatial Engine**: Spectral Topology (Centrality, Blast Radius).
2.  **Time Engine**: Stochastic Volatility (Time-Decayed Probability).
3.  **Complexity Engine**: Information Entropy (Hallucination Risk).

## Installation
```bash
curl -fsSL https://raw.githubusercontent.com/DrSkyle/ASTRA-Releases/main/install.sh | bash
```

## Usage
Start the server:
```bash
astra serve
```
