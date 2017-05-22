module TEMPLATEScene.Update.ViewUpdate exposing (..)


import TEMPLATEScene.Model.Models exposing (..)


-- Updates the state of visual effects, 
-- such as animation frames
updateDrawState : TEMPLATESceneState -> TEMPLATESceneState
updateDrawState sceneState =
    sceneState