# trailing-newline

Pre-commit hook to flag files that do not end in a blank newline.

Based on https://gist.github.com/Robotic-Brain/ffafe886a9e4b7b9e946318817440abe and https://gist.github.com/johnjohndoe/4024222.

## Installation

Add to your `.pre-commit-config.yaml` file and run `pre-commit install`.

The hook runs on all text files by default. Pass any file extensions to ignore to `args` separated by a pipe. For example, to ignore .lock and .md files:

```
repos:
  - repo: https://github.com/philipdarke/trailing-newline
    rev: v1.0.0
    hooks:
    - id: trailing-newline
      args: [lock|md]
```

## Usage

The message ``Trailing newline missing from [filepath]`` is displayed if a file fails. Either update the file, ignore the file extension or use ``git commit --no-verify`` to commit without running any hooks.

## License

Made available under the [MIT License](LICENSE).

