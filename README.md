# Instagram DM Customer Support – Agentic AI Prototype

## Project Overview

An AI-powered customer support automation prototype designed for an Instagram-based retail business.

The project uses n8n, PostgreSQL, Python, and a Groq-hosted Large Language Model (LLM) to interpret customer enquiries, retrieve relevant business information, and generate automated responses.

**Note:** This is a locally developed and tested prototype using simulated Instagram messages and synthetic retail data. Live Instagram API integration is not included.

## Tools & Technologies

- **n8n:** Workflow orchestration and automation
- **PostgreSQL:** Relational database for retail business data
- **SQL:** Product, inventory, and order information retrieval
- **Python:** Data preparation and testing
- **Groq LLM:** Customer intent classification and response generation

## Business Objective

To reduce repetitive customer-support tasks for online retailers by automating common Instagram DM enquiries while retaining human escalation for cases requiring manual assistance.

## Key Features

1. **Product Information:** Retrieve product details from the database.
2. **Inventory Availability:** Check product variants and stock availability.
3. **Order Tracking:** Retrieve eligible order-status information.
4. **Shipping Enquiries:** Respond to shipping-related questions.
5. **Human Support:** Route enquiries requiring manual assistance.

## Dataset

Synthetic retail data was prepared for development and testing, including:

- 200 customers
- 100 products
- 1,000 product variants
- Customer orders and order items
- 600 sample customer messages across five intent categories

## System Workflow

1. Receive a simulated Instagram customer message.
2. Use an LLM to identify the customer's intent.
3. Route the enquiry through the appropriate n8n workflow.
4. Query PostgreSQL for relevant product, inventory, or order information.
5. Apply business rules and prepare the response.
6. Return a simulated customer-facing reply or escalate to human support.

## Business Rules

- Customers are identified using `platform_user_id`.
- Order-status responses exclude delivered orders.
- Low-stock conditions are flagged when stock falls below five units.
- Unsupported or sensitive enquiries can be routed for human support.

## Repository Structure

- `workflows/` – Exported n8n workflow files
- `database/` – PostgreSQL schema and sample data
- `python/` – Data preparation and supporting scripts
- `screenshots/` – Workflow diagrams and testing results

## Project Outcomes

- Developed a local AI-assisted customer support workflow.
- Integrated LLM-based intent identification with database-driven responses.
- Applied SQL queries and business logic to retail support scenarios.
- Tested automated responses using simulated customer enquiries.
- Demonstrated practical applications of workflow automation and LLM integration.

## Author

**Komal Rajwani**

Data Analyst | SQL | Python | PostgreSQL | n8n | Agentic AI
