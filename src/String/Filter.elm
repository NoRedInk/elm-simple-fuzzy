module String.Filter exposing (match, root)

{-| Fuzzy match through a list of strings

# Matching and Searching

@docs match

# Helpers

@docs root

-}

import String
import Char


{-| match allows you to see if the letters of your query
match within a bigger string.

    match "poo" "Poo" --> True
    match "poo" "Police" --> False
    match "poo" "Please be polite Online!" --> True

-}
match : String -> String -> Bool
match needle haystack =
    root needle
        |> String.foldl searchHelper (Just <| root haystack)
        |> isJust


{-| root strips a word down to just the lower case version of itself
without any punctuation or spacing.

    root "Wow, I'm excited!!!!" --> "wowimexcited"

-}
root : String -> String
root string =
    string
        |> String.toLower
        |> String.filter Char.isLower


searchHelper : Char -> Maybe String -> Maybe String
searchHelper letter restOfWord =
    case restOfWord of
        Just string ->
            case String.indexes (String.fromChar letter) string of
                [] ->
                    Nothing

                found :: _ ->
                    Just <| String.dropLeft (found + 1) string

        Nothing ->
            Nothing


isJust : Maybe a -> Bool
isJust maybeThing =
    case maybeThing of
        Just _ ->
            True

        Nothing ->
            False
