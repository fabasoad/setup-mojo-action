# Setup Mojo

[![Stand With Ukraine](https://raw.githubusercontent.com/vshymanskyy/StandWithUkraine/main/badges/StandWithUkraine.svg)](https://stand-with-ukraine.pp.ua)
![GitHub release](https://img.shields.io/github/v/release/fabasoad/setup-mojo-action?include_prereleases)
![functional-tests-local](https://github.com/fabasoad/setup-mojo-action/actions/workflows/functional-tests-local.yml/badge.svg)
![functional-tests-remote](https://github.com/fabasoad/setup-mojo-action/actions/workflows/functional-tests-remote.yml/badge.svg)
![security](https://github.com/fabasoad/setup-mojo-action/actions/workflows/security.yml/badge.svg)
![linting](https://github.com/fabasoad/setup-mojo-action/actions/workflows/linting.yml/badge.svg)

This action sets up a MAX and [Mojo](https://www.modular.com/mojo).

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
    # (Optional) If "true" it installs MAX and Mojo even if it is already
    # installed on a runner. Otherwise, skips installation. Defaults to false.
    force: "false"
```

## Outputs

None.

## Example usage

1. Create `hello.mojo` with the following content:

   ```text
   fn main():
       print("Hello, world!")
   ```

2. Create and run the following workflow:

   ```yaml
   name: Setup Mojo

   on: push

   jobs:
     setup:
       name: Setup
       runs-on: ubuntu-latest
       steps:
         - uses: actions/checkout@v4
         - uses: fabasoad/setup-mojo-action@v1
         - name: Run script
           run: mojo hello.mojo
   ```

3. See the result:

   ```text
   Run mojo hello.mojo
   Hello, world!
   ```
