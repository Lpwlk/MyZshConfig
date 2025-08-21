<samp>

<!-- <span style="color:#AFDFFF"> -->

<div align="center">

## TODO list

<span style="color:#9198A1">

Author - Lpwlk &nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp; Date - 08/08/2025

</div>

<span style="color:#9198A1">

<samp>This file contains multiple TODO lists that I use to track my ideas & ongoing dev processes for the `MyZshEnv` repository</samp>

&nbsp;

<span style=color:#CFFFBF>


### Repo-related tasks

- [ ] Write a base `README.md` content for 1st commit
- [ ] Write a complete `zshrcConfig.jsonc` documentation
- [ ] Write included tools specific documentation
- [ ] Analyze & list dependancies for MacOS & Linux environments
- [ ] Review codebase to anticipate zsh config migration from MacOS to Linux (Mint/Nix/Arch)

&nbsp;

<span style="color:#FFB98A">

### Custom zshrc config

- [x] Make up my mind on a clean & organized file structure
- [x] Define naming and arch conventions to be used for every script
- [x] Write an initial `zshrcConfig.jsonc` & write the associated schema 
- [x] Implement a JSON schema validation method ([CLI JSON Schema validator](#json-config-deployment)) for `zshrcConfig.jsonc`
- [x] Implement parsing ~~& saving~~ methods for `zshrcConfig.jsonc`
- [ ] Finalize `logger.zsh`, `tests.zsh` and `init.zsh` (`config.zsh` merged with `zshrc.zsh` init related sections) structure
- [ ] Re-structure the tested `zshrcConfig.jsonc` to fit the integration needs for the 3 previous scripts

&nbsp;

<span style="color:#FFE29F">

### Zsh environment cleanup

- [ ] Complete review of `aliases.sh` to clean up and comment zsh aliases
- [ ] Develop a personnal CLI alias cheatsheet with custom formatting
- [ ] Edit my base `p10k.zsh` to create 3 variations of it
- [ ] Edit my base `fastFetchConfig.jsonc` to create 3 variations of it
- [ ] Edit my base `zshrcConfig.jsonc` to create 3 variations of it

&nbsp;

<span style="color:#FFFFFF">

### Useful resources 

> #### Shell scripting
> [GNU Bash manual](https://www.gnu.org/software/bash/manual/bash.html) <br>
> [Bash cheatsheet](https://devhints.io/bash) <br>
> [Bash guide #1](https://guide.bash.academy/exercises/) <br>
> [Bash guide #2](https://learnxinyminutes.com/bash/) <br>
> [Bash guide #2](https://linuxcommand.org/index.php) <br>

> #### JSON config deployment
> [JSON Schema](https://json-schema.org/docs) <br>
> [JSON Schema validator](https://github.com/ajv-validator/ajv-cli) <br>
