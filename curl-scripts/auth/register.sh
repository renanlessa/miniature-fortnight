#!/bin/bash

curl -X POST \
  http://localhost:8080/auth/register \
  -H 'Content-Type: application/json' \
  -d '{
    "name": "Admin",
    "email": "admin@example.com",
    "password": "admin123"
}' 