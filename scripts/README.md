# rascript_export.sh

This script runs the `rascript-cli.exe` tool from the RATools suite using Wine. It allows you to specify the input script, output directory, and the path to the RATools directory.

## Usage

```bash
rascript_export.sh -i <input_script> [-o <output_dir>] [-e <ratools_dir>]
```

## Parameters
-i, --input: Path to the input script (required).
-o, --output: Path to the output directory (optional, can also be set as RATOOLS_OUTPUT_DIR environment variable).
-e, --exe: Path to the RATools directory (optional, can also be set as RATOOLS_DIR environment variable).
-h, --help: Display the help message.

## Examples

Using Command Line Arguments
```bash
rascript_export.sh -i "~/scripts/Crystal Clear.rascript" -o "~/.wine/drive_c/RALibretro-x64/RACache/Data/" -e "~/Downloads/RATools-v1.15.0"
```

Using Environment Variables
```bash
export RATOOLS_DIR="~/Downloads/RATools-v1.15.0"
export RATOOLS_OUTPUT_DIR="~/.wine/drive_c/RALibretro-x64/RACache/Data/"
rascript_export.sh -i "~/scripts/Crystal Clear.rascript"
```

## Adding rascript_export.sh to PATH

To make rascript_export.sh accessible from anywhere, you can add it to your PATH.

1. Move the script to a directory that is already in your PATH, or add the script's directory to your PATH.
```bash
mv rascript_export.sh /usr/local/bin/
```

Or, if you prefer to keep it in its current directory:
```bash
export PATH=$PATH:/path/to/your/script
```

2. To make this change permanent, add the export command to your shell's configuration file (e.g., ~/.bashrc, ~/.bash_profile, or ~/.zshrc):
```bash
echo 'export PATH=$PATH:/path/to/your/script' >> ~/.bashrc
source ~/.bashrc
```

## Environment Variables

* RATOOLS_DIR: Path to the RATools directory. This can be used instead of the -e flag.
* RATOOLS_OUTPUT_DIR: Path to the output directory. This can be used instead of the -o flag.

## Prerequisites

* Wine must be installed on your system.
* RATools must be downloaded and available in the specified directory.

## License

This script is provided "as is", without warranty of any kind. Use at your own risk.
