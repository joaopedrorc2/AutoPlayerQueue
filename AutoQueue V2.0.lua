Settings = {
    Start = true, --n mecha :D
    atiQueue = true, --- pra vc n ir junto pro queue(nao mecha :D)
    Grabber = "Dragon Throw", --- Dragon Throw or Dragon Crush
    noSlow = true, ---apenas pra vc da final bow + grabber
    Velocity = 3.5 --Velocidade que vai ate o portal do queue
}

if not game:IsLoaded() then
    game.Loaded:Wait()
end

wait()

game:GetService("StarterGui"):SetCore("SendNotification",{
    Title = "Creditos",
    Text = "joaopedrorc2(vip)|Valentine150k(xKarlosAntony or Valentine150k)",
})

_G.Settings  = _G.Settings  or Settings

local RunService = game:GetService("RunService")
local player = game.Players.LocalPlayer
local TS = game:GetService("TweenService")
local uis = game:GetService("UserInputService")


if _G.Settings.Start == true then
    wait()
    if _G.Settings.noSlow == true then
        wait()
        local MoveNames = {
            "Look",
            "xx",
            "Action",
            "SuperAction",
            "Attacking",
            "Using",
            "heavy",
            "hyper",
            "Hyper",
            "Tele",
            "tele",
            "Slow",
            "Killed",
            "KiBlasted",
            "MoveStart",
            "Hyper",
            "Dodging",
            "KiBlasting",
            "Ki Blasting",
            "BStun",
            "creator",
            "KnockBacked",
            "NotHardBack",
            "evasive",
            "Beam",
            "Velocity",
            "zDASZzxc"
        }
        wait(1)
        RunService.Heartbeat:Connect(function()
            for i, v in pairs(MoveNames) do
                local a = player.Character:FindFirstChild(v)
                if a then
                    a:Destroy()
                end
            end
        end)
    end

    if _G.Settings.atiQueue == true then
        wait()
        repeat
            if game.Workspace["Wormhole"]:FindFirstChild("TouchInterest") then
                game.Workspace["Wormhole"]:FindFirstChild("TouchInterest"):Destroy()
            end
        until true
    end

    game:GetService("StarterGui"):SetCore("SendNotification",{
        Title = "Grabber",
        Text = "use k to grabber",
    })

    uis.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.Keyboard then
            if input.KeyCode == Enum.KeyCode.K then

                game:GetService("StarterGui"):SetCore("SendNotification",{
        			Title = "Portal queue",
        			Text = "use L to tp queue",
    			})

                local Graber = player.Backpack:FindFirstChild(_G.Settings.Grabber)
                if not Graber then
                    game:GetService("StarterGui"):SetCore("SendNotification",{
                        Title = "Warline",
                        Text = "Not Dragon Crush or Dragon Throw",
                    })
                end

                wait()

                if Graber then
                    Graber.Parent = player.Character
                    local b = Graber:FindFirstChild("Flip", true)
                    if b then
                        b:Destroy()
                    end
                    wait()
                    Graber:Activate()
                    wait()
                    Graber:Deactivate()
                    Graber.Parent = player.Backpack
                end
            end
        end
    end)

    uis.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.Keyboard then
            if input.KeyCode == Enum.KeyCode.L then
                local tween2 =TS:Create(player.Character.HumanoidRootPart, TweenInfo.new(_G.Settings.Velocity), {CFrame = game.Workspace["Wormhole"].CFrame})

                tween2:Play()

                if tween2.Completed:Wait() then
                    wait(2)
                    game:GetService("TeleportService"):Teleport(game.PlaceId, player)
                end
            end
        end
    end)
end