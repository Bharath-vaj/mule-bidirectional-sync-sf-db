# samToolbox
# Sync Salesforce and Database Process API

## Overview

This project contains a Mule application designed to synchronize data between Salesforce and a MySql database. The application supports bidirectional real-time synchronization, ensuring that data changes in either Salesforce or Supabase are reflected in the other system.

## Project Structure

The project is organized into the following main components:

### 1. Salesforce Integration

This component facilitates interactions with Salesforce's custom objects. It includes operations for retrieving, updating, and creating records in Salesforce.

### 2. Supabase MySql Integration

This component enables operations on the Supabase database, including retrieving, updating, and creating records.

### 3. Sync Flows

The sync flows handle the logic for bidirectional synchronization. These flows listen for changes in either Salesforce or Supabase and propagate those changes to the other system.

# Salesforce OData Integration

## Overview

Integrate Salesforce with an OData service using OData 2.0. This setup enables querying and manipulating Salesforce data in a standardized manner, facilitating efficient data exchange and interoperability between Salesforce and other systems that support OData 2.0.

## Project Structure

The project is organized into the following main components:

### 1. OData Integration

Configures the MuleSoft application with the OData 2.0 plugin to connect to an OData service. This setup enables interaction with the Salesforce API using OData 2.0 protocols.

### 2. Database Integration

Uses Database Connectors to perform CRUD operations on the database. This component manages the interactions with the database, allowing for data manipulation based on requests from Salesforce.

### 3. OData Flows

Handles the logic for translating OData requests into database operations and vice versa. This includes setting up CRUD operations for database tables using the database connectors.

### 4. Salesforce External Objects

- **Create External Objects:** In Salesforce, create external objects to link to your database tables via OData.
- **Configure External Data Source:** Set up an external data source in Salesforce to connect with the OData service.
- **Map External Objects:** Link database tables to Salesforce as external objects to enable seamless data integration and access.

## Setup

### Prerequisites

- Java JDK 8 or later
- Maven
- Mule Runtime
- Anypoint Studio
- Supabase account
- Salesforce account with custom objects
- OData 2.0 Plugin

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
     - Navigate to Setup and search for API to find details on accessing Salesforce APIs.
     - Use Salesforce’s OAuth 2.0 credentials (Consumer Key and Consumer Secret) to obtain an access token using Postman or a similar tool.

   - **Configure Salesforce in MuleSoft:**
     - Open Anypoint Studio.
     - Go to the Global Elements tab.
     - Add a new Salesforce configuration with the obtained Access Token.

   **Supabase:**

   - **Create a Supabase Account and Database:**
     - Go to [Supabase](https://supabase.com/).
     - Sign up for an account and create a new project.
     - Set up your database schema as required.

   - **Obtain Supabase URL and API Key:**
     - Go to the Settings > API section of your Supabase project.
     - Note the Supabase URL and API Key.

   - **Configure Supabase in MuleSoft:**
     - Open Anypoint Studio.
     - Go to the Global Elements tab.
     - Add a new Database Connector configuration with the obtained Supabase URL and API Key.

4. **Open the Project in Anypoint Studio (Optional):**

   - Open Anypoint Studio.
   - Import the project as an existing Mule project by selecting File > Import > Existing Mule Project.

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

# Salesforce Lightning App Builder

## Overview

The project also includes a Salesforce Lightning App Builder configuration to view fields from custom objects and external objects on a record page. This enables a consolidated view of data directly within Salesforce.

## Project Structure

The project is organized into the following main components:

### 1. Record Page Configuration

The record page is set up to display fields from the custom objects and the external object using built-in components from the record page component palette. The record page can be found under `Setup` -> `User Interface` -> `Lightning App Builder`.

### 2. Custom Lightning Component

To overcome the limitation of the built-in components not displaying external object fields, a Custom Lightning Component was created using the Aura framework in the Salesforce Developer Console.

#### Apex Class File:

- `CustomObject.apxc`

#### Custom Lightning Component Bundle Files:

- `CustomObject.cmp`
- `CustomObjectController.js`
- `CustomObjectHelper.js`
- `CustomObject.css`
- `CustomObject.auradoc`
- `CustomObjectRenderer.js`
- `CustomObject.design`
- `CustomObject.svg`

### Setup

1. **Create the Record Page:**

   - Log in to Salesforce.
   - Navigate to the Lightning App Builder under `Setup` -> `User Interface`.
   - Create a new Record Page.
   - Add components to display fields from the custom objects.

2. **Add the Custom Lightning Component:**

   - Open the Salesforce Developer Console.
   - Create a new Lightning Component using the Aura framework.
   - Add the necessary code to display the fields from the external object.
   - Save and deploy the component.
   - Add the Custom Lightning Component to the record page in the Lightning App Builder.

## Deployment

### Local Deployment

1. **Ensure Mule Runtime is Installed and Configured:**

   - Download and install Mule Runtime from the [MuleSoft website](https://docs.mulesoft.com/general/).

2. **Deploy the Application Using Anypoint Studio:**

   - Right-click on the project in Anypoint Studio.
   - Select Run As > Mule Application.

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

   - Log in to [Anypoint Platform](https://anypoint.mulesoft.com/login/).
   - Go to Runtime Manager.
   - Click on Deploy Application and follow the instructions to upload the packaged application.

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
- [OData 2.0 Documentation](https://docs.mulesoft.com/apikit/latest/install-odatav2-tooling)
- [Salesforce Lightning App Builder](https://trailhead.salesforce.com/content/learn/modules/lightning_app_builder)
- [Custom Lightning Components](https://developer.salesforce.com/docs/atlas.en-us.224.0.lightning.meta/lightning/intro_framework.htm)
