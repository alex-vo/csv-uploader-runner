# CSV Uploader

A simple web application for uploading and processing CSV files.  
The project consists of two parts:
- **Frontend:** [`csv-uploader-ui`](https://github.com/alex-vo/csv-uploader-ui)
- **Backend:** [`csv-uploader-backend`](https://github.com/alex-vo/csv-uploader-backend)

---

## Prerequisites

Before running the project locally, make sure you have git, docker and docker-compose installed.

---

## Running Locally

To set up and run the project locally:

```bash
git clone https://github.com/alex-vo/csv-uploader-ui.git
git clone https://github.com/alex-vo/csv-uploader-backend.git
docker-compose up
```

Example CSV files are located in [`file-samples`](./file-samples).

---
## Demo
A small demo of this project can be found at https://www.youtube.com/watch?v=aWLSWaaUAW0 

---

## Design choices
### Modular Monolith ("Modulith")
Given limited time, instead of building two fully separate microservices, this solution is implemented as a modular monolith.
The application is divided into two logical modules:

<ul>
  <li>web – exposes an API endpoint to accept CSV uploads.</li>
  <li>csv-processor – subscribes to upload events and handles parsing and simulated storage.</li>
</ul>

This approach keeps the codebase simple while maintaining clear boundaries between components. If needed, these modules can easily be extracted into independent microservices later without major refactoring.

### Pub/Sub Implementation

For the Pub/Sub mechanism, Kotlin Coroutines Channels approach was chosen. This provides a lightweight, in-memory event bus that fits well within the limited time scope of the assignment. 

---
## Tests
Automated tests were omitted due to limited time for this small technical assignment. However, in a production environment, comprehensive test coverage is absolutely crucial to ensure reliability and maintainability.
