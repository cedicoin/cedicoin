#!/usr/bin/env bash

export LC_ALL=C
TOPDIR=${TOPDIR:-$(git rev-parse --show-toplevel)}
BUILDDIR=${BUILDDIR:-$TOPDIR}

BINDIR=${BINDIR:-$BUILDDIR/src}
MANDIR=${MANDIR:-$TOPDIR/doc/man}

CEDICOIND=${CEDICOIND:-$BINDIR/cedicoind}
CEDICOINCLI=${CEDICOINCLI:-$BINDIR/cedicoin-cli}
CEDICOINTX=${CEDICOINTX:-$BINDIR/cedicoin-tx}
WALLET_TOOL=${WALLET_TOOL:-$BINDIR/cedicoin-wallet}
CEDICOINQT=${CEDICOINQT:-$BINDIR/qt/cedicoin-qt}

[ ! -x $CEDICOIND ] && echo "$CEDICOIND not found or not executable." && exit 1

# The autodetected version git tag can screw up manpage output a little bit
read -r -a CEDIVER <<< "$($CEDICOINCLI --version | head -n1 | awk -F'[ -]' '{ print $6, $7 }')"

# Create a footer file with copyright content.
# This gets autodetected fine for cedicoind if --version-string is not set,
# but has different outcomes for cedicoin-qt and cedicoin-cli.
echo "[COPYRIGHT]" > footer.h2m
$CEDICOIND --version | sed -n '1!p' >> footer.h2m

for cmd in $CEDICOIND $CEDICOINCLI $CEDICOINTX $WALLET_TOOL $CEDICOINQT; do
  cmdname="${cmd##*/}"
  help2man -N --version-string=${CEDIVER[0]} --include=footer.h2m -o ${MANDIR}/${cmdname}.1 ${cmd}
  sed -i "s/\\\-${CEDIVER[1]}//g" ${MANDIR}/${cmdname}.1
done

rm -f footer.h2m
