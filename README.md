# Bidirectional Sync: Salesforce and Supabase

## Overview

This project contains a Mule application designed to synchronize data between Salesforce and a Supabase database. The application supports bidirectional synchronization, ensuring that data changes in either Salesforce or Supabase are reflected in the other system.

## Project Structure

The project is organized into the following main components:

### 1. Salesforce Connector

The Salesforce connector facilitates interactions with Salesforce's custom objects. This includes retrieving, updating, and creating records in Salesforce.

### 2. Supabase Connector

The Supabase connector enables operations on the Supabase database. This includes retrieving, updating, and creating records in the Supabase database.

### 3. Sync Flows

The sync flows handle the logic for bidirectional synchronization. These flows listen for changes in either Salesforce or Supabase and propagate those changes to the other system.

## Setup

### Prerequisites

- Java JDK 8 or later
- Maven
- Mule Runtime
- Anypoint Studio
- Supabase account
- Salesforce account with custom objects

### Installation

1. **Clone the Repository:**

   ```bash
   git clone <repository-url>
   cd <repository-directory>
   ```

2. **Build the Project Using Maven:**

   ```bash
   mvn clean install
   ```

3. **Configure Salesforce and Supabase:**

   **Salesforce:**

   - **Create a Connected App:**
     - Log in to Salesforce.
     - Go to `Setup` > `App Manager` > `New Connected App`.
     - Fill in the required fields. For API access, ensure that you enable OAuth settings and select the necessary OAuth scopes.
     - Save the connected app and note the `Consumer Key` and `Consumer Secret`.

   - **Obtain Access Token:**
     - Use the `Consumer Key` and `Consumer Secret` to obtain an access token. You can use tools like Postman to obtain this token via the OAuth 2.0 flow.

   - **Configure the Salesforce Connector in MuleSoft:**
     - Open Anypoint Studio.
     - Go to the `Global Elements` tab.
     - Add a new `Salesforce` configuration with the obtained `Consumer Key`, `Consumer Secret`, and `Access Token`.

   **Supabase:**

   - **Create a Supabase Account and Database:**
     - Go to [Supabase](https://supabase.com/).
     - Sign up for an account and create a new project.
     - Set up your database schema as required.

   - **Obtain Supabase URL and API Key:**
     - Go to the `Settings` > `API` section of your Supabase project.
     - Note the `Supabase URL` and `API Key`.

   - **Configure the Supabase Connector in MuleSoft:**
     - Open Anypoint Studio.
     - Go to the `Global Elements` tab.
     - Add a new `Supabase` configuration with the obtained `Supabase URL` and `API Key`.

4. **Open the Project in Anypoint Studio (Optional):**

   - Open Anypoint Studio.
   - Import the project as an existing Mule project by selecting `File` > `Import` > `Existing Mule Project`.

## Deployment

### Local Deployment

1. **Ensure Mule Runtime is Installed and Configured:**
   - Download and install Mule Runtime from the [MuleSoft website](https://www.mulesoft.com/platform/mule-esb).

2. **Deploy the Application Using Anypoint Studio:**
   - Right-click on the project in Anypoint Studio.
   - Select `Run As` > `Mule Application`.

   **Alternatively, deploy via command line:**

   ```bash
   mule deploy
   ```

### CloudHub Deployment

1. **Package the Application Using Maven:**

   ```bash
   mvn clean package
   ```

2. **Deploy the Packaged Application to CloudHub:**
   - Log in to [Anypoint Platform](https://anypoint.mulesoft.com).
   - Go to `Runtime Manager`.
   - Click on `Deploy Application` and follow the instructions to upload the packaged application.

## MuleSoft Flows

### 1. Salesforce to Supabase Sync Flow

This flow listens for changes in Salesforce and updates the Supabase database.

**Flow Steps:**

1. **Salesforce Trigger:**
   - Use a Salesforce Connector to listen for new or updated records in the custom objects.

2. **Data Transformation:**
   - Use DataWeave to transform the Salesforce data into the format required by Supabase.

3. **Supabase Upsert:**
   - Use the Database Connector to insert or update records in the Supabase database.

**Example Flow Configuration:**

- **Trigger:** Salesforce connector configured to poll for changes.
- **Transformation:** DataWeave script to map Salesforce fields to Supabase schema.
- **Action:** Supabase connector configured to perform upsert operations.

### 2. Supabase to Salesforce Sync Flow

This flow listens for changes in Supabase and updates Salesforce.

**Flow Steps:**

1. **Supabase Trigger:**
   - Use a Database Connector to listen for new or updated records in the database.

2. **Data Transformation:**
   - Use DataWeave to transform the Supabase data into the format required by Salesforce.

3. **Salesforce Upsert:**
   - Use the Salesforce Connector to insert or update records in Salesforce.

## Contributing

1. **Fork the Repository.**
2. **Create a New Branch:**

   ```bash
   git checkout -b feature-branch
   ```

3. **Make Your Changes.**
4. **Commit Your Changes:**

   ```bash
   git commit -am 'Add new feature'
   ```

5. **Push to the Branch:**

   ```bash
   git push origin feature-branch
   ```

6. **Create a New Pull Request.**

## Additional Documentation

- [Salesforce Connector Documentation](https://docs.mulesoft.com/connectors/salesforce/)
- [Supabase Documentation](https://supabase.com/docs/)
- [MuleSoft Anypoint Studio Documentation](https://docs.mulesoft.com/studio/)
