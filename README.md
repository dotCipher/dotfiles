# DotFiles

These dotfiles are intended to be applied via ansible from the [Mac Dev Playbook](https://github.com/dotCipher/mac-dev-playbook).

The intended command to apply all dotfiles (and their dependencies) is:

`ansible-playbook -i ansible/inventory ansible/playbooks/pip.yml --ask-become-pass`
