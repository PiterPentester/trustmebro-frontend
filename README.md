# TrustMeBro Frontend

<div align="center">

[![CI/CD Status](https://github.com/PiterPentester/trustmebro-frontend/actions/workflows/frontend-cicd.yaml/badge.svg)](https://github.com/PiterPentester/trustmebro-frontend/actions/workflows/frontend-cicd.yaml)

**The Official Interface for Unquestionable Truth**

</div>

## 📖 About

**TrustMeBro Frontend** is the user-facing web application for the TrustMeBro service. It provides a clean, modern interface for users to generate and validate certificates. Whether you need to prove you are the "World's Best Boss" or validate a friend's claim of "Expert Sandwich Maker", this portal makes it happen.

## ✨ Features

- **Certificate Dashboard**: Intuitive form to create new certificates.
- **Real-time Validation**: Instant verification of certificates via validation numbers.
- **PDF Download**: Direct download of generated certificates.
- **Responsive Design**: Looks great on desktop and mobile.
- **Modern UI**: Built with React and TailwindCSS for a smooth user experience.

## 🛠 Tech Stack

- **Framework**: React 18 (via CDN for simplicity)
- **Styling**: TailwindCSS (via CDN)
- **Web Server**: Nginx
- **Containerization**: Docker

## 🚀 Getting Started

### Prerequisites

- [Docker](https://www.docker.com/get-started)
- [Make](https://www.gnu.org/software/make/) (optional)

### Running Locally (Docker)

The frontend is designed to run in a container.

```bash
# Build and Run the container
make run

# The app will be available at http://localhost:8080
```

To stop the container:

```bash
make stop
# or
make clean
```

### Configuration

By default, the frontend expects the backend API to be available at `http://localhost:8080`.
This can be configured in the source code if needed.

## 🐳 Deployment

The application runs on Nginx inside a lightweight Docker container.

```bash
# Build the image
make build

# Push to registry
make push
```

## 📝 License

This project is licensed under the MIT License.

