# Setup Mojo

[![Stand With Ukraine](https://raw.githubusercontent.com/vshymanskyy/StandWithUkraine/main/badges/StandWithUkraine.svg)](https://stand-with-ukraine.pp.ua)
![GitHub release](https://img.shields.io/github/v/release/fabasoad/setup-mojo-action?include_prereleases)
![functional-tests](https://github.com/fabasoad/setup-mojo-action/actions/workflows/functional-tests.yml/badge.svg)
![security](https://github.com/fabasoad/setup-mojo-action/actions/workflows/security.yml/badge.svg)
![linting](https://github.com/fabasoad/setup-mojo-action/actions/workflows/linting.yml/badge.svg)

This action sets up a [magic](https://docs.modular.com/magic/) CLI. Using it you
can create a [mojo](https://docs.modular.com/mojo/manual/) project.

## Supported OS

<!-- prettier-ignore-start -->
| OS      |                    |
|---------|--------------------|
| Windows | :x:                |
| Linux   | :white_check_mark: |
| macOS   | :white_check_mark: |
<!-- prettier-ignore-end -->

## Inputs

```yaml
- uses: fabasoad/setup-mojo-action@v1
  with:
    # (Optional) If "true" it installs magic even if it is already installed on
    # a runner. Otherwise, skips installation. Defaults to "false".
    force: "false"
```

## Outputs

<!-- prettier-ignore-start -->
| Name      | Description                        | Example |
|-----------|------------------------------------|---------|
| installed | Whether magic was installed or not | `true`  |
<!-- prettier-ignore-end -->

## Example usage

1. Create a new project:

   ```shell
   magic init my-project --format mojoproject
   cd my-project
   ```

2. Create `hello.mojo` inside `my-project` with the following content:

   ```text
   fn main():
       print("Hello, world!")
   ```

3. Create and run the following workflow:

   ```yaml
   name: Setup Mojo

   on: push

   jobs:
     setup:
       name: Setup
       runs-on: ubuntu-latest
       steps:
         - uses: actions/checkout@v4
         - uses: fabasoad/setup-mojo-action@v2
         - name: Run script
           run: |
             cd my-project
             magic run mojo hello.mojo
   ```
