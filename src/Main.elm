module Main exposing (..)

import Browser
import Model exposing (..)
import Update exposing (..)
import View exposing (..)



-- The game program


main : Program String Model Msg
main =
    Browser.document
        { init = \_ -> ( initModel, Cmd.none )
        , subscriptions = subscriptions
        , view = \m -> Browser.Document "TEMPLATEGame" [ view m ]
        , update = update
        }
