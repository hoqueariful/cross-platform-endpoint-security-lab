#!/bin/bash

echo "======================================"
echo " Security Lab - Project Metrics"
echo "======================================"
echo

BEFORE=$(grep -E '^[0-9]+/tcp[[:space:]]+open' scans/nmap_before.txt | wc -l)
AFTER=$(grep -E '^[0-9]+/tcp[[:space:]]+open' scans/nmap_after.txt | wc -l)

echo "Baseline open TCP ports : $BEFORE"
echo "After-remediation ports : $AFTER"

if [ "$BEFORE" -gt 0 ]; then
    REDUCTION=$(python3 -c "print(round((($BEFORE-$AFTER)/$BEFORE)*100,1))")
    echo "Attack-surface reduction: ${REDUCTION}%"
else
    echo "Attack-surface reduction: N/A"
fi

echo
echo "======================================"
