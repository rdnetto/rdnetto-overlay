#!/usr/bin/python3
#
# Script for regenerating stack_urls.eclass
#
# Dependencies: dev-python/requests, dev-python/pyyaml
#

import requests
import yaml

STACK_SETUP_YAML = "https://raw.githubusercontent.com/commercialhaskell/stackage-content/master/stack/stack-setup-2.yaml"


def main():
    r = requests.get(STACK_SETUP_YAML)
    data = yaml.safe_load(r.text)
    ghcData = data["ghc"]["linux64-tinfo6"]

    with open("stack_urls.eclass", "w") as f:
        f.write('''
# Automatically generated by generate_stack_urls.py

stack_ghc_src() {
                ''')

        ifStmt = "if"

        for ver in ghcData.keys():
            # https://github.com/commercialhaskell/ghc/releases/download/ghc-$1-release/ghc-$1-x86_64-fedora24-linux.tar.xz -> ghc-tinfo6-$1.tar.xz
            url = ghcData[ver]["url"]
            f.write(f'''
    {ifStmt} [ "$1" = "{ver}" ]; then
      echo "{url} -> ghc-tinfo6-{ver}.tar.xz"
            ''')
            ifStmt = "elif"


        f.write('''
    else
        die "Unknown version $1"
    fi
}
                ''')



if __name__ == "__main__":
    main()
