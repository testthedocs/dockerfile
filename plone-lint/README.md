# Plone-Lint

Custom [Docker](https://www.docker.com/) Container of [ttd-lint](https://github.com/testthedocs/ttd-lint) for checking [Plone Documentation](https://docs.plone.org/) against certain words.

This linter checks the docs against words configured in `.ttd-lintrc`, if the linter detects one or more of the words in the docs, it will fail and tell the file/s where a certain word/words is/are found.

This container and setup is customized for tests against [docs.plone.org](https://docs.plone.org) for a more general approach you may want to check [ttd-lint](https://github.com/testthedocs/ttd-lint).

## Requirements

- [Docker](https://www.docker.com/)

## Features

- Checks [Plone Documentation](https://docs.plone.org/) against certain words to insure consistency.
- Excludes own config and word style-guide (/about/word_choice.rst) from checks

## Documentation

For full documentation check the "docs" folder.

## Contribute

- [Issue Tracker](https://github.com/testthedocs/plone-lint/issues)
- [Source Code](https://github.com/testthedocs/plone-lint)

## License

GPL v3
