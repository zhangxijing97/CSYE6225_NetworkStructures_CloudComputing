### Terraform
```
terraform init
terraform plan
terraform apply
```

### Generate Traffic
```
# If not installed, install it (Ubuntu/Debian):
sudo apt-get update && sudo apt-get install apache2-utils -y

# Sample command:
ab -n 2000 -c 100 http://<alb_dns>/v1/user/self
```

### The health check endpoint
```
http://<alb-dns>/healthz
```

### Create User
```
curl -i -X POST http://<alb-dns>/v1/user \
     -H "Content-Type: application/json" \
     -d '{
           "email": "john.doe@example.com",
           "password": "MyPassword123!",
           "first_name": "John",
           "last_name": "Doe"
         }'
```

### Get User
```
curl -i \
     -u "john.doe@example.com:MyPassword123!" \
     http://<alb-dns>/v1/user/self
```