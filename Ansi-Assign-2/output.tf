data "http" "my_public_ip" {
  url = "https://ifconfig.me"
}

output "public_ip_keep_it_safely" {
  description = "Public IP address retrieved from ifconfig.me"
  value       = chomp(data.http.my_public_ip.response_body)
}

