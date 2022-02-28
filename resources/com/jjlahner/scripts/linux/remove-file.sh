#!/bin/bash -ex

{ set +x; } 2>/dev/null

SCRIPT_NAME="remove-file.sh"
SCRIPT_VERSION="1.0.0"

ART_ENCODED="CgogIF9fXyAgIF8gICBfIF9fX19fIF8gICBfIF9fX19fXyAgX19fICBfXyAgIF9fICAgICAgX19f
X18gX19fX18gX19fX19fIF9fX19fX19fX19fIF9fX19fIF9fX19fIAogLyBfIFwgfCBcIHwgfF8g
ICBffCB8IHwgfHwgX19fIFwvIF8gXCBcIFwgLyAvICAgICAvICBfX18vICBfXyBcfCBfX18gXF8g
ICBffCBfX18gXF8gICBfLyAgX19ffAovIC9fXCBcfCAgXHwgfCB8IHwgfCB8X3wgfHwgfF8vIC8g
L19cIFwgXCBWIC8gICAgICBcIGAtLS58IC8gIFwvfCB8Xy8gLyB8IHwgfCB8Xy8gLyB8IHwgXCBg
LS0uIAp8ICBfICB8fCAuIGAgfCB8IHwgfCAgXyAgfHwgICAgL3wgIF8gIHwgLyAgIFwgICAgICAg
YC0tLiBcIHwgICAgfCAgICAvICB8IHwgfCAgX18vICB8IHwgIGAtLS4gXAp8IHwgfCB8fCB8XCAg
fCB8IHwgfCB8IHwgfHwgfFwgXHwgfCB8IHwvIC9eXCBcICAgICAvXF9fLyAvIFxfXy9cfCB8XCBc
IF98IHxffCB8ICAgICB8IHwgL1xfXy8gLwpcX3wgfF8vXF98IFxfLyBcXy8gXF98IHxfL1xffCBc
X1xffCB8Xy9cLyAgIFwvICAgICBcX19fXy8gXF9fX18vXF98IFxffFxfX18vXF98ICAgICBcXy8g
XF9fX18vIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIAoKCg==
"

ART_DECODED=$(echo "$ART_ENCODED" | base64 -d)
FILE_PATH_REGEX="^(/[^/ ]*)+/?$"

function display_usage() {
    echo "$ART_DECODED"
    printf '\n%s\n\n' "Usage: $SCRIPT_NAME [PARAMETER]"
    printf '%s\n\n' "Script to remove a single file."
    printf '%s\n' "Options:"
    printf '\t%s\t%s\n' "-f, --file string" "Path to file to remove."
    printf '\t%s\t%s\n' "-v, --version string" "Prints out version information."
    printf '\t%s\t%s\n\n' "-h, --help string" "Run remove-file.sh --help for more information."    
}

function display_version() {
    echo "$ART_DECODED"
    printf '\n%s\t\t%s\n' "Script:" "$SCRIPT_NAME"
    printf '%s\t%s\n\n' "Version:" "$SCRIPT_VERSION"
}

if (( $# != 1 ))
then
    display_usage
    exit 1
fi

if [[ ( $* == "--help") ||  $* == "-h" ]]
then
    display_usage
    exit 0
fi

if [[ ( $* == "--version") ||  $* == "-v" ]]
then
    display_version
    exit 0
fi

if [[ ( $* == "--file") ||  $* == "-f" ]]
then
    FILE="$*"
fi

echo "$FILE"