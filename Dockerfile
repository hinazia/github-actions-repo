# This Docker file will create the image required for running the webapp.
# It has alll the required dependencies installed 

# Take the aline/slim Base Image
FROM node:22-alpine AS builder

# Working Directory to store files from Host to container
WORKDIR /app

# COPY the required files
COPY package.json ./

# RUN the Dependencies
RUN npm install

# Copy the whole code in /app
COPY . .


#  Take the Slim image to run app
FROM node:22-slim AS deployer

WORKDIR /app

# COPY from builder Because it has code required
COPY --from=builder /app ./

# Create a SYSTEM (-S) Group and USER to use app
# -S means system user/group. It creates a user/group 
# intended for running services (like your app), not for normal human login.

RUN groupadd -r appgroup && \
    useradd -r -g appgroup appuser

USER appuser

# Expose PORT
EXPOSE 3000

# Execute the app
CMD ["npm", "start"]