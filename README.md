# devops-test
work only for mac
1)socat TCP-LISTEN:2376,reuseaddr,fork,bind=127.0.0.1 UNIX-CLIENT:/var/run/docker.sock
2)add GITHUB_TOKEN_DEVOPS_TEST to docker-compose.yml
3)docker-compose up --build
