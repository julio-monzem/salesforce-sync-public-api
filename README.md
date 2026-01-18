# Salesforce ↔ Public APIs REST Sync

This project demonstrates **real-world Salesforce integrations with public REST APIs**, following **enterprise-grade architecture, security best practices, and full test coverage**.

It showcases how Salesforce can securely consume external APIs, persist data, automate processes, and expose information through Lightning Web Components (LWC).

## Implemented Integrations

### ViaCEP (Brazilian Address API)
- Public REST API (no authentication)
- Address lookup by CEP (ZIP Code)
- Data persisted in Salesforce custom objects
- Exposed via LWC search interface

### OpenWeather API
- Authenticated REST API (API Key)
- Current weather data by city
- Scheduled daily synchronization
- Historical weather records stored in Salesforce
- Fully testable using HttpCalloutMock
