hs.grid.setGrid('12x12')
hs.window.animationDuration = 0


-- Desktop is my 49" super ultrawide.
-- Laptop is my MBP display.
local grid_positions = {
	fullscreen = {
		desktop = '3,0 6x12',
		laptop = '0,0 12x12',
	},
	left = {
		desktop = '3,0 3x12',
		laptop = '0,0 6x12',
	},
	right = {
		desktop = '6,0 3x12',
		laptop = '6,0 6x12',
	},
	farleft = {
		desktop = '0,0 3x12',
		laptop = '0,0 6x12',
	},
	farright = {
		desktop = '9,0 3x12',
		laptop = '0,0 12x12',
	},
	halfleft = {
		desktop = '0,0 6x12',
		laptop = '0,0 6x12',
	},
	halfright = {
		desktop = '6,0 6x12',
		laptop = '6,0 6x12',
	},
	floating = {
		desktop = '4,1 4x10',
		laptop = '2,2 10x10',
	},
}

function moveFocusedWindow(where)
	return function()
		local currentwindow = hs.window.focusedWindow()
		if not currentwindow:isStandard() then
			hs.logger.i("Cannot manipulate current window")
			return nil
		end
		
		local screen = currentwindow:screen()
		if screen:frame().w > (screen:frame().h * 2) then
			hs.grid.set(currentwindow, where.desktop, screen)
		else
			hs.grid.set(currentWindow, where.laptop, screen)
		end
	end
end

function toggleTerminalVisibility()
	return function()
		local app = hs.application.get("iTerm2")
		if app then
			if not app:mainWindow() then
				app:selectMenuItem({"iTerm2", "New OS window"})
				moveFocusedWindow(grid_positions.floating)()
			elseif app:isFrontmost() then
				app:hide()
			else
				app:activate()
				moveFocusedWindow(grid_positions.floating)()
			end
		else
			hs.application.launchOrFocus("iTerm2")
			moveFocusedWindow(grid_positions.floating)()
		end
	end
end

-- Ctrl + Alt + D, F, G should position a window half left, full screen, or half
-- right for streaming.
-- Ctrl + Alt + E, T should be offscreen left or right respectively when possible.
-- Ctrl + Alt + V should move a window to the "floating" position
-- Ctrl + Alt + C, B should position a window such that it's taking up half of the
-- screen (left or right respectively). Mostly useful for desktop.
hs.hotkey.bind({"ctrl", "alt"}, "d", moveFocusedWindow(grid_positions.left))
hs.hotkey.bind({"ctrl", "alt"}, "f", moveFocusedWindow(grid_positions.fullscreen))
hs.hotkey.bind({"ctrl", "alt"}, "g", moveFocusedWindow(grid_positions.right))
hs.hotkey.bind({"ctrl", "alt"}, "e", moveFocusedWindow(grid_positions.farleft))
hs.hotkey.bind({"ctrl", "alt"}, "t", moveFocusedWindow(grid_positions.farright))
hs.hotkey.bind({"ctrl", "alt"}, "c", moveFocusedWindow(grid_positions.halfleft))
hs.hotkey.bind({"ctrl", "alt"}, "b", moveFocusedWindow(grid_positions.halfright))
hs.hotkey.bind({"ctrl", "alt"}, "v", moveFocusedWindow(grid_positions.floating))

-- Ctrl + Space should toggle terminal visibility.
hs.hotkey.bind({"ctrl"}, "space", toggleTerminalVisibility())