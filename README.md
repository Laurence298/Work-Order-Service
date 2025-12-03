# Work Order Service

A multi-tenant Field Service Management (FSM) platform for managing service requests, employees, and customers.

## � Project Overview

This application was originally built to streamline operations for a landscaping business, helping them transition from manual tracking to a digital system. It serves as a comprehensive tool for any service-based company that needs to manage:

*   **Service Catalogs**: Defining services with multiple pricing tiers (e.g., Bronze/Silver/Gold landscaping packages).
*   **Workforce Scheduling**: Assigning crews to specific jobs and tracking their availability.
*   **Customer Requests**: Managing the lifecycle of a work order from initial request to final completion.

## �🚀 Quick Start

**This project runs exclusively with Docker.**

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd Work-Order-Service
   ```

2. **Start the application**
   ```bash
   docker compose up --watch
   ```

3. **Access the app**
   Open [http://localhost:3000](http://localhost:3000)

   *Database and pgAdmin (http://localhost:8080) are automatically provisioned.*

## ✨ Core Features

*   **Multi-Tenancy**: Isolated environments for different companies.
*   **Service Lifecycle**: Manage requests from intake to completion.
*   **Dynamic Pricing**: Configurable service tiers and catalogs.
*   **Resource Management**: Employee rostering and assignment tracking.

## 🛠 Tech Stack

*   **Ruby on Rails 8** (Hotwire, Solid Queue/Cache/Cable)
*   **PostgreSQL**
*   **Tailwind CSS**
*   **Docker**
