### Conventions

#### Naming Conventions
Variables will be in `words_separated_by_underscores` format. Acronyms will be capitalized.


#### Commonly used Variables and associated definitions


$script_path = split-path -parent $MyInvocation.MyCommand.Definition
$host_names = get-content $script_path\filename.txt

$BIOS_password = "P@$$w0rd" 