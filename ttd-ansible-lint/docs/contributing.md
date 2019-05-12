# Contributing

## Conventional Git Commit Messages

The Tools

[commitizen](https://github.com/commitizen/cz-cli) - Help write the conventional commit message
[commitlint](https://github.com/conventional-changelog/commitlint) - Determine if the commit message is properly formatted

### Commitizen

`commitizen` is a handy little command line utility that provides prompts and hints for filling out each section for a conventional commit message.

The first step is to install it using npm:

```shell
npm install -g commitizen
```

Install `cz-conventional-changelog`:

```shell
npm install -g cz-conventional-changelog
```

After commitizen has been installed, instead of making a commit with `git commit` you make a commit with:

```shell
git cz
```

### Commitlint

`commitlint` is a tool that will lint your commit message and let you know if it adheres to whatever standard you've chosen.

Global installation is as effortless as `commitizen`.

Install the cli utility and the configuration:

```shell
npm install -g @commitlint/cli @commitlint/config-conventional
```

Create a global config file:

```shell
echo "module.exports = {extends: ['@commitlint/config-conventional']}" > ~/commitlint.config.js
```

You can test that it is installed and working by running the following command:

```shell
echo 'should fail' | commitlint
```

And to see a passing message you can try:

```shell
echo "fix(server): send cors headers" | commitlint
```

### Git Hook

`commitlint` in and of itself does not really do much until it is placed into a git hook.
It is from inside this hook that we can fail the commit if the message does not follow the standard.


If you've got global git hooks configured already, you can add a file as */path/to/global/hooks/commit-msg*.

```shell
cat .git-hooks/commit-msg

#!/usr/bin/env bash
commitlint < $1
```