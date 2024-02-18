-- This offsets file is used to change the z offsets of some props which do not place properly at exact position
-- The reason for that is, because the final coords while placing is taken from center of the props but most of the time gizmo is unable to pick it up properly.
-- this offsets will help you place the object at exact position.

-- While placing, if you notice a prop is changing its z, you can add the model and offset here and try it several times until you find the right offset.
-- I will try to add as many props as I can but you can also add your own props here.

Offsets = {
    ["v_ilev_mm_screen2"] = -1.9,
}