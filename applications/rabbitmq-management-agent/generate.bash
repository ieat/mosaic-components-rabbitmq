#!/bin/bash

set -e -E -u -o pipefail -o noclobber -o noglob -o braceexpand || exit 1
trap 'printf "[ee] failed: %s\n" "${BASH_COMMAND}" >&2' ERR || exit 1

test "${#}" -eq 0

cd -- "$( dirname -- "$( readlink -e -- "${0}" )" )"
test -d ./.generated

VERSION=2.3.1

cp -T ./repositories/rabbitmq-management-agent/ebin/rabbit_management_agent.app.in ./.generated/rabbit_management_agent.app

sed -r -e 's!%%VSN%%!'"${VERSION}"'!g' -i ./.generated/rabbit_management_agent.app

exit 0
