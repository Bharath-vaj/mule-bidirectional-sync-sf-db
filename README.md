Sure, I'll move the MuleSoft flows section to before the deployment instructions. Here is the revised `README.md` file:

```markdown
# Bidirectional Sync: Salesforce and Supabase

## Overview

This project contains a Mule application designed to synchronize data between Salesforce and a Supabase database. The application supports bidirectional synchronization, ensuring that data changes in either Salesforce or Supabase are reflected in the other system.

## Project Structure

The project is organized into the following main components:

### 1. Salesforce Integration

This component facilitates interactions with Salesforce's custom objects. It includes operations for retrieving, updating, and creating records in Salesforce.

### 2. Supabase Integration

This component enables operations on the Supabase database, including retrieving, updating, and creating records.

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

   - **Obtain Salesforce Access Token:**
     - Log in to Salesforce.
     - Navigate to `Setup` and search for `API` to find details on accessing Salesforce APIs.
     - Use Salesforce’s OAuth 2.0 credentials (Consumer Key and Consumer Secret) to obtain an access token using Postman or a similar tool.

   - **Configure Salesforce in MuleSoft:**
     - Open Anypoint Studio.
     - Go to the `Global Elements` tab.
     - Add a new `Salesforce` configuration with the obtained `Access Token`.

   **Supabase:**

   - **Create a Supabase Account and Database:**
     - Go to [Supabase](https://supabase.com/).
     - Sign up for an account and create a new project.
     - Set up your database schema as required.

   - **Obtain Supabase URL and API Key:**
     - Go to the `Settings` > `API` section of your Supabase project.
     - Note the `Supabase URL` and `API Key`.

   - **Configure Supabase in MuleSoft:**
     - Open Anypoint Studio.
     - Go to the `Global Elements` tab.
     - Add a new `Database Connector` configuration with the obtained `Supabase URL` and `API Key`.

4. **Open the Project in Anypoint Studio (Optional):**

   - Open Anypoint Studio.
   - Import the project as an existing Mule project by selecting `File` > `Import` > `Existing Mule Project`.

## MuleSoft Flows

### 1. Salesforce to Supabase Sync Flow

This flow listens for changes in Salesforce and updates the Supabase database.

**Flow Steps:**

1. **Salesforce Trigger:**
   - Use the Salesforce Connector to poll for new or updated records in Salesforce.

2. **Data Transformation:**
   - Transform the Salesforce data into the format required by Supabase.

3. **Supabase Upsert:**
   - Use the Database Connector to perform insert or update operations in Supabase.

**Example Flow Configuration:**

- **Trigger:** Salesforce connector configured to poll for changes.
- **Transformation:** Map Salesforce fields to Supabase schema.
- **Action:** Database Connector configured to upsert records in Supabase.

### 2. Supabase to Salesforce Sync Flow

This flow listens for changes in Supabase and updates Salesforce.

**Flow Steps:**

1. **Supabase Trigger:**
   - Use the Database Connector to poll for new or updated records in Supabase.

2. **Data Transformation:**
   - Transform the Supabase data into the format required by Salesforce.

3. **Salesforce Upsert:**
   - Use the Salesforce Connector to perform insert or update operations in Salesforce.

**Example Flow Configuration:**

- **Trigger:** Database Connector configured to detect changes in Supabase.
- **Transformation:** Map Supabase fields to Salesforce schema.
- **Action:** Salesforce Connector configured to upsert records in Salesforce.

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

- [Salesforce Documentation](https://developer.salesforce.com/docs)
- [Supabase Documentation](https://supabase.com/docs/)
- [MuleSoft Anypoint Studio Documentation](https://docs.mulesoft.com/studio/)
