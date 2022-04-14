# {{cookiecutter.github_username}}/{{cookiecutter.lib_name}}

xsh Library - {{cookiecutter.description}}.

About xsh and its libraries, check out [xsh document](https://github.com/alexzhangs/xsh)

## Requirements

1. bash

    Tested with bash:
    * 4.3.48 on Linux
    * 3.2.57 on macOS

## Dependency

1. xsh-lib/core

    This library depends on [xsh-lib/core](https://github.com/xsh-lib/core) which should be loaded first before to use this library.

    ```bash
    xsh load xsh-lib/core
    ```

## Installation

Assume [xsh](https://github.com/alexzhangs/xsh) is already installed at your local.

To load this library into `xsh` issue below command:

```bash
xsh load {{cookiecutter.github_username}}/{{cookiecutter.lib_name}}
```

The loaded library can be referred as name `{{cookiecutter.lib_name}}`.

## Usage

List available utilities for this library:

```bash
xsh list {{cookiecutter.lib_name}}
```
