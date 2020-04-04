module TEMPLATEScene.View.View exposing (..)

import Graphics.SpriteEngine exposing (..)
import Html exposing (Html)
import TEMPLATEScene.Model.Models exposing (..)



-- Draws the scene, based on the current state


drawTEMPLATEScene : TEMPLATESceneState -> Html msg
drawTEMPLATEScene sceneState =
    drawFrame
        { x = 600, y = 600 }
        []
