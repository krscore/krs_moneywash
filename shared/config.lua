lib.locale()

cfg = {}

cfg.waitRewashing = 60000 -- The player must wait 1 minute before being able to launder dirty money again.
cfg.washDuration = 30000 -- The time it takes for the player to launder the money. 30 seconds.
cfg.percentage = 0.50 -- Laundering percentage.
cfg.iconDialog = 'fa-solid fa-sack-dollar' -- Dialog icon.
cfg.positionProgress = 'middle' -- Progress bar position.
cfg.positionWashing = { 
    {
        coords = vector3(637.0958, 2784.7517, 42.0103), -- Money laundering location.
        active = true, -- This blip is active and should be created.
        sprite = 500, -- Blip sprite ID for this location (change as needed).
        name = 'Money Wash' -- Define this in your locale for the blip name.
    },
    -- You can add more locations here with their own blip settings if needed
}
