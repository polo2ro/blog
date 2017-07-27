---
title: Typescript configuration
author: Paul
lang: en
---


This is a configuration for tslint tuned for server side typescript

```json
{
    "rules": {
        "cyclomatic-complexity": true,
        "max-line-length": {
            "options": [120]
        },
        "new-parens": true,
        "no-arg": true,
        "no-bitwise": true,
        "no-conditional-assignment": true,
        "no-consecutive-blank-lines": false,
        "only-arrow-functions": false,
        "typedef": [
            true,
            "call-signature",
              "arrow-call-signature",
              "parameter",
              "arrow-parameter",
              "property-declaration",
              "variable-declaration",
              "member-variable-declaration",
              "object-destructuring",
              "array-destructuring"
          ]
    }
}
```


I ended up adding the `typedef` rule to force types on all the definition, it is a verbose way to code but which avoids a lot of bugs related to types absence.

Type inference with the default settings lets the programmer do without types and I find that have lost all the benefit of typescript because you never know if type verification is done or not.

Then come the compilation settings with a basic `tsconfig.json`:

```json

{
    "compilerOptions": {
        "noImplicitAny": true,
        "target": "es6",
        "module": "commonjs",
        "outDir": "./build",
        "noUnusedLocals": true,
        "noUnusedParameters": false
    },
    "include": [
        "src/**/*"
    ],
    "exclude" : [
        "./build",
        "./node_modules"
    ]
}

```

please note that I use the `outDir` setting to avoid complied files in the source tree!

Here is an additional production file `tsconfig.prod.json`:


```json

{
    "extends" : "./tsconfig.json",
    "exclude" : [
        "./build",
        "./node_modules",
        "./src/spec"
    ]
}


```

Here "./src/spec" is excluded from output. In my npm configuration, types are included in dependencies but tests tools are excluded. with `npm install --production` followed by `tsc -p tsconfig.prod.json` I can build my production code without tests.
