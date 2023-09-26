
# User and Company Data Processing with Ruby



This Ruby project processes user and company data from JSON files and generates an output file based on specific criteria.



## Requirements



- Ruby 3 (if running directly)

- Docker (if running with Docker)



## Getting Started



### Running Directly with Ruby



If you have Ruby 3 installed on your machine, you can run the project directly.



1. Clone the repository:


`git clone <repository_url>`

2. Navigate to the project directory

`cd challenge_dir`

3. Execute the script

`./challenge.rb`

### Running with Docker

If  you  don't have Ruby 3 installed or prefer to run the project within a Docker container

1. Clone the repository:

`git clone <repository_url>`

3. Navigate to the project directory:
4.
`cd challenge_dir`

5. Build and start the Docker container:

`docker-compose up --build`

This will build the Docker image and run the container. The script will not run automatically; you can manually execute it inside the container as needed.

4. To access the running container:

`docker exec -it basic_ruby_3 bash`

Replace my_custom_container_name with the actual container name specified in the docker-compose.yml file.

5. Manually execute the Ruby script inside the container:

`./challenge.rb`