#!/bin/bash
for I in {0..16}; do
		for J in {0..16}; do
				CODE=${I} * 16 * ${J}
				echo "${CODE}"
				# echo "\u001b[38;5 ${CODE}m ${CODE}"
		done
done
