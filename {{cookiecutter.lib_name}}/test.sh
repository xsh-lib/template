#!/bin/bash
#
# Tests for this xsh library. Plain assertions, no external test framework
# (mirrors xsh-lib/core/test.sh). Runs under bash and zsh.
#
# Usage:
#   xsh load xsh-lib/core <user>/<this-lib>   # one-time
#   bash test.sh                              # or: zsh test.sh
#

# Make the `xsh` function available when run as a child process. Under bash it
# is inherited as an exported function (no-op here); zsh cannot export functions,
# so a child `zsh test.sh` sources ~/.xshrc to define xsh as a real zsh function
# (otherwise it would only see the bin/xsh shim, which runs bash). This is what
# lets the utilities execute under zsh's ksh emulation.
if ! type xsh 2>/dev/null | grep -q 'function'; then
    # shellcheck source=/dev/null
    . ~/.xshrc
fi

set -e -o pipefail

# Derive the library's LPUE prefix from xsh.lib (its `name=` field).
__dir=$(cd "$(dirname "$0")" && pwd)
__lib=$(awk -F= '/^name=/{print $2; exit}' "$__dir/xsh.lib")
[ -n "$__lib" ] || { echo "test.sh: could not read library name from xsh.lib" >&2; exit 1; }

xsh log info "xsh list ${__lib}/"
xsh list "${__lib}/*" >/dev/null

# import-smoke: every function utility sources cleanly (under zsh each is
# sourced with the injected `emulate -L ksh`). A brand-new library has no
# utilities yet, so this loop is a no-op until you add some.
xsh log info "import-smoke: all ${__lib} function utilities"
while read -r __lpue; do
    [ -z "$__lpue" ] && continue
    xsh import "$__lpue"
done < <(xsh list "${__lib}/*" | awk '$1 == "[functions]" {print $2}')

# TODO: add functional assertions for your utilities, e.g.
#   [[ $(xsh ${__lib}/some/util arg) == expected ]]

echo
echo "All tests passed."

exit
