# Template repository for creating new xsh libraries

This repository is not a real [xsh](https://github.com/alexzhangs/xsh) library but a template.

This GitHub [template repository](https://docs.github.com/en/github/creating-cloning-and-archiving-repositories/creating-a-repository-on-github/creating-a-repository-from-a-template) can be used to create a new repository with the skeleton of the [xsh library](https://github.com/xsh-lib).

Start here: https://github.com/xsh-lib/template/generate, or click the button `Use this template`.

The name of your repository will be the name of the new xsh library, so make sure that name is not taken already!

Allowed characters in the name：`[a-zA-Z]`.

Add a one-line description of your repository, then click "Create repository from template".

![Screenshot of the create repository interface](/assets/images/xsh-lib-create-from-template.png)

Once created, your new repository will execute a GitHub Actions workflow that uses cookiecutter to rewrite the repository to the desired state. This make take 30 seconds or so.

The idea of using Github Actions to rewrite the repository itself comes from this [post](https://simonwillison.net/2021/Aug/28/dynamic-github-repository-templates/), see [simonw/python-lib-template-repository](https://github.com/simonw/python-lib-template-repository) and [simonw/python-lib](https://github.com/simonw/python-lib).
