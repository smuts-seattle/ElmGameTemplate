module TEMPLATEScene.Update.GameUpdate exposing (..)

import TEMPLATEScene.Model.Models exposing (..)

-- Updates the state of the game actors,
-- such as positions and damage.
updateGameState : TEMPLATESceneState -> TEMPLATESceneState
updateGameState sceneState =
    sceneState
