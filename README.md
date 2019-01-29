# DotFiles

These dotfiles are intended to be applied via ansible from the [Dev Workstation Playbooks](https://github.com/dotCipher/workstation-playbooks).

The intended command to apply all dotfiles (and their dependencies) is:

`ansible-playbook -i ansible/inventory ansible/playbooks/pip.yml --ask-become-pass`
