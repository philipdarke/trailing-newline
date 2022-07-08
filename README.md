# trailing-newline

Pre-commit hook to ensure files end in a blank newline.

## Installation

Add to your `.pre-commit-config.yaml` file and run `pre-commit install`. Pass any file extensions to ignore to `args` separated by a pipe. For example, to ignore .pdf and .jpg files:

```
repos:
  - repo: https://github.com/philipdarke/trailing-newline
    rev: v1.0.2
    hooks:
    - id: trailing-newline
      args: [pdf|jpg]
```

## License

Made available under the [MIT License](LICENSE).

