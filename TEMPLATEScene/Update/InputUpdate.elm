module TEMPLATEScene.Update.InputUpdate exposing (..)

import TEMPLATEScene.Model.Models exposing (..)


-- Updates the state of input processing,
-- such as which buttons are pressed or how
-- many times the mouse has been clicked
updateInputState : TEMPLATESceneState -> TEMPLATESceneState
updateInputState sceneState =
    sceneState
