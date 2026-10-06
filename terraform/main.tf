terraform {
  required_version = ">= 1.16.0"

  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 5.24"
    }
  }
}

provider "cloudflare" {
  api_token = var.cloudflare_api_token
}

variable "cloudflare_api_token" {
  description = "Cloudflare API token"
  sensitive   = true
}

variable "cloudflare_account_id" {
  description = "Cloudflare Account ID"
}

resource "cloudflare_workers_script" "site" {
  account_id  = var.cloudflare_account_id
  script_name = "devops-site"

  content = <<-EOT
  export default {
    async fetch(request, env) {
      return new Response("Worker fallback");
    }
  };
EOT

  main_module = "index.js"

  assets = {
    directory = "../public"

  }
}

resource "cloudflare_workers_script_subdomain" "site" {
  account_id  = var.cloudflare_account_id
  script_name = cloudflare_workers_script.site.script_name

  enabled = true
}