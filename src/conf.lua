function love.conf(w)
    w.title = "Hungry Shark"
    w.window.width = 1440
    w.window.height = 870
    w.window.resizable = false
    -- En dessous, la version de löve sur lequel le jeu a été codé
    w.version = 11.3
    -- En dessous, anti aliasing
    w.window.msaa = 8
    -- En dessous, le numéro du moniteur sur lequel affiché la fenêtre
    w.window.display = 2
    w.window.vsync = 0
end