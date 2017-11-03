## rosanbo.com


If content is modified, use:

    stack exec site build

If code from site.hs is modified, a rebuid is necessary:

    stack build
    stack exec site rebuild

A publish.sh file is created on repository root with:

    #!/bin/bash
    rsync -r --delete-excluded --size-only --rsh='ssh -p{ssh port}' --progress _site/ {ssh path to folder}



This repository contain my personal web site hosted at [rosanbo.com](http://www.rosanbo.com/).


Generated with [hakyll](http://jaspervdj.be/hakyll) and [clay](http://fvisser.nl/clay/).
