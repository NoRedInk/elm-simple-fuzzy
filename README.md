# Simple package for filtering strings.

## Example

```elm

filterSomeObjects =
    let
        languages =
            [ { name = "Elm" }
            , { name = "Ruby" }
            , { name = "Rust" }
            , { name = "Haskell" }
            , { name = "javascript" }
            , { name = "English" }
            ]
    in
        filter .name "el" languages
```

gives:

```elm

    [ { name = "Elm" }
    , { name = "Haskell"}
    , { name = "English"}
    ]

```
