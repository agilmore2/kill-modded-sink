#!/bin/bash
diff -ruBbw -x logs -x \*MobAspects -x CustomSpawner -x DIAdvancedCompatibility.cfg -I "^ *#.*$" $1 $2
