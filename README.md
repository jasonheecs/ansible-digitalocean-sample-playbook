# Sample Ansible Playbooks to provision a DigitalOcean droplet

[![Build Status][travis-badge]][travis-link]

This is a sample playbook that illustrates how to create and provision a DigitalOcean droplet with Ansible; you can spin up and provision a droplet using the command line via this playbook.

![Playbook Demo Image](https://i.imgur.com/EhheGBP.gif)

This playbook does the following:
- Spins up a DigitalOcean droplet
- Adds the droplet's IP address to the [ansible inventory file](hosts)
- Setup the swap file
- Installs and setup fail2ban
- Setup Uncomplicated firewall
- Setup the timezone
- Adds a new user account with sudo access
- Adds a public ssh key for the new user account
- Disables password authentication to the droplet
- Deny root login to the droplet
- Installs the UnattendedUpgrades package for automatic security updates
- (Optional) Installs the LEMP stack
- (Optional) Installs Docker

## Prerequisites

Ansible >= 2.4.0.0

## Usage

1) Clone this repo:
```
git clone https://github.com/jasonheecs/ansible-digitalocean-sample-playbooks.git
cd ansible-digitalocean-sample-playbooks
```

2) Rename the `group_vars/all/secret.yml.example` file to `group_vars/all/secret.yml` and change the secret variables to your appropriate values.

3) Modify the values in `group_vars/all/main.yml` with your desired values.

4) Run the following:
```
ansible-playbook -i hosts main.yml
```

## Testing

Testing is done via Kitchen CI and Kitchen Ansible. Testing of the droplet setup is done via Kitchen Vagrant:

```
gem install bundler
bundle install
bundle exec kitchen test
```

Testing of the LEMP stack and Docker installation / setup is done via Kitchen Docker:
```
gem install bundler
bundle install
KITCHEN_YAML=".kitchen.travis.yml" bundle exec kitchen test
```

Refer to the [travis.yml](.travis.yml) file and [Travis build logs][travis-link] for details on the test build process and expected outputs.

## License

MIT


[travis-badge]: https://travis-ci.com/jasonheecs/ansible-digitalocean-sample-playbooks.svg?branch=master
[travis-link]: https://travis-ci.com/jasonheecs/ansible-digitalocean-sample-playbooks