### Conventions

#### Naming Conventions
Variables will be in `words_separated_by_underscores` format. Acronyms will be capitalized.


#### Commonly used Variables and associated definitions

The following two will find a `filename.txt` in the same location as the calling script, and import the content of that file (presumably a list) into the `$host_names` variable
`$script_path = split-path -parent $MyInvocation.MyCommand.Definition`

`$host_names = get-content $script_path\filename.txt`

`$BIOS_password = "P@$$w0rd"`