module View exposing (..)

-- Add more scenes here

import Html exposing (Html)
import Model exposing (..)
import TEMPLATEScene.View.View exposing (..)
import Update exposing (..)



-- Draws the current scene


view : Model -> Html Msg
view model =
    case model of
        TEMPLATEModel templateModel ->
            drawTEMPLATEScene templateModel |> Html.map (\msg -> TEMPLATEMsg msg)
