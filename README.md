# Work Order Service

A multi-tenant Field Service Management (FSM) platform prototype designed to evaluate custom software solutions for small businesses.

## 📋 Project Context & Overview

**This project was developed as a technical feasibility study for a local landscaping company.**

The primary goal was to determine if building a custom Work Order Management application was a viable alternative to off-the-shelf software. This prototype allowed stakeholders to visualize how a bespoke system could handle their specific operational needs, such as:

* **Custom Service Catalogs**: Defining complex service structures with multiple pricing tiers (e.g., Bronze/Silver/Gold landscaping packages).
* **Feasibility Testing**: Assessing the complexity of migrating from manual tracking to a digital workflow.
* **Business Logic Validation**: Proving that a custom tool could better manage crew scheduling and customer lifecycles than generic FSM tools.

## 🚀 Quick Start

**This project runs exclusively with Docker.**

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd Work-Order-Service

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
