module View exposing (..)

import TEMPLATEScene.View.View exposing (..)
-- Add more scenes here
import Model exposing (..)
import Update exposing (..)
import Html exposing (Html)


-- Draws the current scene
view : Model -> Html Msg
view model =
    case model of
        TEMPLATEModel templateModel ->
            drawTEMPLATEScene templateModel |> (Html.map (\msg -> TEMPLATEMsg msg))
