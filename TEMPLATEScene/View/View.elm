module TEMPLATEScene.View.View exposing (..)

import TEMPLATEScene.Model.Models exposing (..)
import Graphics.SpriteEngine exposing (..)
import Html exposing (Html)


-- Draws the scene, based on the current state
drawTEMPLATEScene : TEMPLATESceneState -> Html msg
drawTEMPLATEScene sceneState =
    drawFrame
        {x=600, y=600}
        []