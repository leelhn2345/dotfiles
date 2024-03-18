# Neovim

## mypy

The mypy linter from neovim plugin does not use python project's mypy.
But it respects the project's mypy settings.

If any python mypy plugins are used, activate the neovim mypy's virtual environment,
then install the mypy plugins.

### example

```sh
$ vmp # alias from .zshrc

# ensure that the virtualenv is activated
$ pip3 install --no-cache-dir pydantic pydantic-settings ...
```

### lint checks

To ensure that the background linting is functioning:

1. go inside neovim editor
2. activate toggle term
3. run `mypy`

Ensure that the logs are same as when you run `mypy` outside nvim editor.
