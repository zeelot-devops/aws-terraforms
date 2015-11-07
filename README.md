# Setup Notes

Very confused about how to get a new machine up and running quickly qithout committing needless secrets. Here are some commands I needed to run in order to get my environment up and running when terraform state is stored remotely on Atlas.

- Create the needed `atlas.tf` and `terraform.tfvars` files with secret information (not really?).
- `terraform.tfvars` needs `access_key`, `secret_key`, and `region` (AWS configs).

- `terraform get`
- `export ATLAS_TOKEN=…`
- `terraform remote config --backend-config="name=zeelot/example"`
- `terraform plan` should now say "no changes".
