# Contact List API Automation

This project contains a Postman collection and environment for testing the **Thinking Tester Contact List API**. The collection validates both positive and negative API scenarios and can be executed either through the Postman desktop application or from the command line using Newman.

## Project Files

| File | Description |
|------|-------------|
| `contactList.collection.json` | Postman collection containing all API requests and automated tests |
| `contactList.environment.json` | Postman environment containing variables used throughout the collection |

## API Documentation

Official API documentation:

https://documenter.getpostman.com/view/4012288/TzK2bEa8

---

# Prerequisites

Install the following software before running the project.

## 1. Install Node.js

Download the latest LTS version from:

https://nodejs.org/

Verify installation:

```bash
node -v
npm -v
```

Example:

```
v22.x.x
10.x.x
```

---

## 2. Install Postman

Download Postman Desktop:

https://www.postman.com/downloads/

---

## 3. Install Newman

Newman is the command-line collection runner for Postman.

Install globally using npm:

```bash
npm install -g newman
```

Verify installation:

```bash
newman -v
```

Example:

```
6.x.x
```

---

# Project Setup

1. Clone or download this repository.

2. Open Postman.

3. Import the collection:

```
contactList.collection.json
```

4. Import the environment:

```
contactList.environment.json
```

5. Select the imported environment from the Environment dropdown.

---

# Configure Environment Variables

Before running the tests, ensure the environment contains valid values for the following variables.

| Variable | Description |
|-----------|-------------|
| firstName | First name used when creating contacts |
| lastName | Last name used when creating contacts |

Example:

| Variable | Value |
|----------|-------|
| firstName | John |
| lastName | Doe |

> **Important**
>
> If these variables are empty, the **Add Contact** request will fail with **400 Bad Request**, causing all subsequent tests that depend on the generated Contact ID to fail.

---

# Running the Collection in Postman

1. Open the collection.
2. Click **Run Collection**.
3. Select the imported environment.
4. Click **Run Contact List Collection**.

All requests should execute sequentially.

---

# Running the Collection with Newman

Open a terminal inside the project folder.

Run:

```bash
newman run contactList.collection.json -e contactList.environment.json
```

Example output:

```
newman

Contact List Collection

✓ Login
✓ Get Contact List
✓ Add Contact
✓ Get Contact
✓ Update Contact
✓ Delete Contact

✓ Negative Tests
```

---

# Test Coverage

The collection validates the following API workflows.

## Positive Tests

### Login

- Authenticate user
- Store Bearer Token
- Verify response time

---

### Get Contact List

- Retrieve all contacts
- Verify HTTP 200
- Verify JSON response
- Verify response time

---

### Add Contact

- Create a new contact
- Store generated Contact ID
- Verify HTTP 201

---

### Get Contact

- Retrieve newly created contact
- Verify Contact ID
- Verify First Name
- Verify Last Name
- Verify Email

---

### Update Contact

- Update an existing contact
- Verify successful update

---

### Delete Contact

- Delete created contact
- Verify successful deletion

---

# Negative Tests

The following validation scenarios are covered.

| Test | Expected Result |
|------|-----------------|
| Last Name Too Long | 400 Bad Request |
| Invalid Email | Validation Error |
| Unauthorized Request | 401 Unauthorized |
| Missing Required Fields | Validation Error |
| Invalid Update Parameters | 400 Bad Request |
| Invalid Contact ID | 404 Not Found |
| Retrieve Deleted Contact | 404 Not Found |

---

# Assertions Performed

The collection validates:

- Response status codes
- Response time (< 3000 ms)
- Response headers
- JSON payload validation
- Authentication
- Contact creation
- Contact retrieval
- Contact updates
- Contact deletion
- Validation error messages

---

# Environment Variables Used

| Variable | Purpose |
|-----------|---------|
| token | Bearer token returned after login |
| contactId | ID of the created contact |
| firstName | Test data |
| lastName | Test data |

The following variables are automatically generated during execution:

- `token`
- `contactId`

These do not need to be manually populated.

---

# Project Flow

```
Login
    │
    ▼
Store Bearer Token
    │
    ▼
Get Contact List
    │
    ▼
Add Contact
    │
    ▼
Store Contact ID
    │
    ▼
Get Contact
    │
    ▼
Update Contact
    │
    ▼
Delete Contact
    │
    ▼
Execute Negative Test Suite
```

---

# Common Issues

## Add Contact returns 400 Bad Request

Verify that the environment contains values for:

```
firstName
lastName
```

---

## Requests are sent to `/contacts/null`

This indicates the **Add Contact** request failed and no Contact ID was generated.

Resolve the Add Contact failure before continuing.

---

## Authentication Failed

Verify that:

- The login credentials are valid.
- The Login request executes before all other requests.
- The `token` environment variable is populated.

---

## Newman Tests Pass in Postman but Fail in CLI

Ensure the exported environment contains all required variables.

A common cause is exporting an environment with empty values while Postman is using local/current values.

Open the exported `contactList.environment.json` and verify that required variables contain values before executing Newman.

---

# Useful Commands

Install Newman

```bash
npm install -g newman
```

Run collection

```bash
newman run contactList.collection.json -e contactList.environment.json
```

Run with verbose logging

```bash
newman run contactList.collection.json -e contactList.environment.json --verbose
```

Export HTML Report (requires reporter)

```bash
npm install -g newman-reporter-htmlextra

newman run contactList.collection.json \
-e contactList.environment.json \
-r cli,htmlextra
```

---

# Repository Structure

```
.
├── README.md
├── contactList.collection.json
└── contactList.environment.json
```

---

# Technologies Used

- Postman
- Newman
- Node.js
- JavaScript
- REST APIs

---