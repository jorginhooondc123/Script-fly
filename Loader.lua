local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local RS = game:GetService("RunService")
local Lighting = game:GetService("Lighting")
local TweenService = game:GetService("TweenService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local me = Players.LocalPlayer
local pg = me:WaitForChild("PlayerGui")
local IMG = "rbxassetid://125702985812849"
local genv = (getgenv and getgenv()) or {}
do
local function killAC(v)
if v.Name == "AntiCheatTrigger" then
local ok = pcall(function() v:Destroy() end)
if ok then print("tisha deleted AntiCheatTrigger") end
return ok
end
return false
end
for _, v in ipairs(game:GetDescendants()) do
if v.Name == "AntiCheatTrigger" then killAC(v) end
end
workspace.DescendantAdded:Connect(killAC)
end
pcall(function() if genv.TishaUI then genv.TishaUI:Destroy() end end)
pcall(function() if genv.TishaConn then genv.TishaConn:Disconnect() end end)
pcall(function() if genv.TishaConn2 then genv.TishaConn2:Disconnect() end end)
local WHITE = Color3.fromRGB(255, 255, 255)
local BLUE = Color3.fromRGB(56, 160, 255)
local BLACK = Color3.new(0, 0, 0)
local RED = Color3.fromRGB(255, 40, 40)
local GREEN = Color3.fromRGB(60, 255, 120)
local ZERO = Vector3.new(0, 0, 0)
local TAG_UP = Vector3.new(0, 0, 0)
local THEMES = {
White = {
bg = Color3.fromRGB(247, 249, 252), surface = WHITE, panel = Color3.fromRGB(235, 239, 246),
text = Color3.fromRGB(28, 34, 48), sub = Color3.fromRGB(112, 122, 140),
accent = Color3.fromRGB(46, 128, 245), border = Color3.fromRGB(221, 227, 236),
track = Color3.fromRGB(204, 211, 223),
},
Black = {
bg = Color3.fromRGB(22, 24, 30), surface = Color3.fromRGB(32, 35, 43), panel = Color3.fromRGB(43, 47, 58),
text = Color3.fromRGB(230, 234, 242), sub = Color3.fromRGB(133, 141, 158),
accent = Color3.fromRGB(64, 140, 255), border = Color3.fromRGB(54, 59, 71),
track = Color3.fromRGB(62, 68, 82),
},
Purple = {
bg = Color3.fromRGB(24, 20, 34), surface = Color3.fromRGB(35, 29, 50), panel = Color3.fromRGB(48, 40, 69),
text = Color3.fromRGB(236, 230, 248), sub = Color3.fromRGB(150, 138, 176),
accent = Color3.fromRGB(150, 98, 255), border = Color3.fromRGB(60, 50, 84),
track = Color3.fromRGB(72, 60, 100),
},
Emerald = {
bg = Color3.fromRGB(16, 26, 24), surface = Color3.fromRGB(24, 38, 35), panel = Color3.fromRGB(33, 52, 48),
text = Color3.fromRGB(228, 244, 238), sub = Color3.fromRGB(120, 156, 146),
accent = Color3.fromRGB(34, 197, 128), border = Color3.fromRGB(40, 62, 57),
track = Color3.fromRGB(50, 78, 72),
},
Rose = {
bg = Color3.fromRGB(30, 19, 25), surface = Color3.fromRGB(43, 28, 36), panel = Color3.fromRGB(58, 38, 49),
text = Color3.fromRGB(250, 232, 240), sub = Color3.fromRGB(176, 134, 152),
accent = Color3.fromRGB(244, 86, 150), border = Color3.fromRGB(74, 48, 62),
track = Color3.fromRGB(88, 58, 74),
},
Crimson = {
bg = Color3.fromRGB(26, 18, 19), surface = Color3.fromRGB(38, 26, 27), panel = Color3.fromRGB(52, 35, 37),
text = Color3.fromRGB(248, 232, 232), sub = Color3.fromRGB(168, 132, 132),
accent = Color3.fromRGB(232, 64, 64), border = Color3.fromRGB(68, 46, 47),
track = Color3.fromRGB(82, 56, 58),
},
Ocean = {
bg = Color3.fromRGB(15, 24, 32), surface = Color3.fromRGB(22, 36, 48), panel = Color3.fromRGB(30, 50, 66),
text = Color3.fromRGB(226, 242, 250), sub = Color3.fromRGB(116, 152, 176),
accent = Color3.fromRGB(20, 184, 220), border = Color3.fromRGB(38, 60, 78),
track = Color3.fromRGB(46, 74, 96),
},
Sunset = {
bg = Color3.fromRGB(28, 21, 17), surface = Color3.fromRGB(41, 31, 25), panel = Color3.fromRGB(56, 42, 34),
text = Color3.fromRGB(250, 238, 226), sub = Color3.fromRGB(172, 148, 128),
accent = Color3.fromRGB(255, 138, 48), border = Color3.fromRGB(72, 54, 42),
track = Color3.fromRGB(88, 66, 52),
},
}
local T = THEMES.Black
local themed = {}
local themeHooks = {}
local function paint(o, prop, key)
themed[#themed + 1] = {o, prop, key}
o[prop] = T[key]
end
local function applyTheme(name)
T = THEMES[name] or THEMES.White
for i = #themed, 1, -1 do
local e = themed[i]
if e[1].Parent then
e[1][e[2]] = T[e[3]]
else
table.remove(themed, i)
end
end
for _, f in ipairs(themeHooks) do pcall(f) end
end
local function mk(class, props, parent)
local o = Instance.new(class)
for k, v in pairs(props) do o[k] = v end
o.Parent = parent
return o
end
local function round(o, r)
local c = Instance.new("UICorner")
c.CornerRadius = UDim.new(0, r)
c.Parent = o
end
local function stroke(o, th)
local s = Instance.new("UIStroke")
s.Thickness = th
s.Color = WHITE
s.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
s.Parent = o
return s
end
local function outline(o)
local s = Instance.new("UIStroke")
s.Thickness = 1
s.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
s.Parent = o
paint(s, "Color", "border")
end
local function makeDraggable(btn)
local dragging, dragInput, dragStart, startPos
local state = {moved = false}
btn.InputBegan:Connect(function(input)
if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
dragging = true
state.moved = false
dragStart = input.Position
startPos = btn.Position
input.Changed:Connect(function()
if input.UserInputState == Enum.UserInputState.End then
dragging = false
end
end)
end
end)
btn.InputChanged:Connect(function(input)
if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
dragInput = input
end
end)
UIS.InputChanged:Connect(function(input)
if input == dragInput and dragging then
local delta = input.Position - dragStart
if delta.Magnitude > 8 then state.moved = true end
if state.moved then
btn.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end
end
end)
return state
end
task.wait(5)
local gui = Instance.new("ScreenGui")
gui.Name = "TishaCleanerGui"
gui.ResetOnSpawn = false
gui.IgnoreGuiInset = true
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
do
local okParent = pcall(function() gui.Parent = (gethui and gethui()) or pg end)
if not okParent or not gui.Parent then gui.Parent = pg end
end
genv.TishaUI = gui
local WindUI
do
local okLib, lib = pcall(function()
return loadstring(game:HttpGet("https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua"))()
end)
if not okLib or not lib then
error("Tisha's Cleaner GUI: could not load WindUI")
end
WindUI = lib
end
pcall(function() if genv.TishaWindow then genv.TishaWindow:Destroy() end end)
local Window = WindUI:CreateWindow({
Title = "Tisha's Cleaner GUI",
Author = "Dandy's World",
Icon = "brush-cleaning",
Theme = "Dark",
Folder = "TishaCleaner",
ToggleKey = Enum.KeyCode.RightShift,
})
genv.TishaWindow = Window
-- botao de abrir sem a vassoura (a vassoura fica so na janela)
pcall(function() Window:EditOpenButton({Icon = ""}) end)
local TAB_ICONS = {Player = "user", Visuals = "eye", Automations = "bot", Teleport = "map-pin", Scripts = "scroll-text"}
local winTabs = {}
for _, name in ipairs({"Player", "Visuals", "Automations", "Teleport", "Scripts"}) do
winTabs[name] = Window:Tab({Title = name, Icon = TAB_ICONS[name]})
end
local ComponentBuilder = {queue = {}, seq = 0, order = {}}
local function queue(kind, tabName, config)
ComponentBuilder.seq = ComponentBuilder.seq + 1
local q = ComponentBuilder.queue
q[tabName] = q[tabName] or {}
q[tabName][#q[tabName] + 1] = {kind = kind, config = config, seq = ComponentBuilder.seq}
end
function ComponentBuilder:CreateToggle(tabName, config) queue("toggle", tabName, config) end
function ComponentBuilder:CreateButton(tabName, config) queue("button", tabName, config) end
function ComponentBuilder:CreateSlider(tabName, config) queue("slider", tabName, config) end
function ComponentBuilder:CreateDropdown(tabName, config) queue("drop", tabName, config) end
function ComponentBuilder:CreateMultiDropdown(tabName, config) queue("multi", tabName, config) end
local function buildOne(tab, e)
local c = e.config
local name = c.Name or "Option"
local cb = c.Callback or function() end
if e.kind == "toggle" then
local ready = false
tab:Toggle({
Title = name,
Value = c.CurrentValue or false,
Callback = function(v)
if ready then pcall(cb, v) end
end,
})
ready = true
if c.CurrentValue then pcall(cb, true) end
elseif e.kind == "button" then
tab:Button({Title = name, Callback = function() pcall(cb) end})
elseif e.kind == "slider" then
local mn, mx = c.Min or 1, c.Max or 50
local df = math.clamp(c.Default or 25, mn, mx)
tab:Slider({
Title = name,
Step = c.Step or 1,
Value = {Min = mn, Max = mx, Default = df},
Callback = function(v) pcall(cb, v) end,
})
elseif e.kind == "drop" then
local opts = c.Options or {}
tab:Dropdown({
Title = name,
Values = opts,
Value = c.Default or opts[1],
Callback = function(v) pcall(cb, v) end,
})
else
tab:Dropdown({
Title = name,
Values = c.Options or {},
Value = c.Default or {},
Multi = true,
AllowNone = true,
Callback = function(v)
local map = {}
if type(v) == "table" then
for k, val in pairs(v) do
if type(k) == "number" then map[val] = true
elseif val then map[k] = true end
end
end
pcall(cb, map)
end,
})
end
end
function ComponentBuilder:Build()
for tabName, list in pairs(ComponentBuilder.queue) do
local tab = winTabs[tabName]
if tab then
local pos = {}
for i, n in ipairs(ComponentBuilder.order[tabName] or {}) do pos[n] = i end
table.sort(list, function(a, b)
local pa = pos[a.config.Name] or (1000 + a.seq)
local pb = pos[b.config.Name] or (1000 + b.seq)
return pa < pb
end)
for _, e in ipairs(list) do
pcall(buildOne, tab, e)
end
end
end
ComponentBuilder.queue = {}
end
local S = {
esItem = false, esTw = false, esGen = false, esPl = false, esTend = false, esHand = false, esPud = false,
noTags = false, noTagKind = {}, size = 14
}
local camPos = ZERO
local torsoCache = {}
local itemCache = {}
local genCompleteTimes = {}
local genProg = {}
local function inWorld(i)
return i.Parent ~= nil and i:IsDescendantOf(workspace)
end
local function partOf(x)
if x:IsA("BasePart") then return x end
if x:IsA("Model") then
local hrp = x:FindFirstChild("HumanoidRootPart")
if hrp then return hrp end
return x.PrimaryPart or x:FindFirstChildWhichIsA("BasePart", true)
end
return x:FindFirstChildWhichIsA("BasePart", true)
end
local function torsoOf(x)
local t = torsoCache[x]
if t and t.Parent then return t end
t = x:FindFirstChild("UpperTorso") or x:FindFirstChild("Torso")
or x:FindFirstChild("HumanoidRootPart") or partOf(x)
torsoCache[x] = t
return t
end
S.headCache = setmetatable({}, {__mode = "k"})
local function headOf(x)
local h = S.headCache[x]
if h and h.Parent then return h end
h = x:FindFirstChild("Head")
if not (h and h:IsA("BasePart")) then h = torsoOf(x) end
S.headCache[x] = h
return h
end
local HEAD_UP = Vector3.new(0, 0, 0)
local function plateOf(g)
local valve = g:FindFirstChild("Valve", true)
if valve then
if valve:IsA("BasePart") then return valve end
local bp = valve:FindFirstChildWhichIsA("BasePart", true)
if bp then return bp end
end
local p = g:FindFirstChild("Top_Diamond_Plate", true)
if p and not p:IsA("BasePart") then
p = p:FindFirstChildWhichIsA("BasePart", true)
end
return p or partOf(g)
end
S.plateCache = setmetatable({}, {__mode = "k"})
local function topPlateOf(g)
local cached = S.plateCache[g]
if cached and cached.Parent then return cached end
local res
local plate = g:FindFirstChild("Top_Diamond_Plate", true)
if plate then
if plate:IsA("BasePart") then res = plate
else res = plate:FindFirstChildWhichIsA("BasePart", true) end
end
res = res or plateOf(g)
S.plateCache[g] = res
return res
end
S.monAlias = {lethalanchorsoundtwisted = "DiodaMonster"}
function S.monKey(m)
local n = tostring(m.Name)
return S.monAlias[n:lower()] or n
end
local snap = {mon = {}, gen = {}, item = {}}
task.spawn(function()
while true do
local mon, gen, item = {}, {}, {}
local r = workspace:FindFirstChild("CurrentRoom")
if r then
for _, m in ipairs(r:GetChildren()) do
local a = m:FindFirstChild("Monsters")
if a then for _, x in ipairs(a:GetChildren()) do mon[#mon + 1] = x end end
local b = m:FindFirstChild("Generators")
if b then for _, x in ipairs(b:GetChildren()) do gen[#gen + 1] = x end end
local c = m:FindFirstChild("Items")
if c then for _, x in ipairs(c:GetChildren()) do item[#item + 1] = x end end
end
-- andar com estrutura diferente: procura as pastas em qualquer nivel
if #gen == 0 and #item == 0 and #mon == 0 and snap.deepUsed and tick() - (snap.deepAt or -100) <= 1 then
mon, gen, item = snap.mon, snap.gen, snap.item
elseif #gen == 0 and #item == 0 and #mon == 0 and tick() - (snap.deepAt or -100) > 1 then
snap.deepAt = tick()
for _, d in ipairs(r:GetDescendants()) do
if d:IsA("Folder") or d:IsA("Model") then
local dn = d.Name
if dn == "Generators" then for _, x in ipairs(d:GetChildren()) do gen[#gen + 1] = x end
elseif dn == "Items" then for _, x in ipairs(d:GetChildren()) do item[#item + 1] = x end
elseif dn == "Monsters" then for _, x in ipairs(d:GetChildren()) do mon[#mon + 1] = x end end
end
end
snap.deepUsed = (#gen + #item + #mon) > 0
end
else
snap.deepUsed = false
end
snap.mon, snap.gen, snap.item = mon, gen, item
task.wait(0.2)
end
end)
local haz = {tend = {}, hand = {}, pud = {}}
haz.cls = {Part = true, MeshPart = true, UnionOperation = true, WedgePart = true, CornerWedgePart = true,
TrussPart = true, SpawnLocation = true, Seat = true, VehicleSeat = true, Model = true, Decal = true, Texture = true}
local function inPlayer(v)
local a = v
while a and a ~= workspace do
if a:IsA("Model") and Players:GetPlayerFromCharacter(a) then return true end
a = a.Parent
end
return false
end
local function hazKind(v, n)
n = n or v.Name:lower()
if n:find("tendril", 1, true) or n:find("tentacle", 1, true) then return "tend" end
if n:find("puddle", 1, true) then
if n:find("ichor", 1, true) then return "pud" end
local p = v.Parent
for _ = 1, 4 do
if not p or p == workspace then break end
if p.Name:lower():find("ichor", 1, true) then return "pud" end
p = p.Parent
end
return nil
end
local nn = (n:gsub("[^%a]", ""))
if nn == "hand" or nn == "blothand" or nn == "blotshand" then return "hand" end
if n:find("hand", 1, true) and not n:find("handle", 1, true) then
local p = v
for _ = 1, 6 do
if not p or p == workspace then break end
if p.Name:lower():find("blot", 1, true) then return "hand" end
p = p.Parent
end
end
end
local function hazClass(v)
return haz.cls[v.ClassName] == true
end
local function isHandOrInsideHand(t)
local a = t
for _ = 1, 7 do
if not a or a == workspace then break end
if hazKind(a) == "hand" then return true end
a = a.Parent
end
return false
end
local function hazScan(v)
if not hazClass(v) then return end
local n = v.Name:lower()
if not (n:find("tendril", 1, true) or n:find("tentacle", 1, true) or n:find("puddle", 1, true)
or n:find("hand", 1, true) or n:find("ichor", 1, true) or n:find("blot", 1, true)) then return end
local isDecal = v:IsA("Decal") or v:IsA("Texture")
local t = isDecal and v.Parent or v
if not (t and (t:IsA("BasePart") or t:IsA("Model"))) then return end
local k = hazKind(v, n)
if not k then return end
if v == t then
local p = t.Parent
if p and (p:IsA("BasePart") or p:IsA("Model")) and hazKind(p) == k then return end
end
if k == "pud" and isHandOrInsideHand(t) then return end
if inPlayer(t) then return end
haz[k][t] = true
end
local hazStarted = false
local function hazStart()
if hazStarted then return end
hazStarted = true
for _, v in ipairs(workspace:GetDescendants()) do hazScan(v) end
workspace.DescendantAdded:Connect(hazScan)
end
local reg = {item = {}, twist = {}, gen = {}, plr = {}, tend = {}, hand = {}, pud = {}}
local seen = {}
local sizeCache = {}
local function getSize(sz, lines)
local key = sz * 100 + lines
local c = sizeCache[key]
if not c then
c = UDim2.new(0, 400, 0, math.ceil(sz * 1.25) * lines)
sizeCache[key] = c
end
return c
end
local function newGui(part, off)
local g = Instance.new("BillboardGui")
g.Name = "PlaggESP"
g.AlwaysOnTop = true
g.StudsOffset = off
g.Adornee = part
g.Parent = part
local t = Instance.new("TextLabel")
t.Name = "T"
t.Size = UDim2.new(1, 0, 1, 0)
t.BackgroundTransparency = 1
t.TextScaled = false
t.TextWrapped = false
t.Font = S.espFont or Enum.Font.GothamBold
t.TextStrokeColor3 = BLACK
t.TextStrokeTransparency = 0
t.Parent = g
return g, t
end
local function put(kind, target, part, txt, color, stroke, outline, fill, fillT, noHl, offOverride)
local bag = reg[kind]
local r = bag[target]
if not r then
r = {}
bag[target] = r
end
seen[r] = true
r.t = tick()
local tagOn = not (S.noTags and S.noTagKind[kind])
if tagOn then
local off = offOverride or ((kind == "plr" or kind == "twist") and ZERO or TAG_UP)
if not r.gui or not r.gui.Parent or r.part ~= part then
if r.gui then r.gui:Destroy() end
r.gui, r.lbl = newGui(part, off)
r.part = part
end
if r.gui.StudsOffset ~= off then r.gui.StudsOffset = off end
if kind == "pud" then
local now = tick()
if not r.pOff or r.pPart ~= part or now - (r.pAt or 0) > 1 then
r.pAt = now
r.pPart = part
local ok, cf, sz = pcall(function()
if target:IsA("Model") then return target:GetBoundingBox() end
return target.CFrame, target.Size
end)
if ok and cf and sz then
r.pOff = cf.Position - Vector3.new(0, sz.Y / 2, 0) + Vector3.new(0, 2, 0) - part.Position
else
r.pOff = ZERO
end
end
if r.gui.StudsOffsetWorldSpace ~= r.pOff then r.gui.StudsOffsetWorldSpace = r.pOff end
end
local lines = txt:find("\n", 1, true) and 2 or 1
local sz = getSize(S.size, lines)
if r.gui.Size ~= sz then r.gui.Size = sz end
if r.lbl.Text ~= txt then r.lbl.Text = txt end
if r.lbl.TextSize ~= S.size then r.lbl.TextSize = S.size end
local sc = stroke or BLACK
if r.lbl.TextStrokeColor3 ~= sc then r.lbl.TextStrokeColor3 = sc end
if r.lbl.TextColor3 ~= color then r.lbl.TextColor3 = color end
elseif r.gui then
r.gui:Destroy()
r.gui, r.lbl, r.part = nil, nil, nil
end
if not noHl then
local hasHl = r.hl and r.hl.Parent
if not hasHl and (S.hlN or 0) >= 95 then
-- limite de highlights: usa SelectionBox no lugar
if r.hl then r.hl:Destroy() r.hl = nil end
if not r.sb or not r.sb.Parent then
local b = Instance.new("SelectionBox")
b.Name = "TishaSB"
b.LineThickness = 0.06
b.SurfaceTransparency = 1
b.Adornee = target
b.Parent = pg
r.sb = b
end
local oc = outline or color
if r.sb.Color3 ~= oc then r.sb.Color3 = oc end
else
if r.sb then r.sb:Destroy() r.sb = nil end
S.hlN = (S.hlN or 0) + 1
if not r.hl or not r.hl.Parent then
local h = Instance.new("Highlight")
h.Name = "PlaggHL"
h.OutlineTransparency = 0
h.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
if kind == "pud" then
h.Adornee = target
h.Parent = pg
else
h.Parent = target
end
r.hl = h
end
local oc = outline or color
local fc = fill or color
local ft = fillT or 1
if r.hl.OutlineColor ~= oc then r.hl.OutlineColor = oc end
if r.hl.FillColor ~= fc then r.hl.FillColor = fc end
if r.hl.FillTransparency ~= ft then r.hl.FillTransparency = ft end
end
elseif r.hl or r.sb then
if r.hl then r.hl:Destroy() r.hl = nil end
if r.sb then r.sb:Destroy() r.sb = nil end
end
end
local function sweep(force)
for _, bag in pairs(reg) do
for target, r in pairs(bag) do
if force or not target.Parent or (not seen[r] and tick() - (r.t or 0) > 0.35) then
if r.gui then pcall(function() r.gui:Destroy() end) end
if r.hl then pcall(function() r.hl:Destroy() end) end
if r.sb then pcall(function() r.sb:Destroy() end) end
bag[target] = nil
end
end
end
seen = {}
S.hlN = 0
end
local function footprint(inst, part)
local ok, size = pcall(function()
if inst:IsA("Model") then return inst:GetExtentsSize() end
return part.Size
end)
if not ok or not size then size = part.Size end
return math.max(math.max(size.X, size.Z) / 2, 2)
end
local function nearestN(set, n, overlap)
local list = {}
for inst in pairs(set) do
if inWorld(inst) then
local part = partOf(inst)
if part then list[#list + 1] = {inst, part, (part.Position - camPos).Magnitude} end
else
set[inst] = nil
end
end
local cap = overlap and 120 or 400
if #list > cap then
table.sort(list, function(a, b) return a[3] < b[3] end)
for i = #list, cap + 1, -1 do list[i] = nil end
end
if overlap then
local top = {}
for _, e in ipairs(list) do
local hidden = false
local a = e[1].Parent
local depth = 0
while a and a ~= workspace and depth < 12 do
if set[a] then hidden = true break end
a = a.Parent
depth = depth + 1
end
if not hidden then
e[4] = footprint(e[1], e[2])
top[#top + 1] = e
end
end
S.prevNear = S.prevNear or {}
local prev = S.prevNear[set] or {}
table.sort(top, function(a, b)
local pa, pb = prev[a[1]] == true, prev[b[1]] == true
if pa ~= pb then return pa end
return a[3] < b[3]
end)
local out = {}
for _, e in ipairs(top) do
local dup = false
local ep = e[2].Position
for _, k in ipairs(out) do
local kp = k[2].Position
local dx, dz = ep.X - kp.X, ep.Z - kp.Z
local reach = e[4] + k[4]
if dx * dx + dz * dz <= reach * reach then
dup = true
break
end
end
if not dup then
out[#out + 1] = e
if #out >= n then break end
end
end
local np = {}
for _, e in ipairs(out) do np[e[1]] = true end
S.prevNear[set] = np
return out
end
if #list <= n then return list end
table.sort(list, function(a, b) return a[3] < b[3] end)
for i = n + 1, #list do list[i] = nil end
return list
end
local function dropPudsOnHands(puds, hands)
if #hands == 0 then return puds end
local out = {}
for _, pe in ipairs(puds) do
local bad = false
for _, h in ipairs(hands) do
if pe[1] == h[1] or pe[1]:IsDescendantOf(h[1]) or h[1]:IsDescendantOf(pe[1]) then
bad = true
break
end
if not h[4] then h[4] = footprint(h[1], h[2]) end
local hp, pp = h[2].Position, pe[2].Position
local dx, dz = hp.X - pp.X, hp.Z - pp.Z
if dx * dx + dz * dz <= h[4] * h[4] then
bad = true
break
end
end
if not bad then out[#out + 1] = pe end
end
return out
end
local function itemLabel(it)
local pp = it:FindFirstChildWhichIsA("ProximityPrompt", true)
local t = pp and pp.ObjectText
if type(t) == "string" and t ~= "" then return t end
return (tostring(it.Name):gsub("(%l)(%u)", "%1 %2"))
end
local ITEM_STYLES = {
{"starpillow", Color3.fromHSV(0.56, 1, 1), WHITE},
{"jawbreaker", Color3.fromHSV(0.38, 1, 1), WHITE},
{"proteinbar", Color3.fromHSV(0.38, 1, 1), WHITE},
{"skillcheck", Color3.fromHSV(0.11, 1, 1), WHITE},
{"extraction", Color3.fromHSV(0.75, 1, 1), WHITE},
{"stealth", Color3.fromHSV(0.53, 1, 1), WHITE},
{"speedcandy", Color3.fromHSV(0.17, 1, 1), WHITE},
{"jumper", Color3.fromHSV(0.75, 1, 1), WHITE},
{"instruction", Color3.fromHSV(0.75, 1, 1), WHITE},
{"bandage", Color3.fromHSV(0.93, 1, 1), WHITE},
{"healthkit", Color3.fromHSV(0.93, 1, 1), WHITE},
{"chocolate", Color3.fromHSV(0.38, 1, 1), WHITE},
{"candy", Color3.fromHSV(0.38, 1, 1), WHITE},
{"pop", Color3.fromHSV(0.38, 1, 1), WHITE},
{"gumball", Color3.fromHSV(0.38, 1, 1), WHITE},
{"horn", Color3.fromHSV(0.17, 1, 1), WHITE},
{"tape", Color3.fromHSV(0.38, 1, 1), WHITE},
{"ornament", Color3.fromHSV(0.38, 1, 1), WHITE, "gr"},
{"christmascookie", Color3.fromHSV(0.38, 1, 1), WHITE, "gr"},
{"basket", Color3.fromHSV(0.83, 1, 1), WHITE, "pastel"},
{"stopwatch", Color3.fromHSV(0.11, 1, 1), WHITE},
{"bonbon", Color3.fromHSV(0.75, 1, 1), WHITE},
{"valve", Color3.fromHSV(0.75, 1, 1), WHITE},
{"smokebomb", Color3.fromHSV(0.75, 1, 1), WHITE},
{"dandyeasteregg", Color3.fromHSV(0.38, 1, 1), WHITE},
{"ejectbutton", Color3.fromRGB(204, 160, 0), WHITE},
}
local function itemStyle(name)
local n = tostring(name):lower()
for _, st in ipairs(ITEM_STYLES) do
if n:find(st[1], 1, true) then return st[2], st[3], st[4] end
end
return WHITE, WHITE
end
local function shortName(b)
if b == "RazzleDazzle" then return "R&D" end
return b
end
local function researchOf(raw)
raw = tostring(raw)
local pd = ReplicatedStorage:FindFirstChild("PlayerData")
local mine = pd and pd:FindFirstChild(tostring(me.UserId))
local rs = mine and mine:FindFirstChild("Research")
if not rs then return nil end
local base = raw:gsub("Monster", "")
local e = rs:FindFirstChild(base .. "Monster") or rs:FindFirstChild(raw) or rs:FindFirstChild(base)
if not e then
local want = (base .. "monster"):lower()
for _, c in ipairs(rs:GetChildren()) do
local cn = c.Name:lower()
if cn == want or cn == base:lower() then e = c break end
end
end
if not e then return 0 end
local v = e
if not e:IsA("ValueBase") then
v = e:FindFirstChild("Value") or e:FindFirstChildWhichIsA("ValueBase", true)
end
if v and v:IsA("ValueBase") then
local x = v.Value
if type(x) == "number" then return math.floor(x * 100 + 0.5) / 100 end
if type(x) == "string" then return tonumber(x) end
end
return nil
end
local function capTwisted(it)
local pr = it:FindFirstChild("Prompt", true)
local m = pr and pr:FindFirstChild("Monster", true)
local v = m
if m and not m:IsA("ValueBase") then v = m:FindFirstChild("Value", true) end
if v and v:IsA("ValueBase") then
local x = v.Value
if typeof(x) == "Instance" then x = x.Name end
if x ~= nil and tostring(x) ~= "" then
local raw = tostring(x)
local base = raw:gsub("Monster", "")
local txt = shortName(base)
local pct = researchOf(raw)
if pct then txt = txt .. " | " .. math.floor(pct + 0.5) .. "%" end
return txt, base
end
end
end
local function itemData(it)
local now = tick()
local c = itemCache[it]
if not c then
local n = it.Name:lower()
c = {t = -100}
if n:find("capsule", 1, true) and n:find("fake", 1, true) then
c.fake = true
c.label = "Fake Capsule"
c.color = RED
c.stroke = WHITE
elseif n:find("capsule", 1, true) then
c.cap = true
c.label = "Research Capsule"
elseif n:find("pumpkin", 1, true) then
c.pump = true
c.kind = "pumpkin"
c.label = "Pumpkin"
end
c.pillow = (n:gsub("[^%a]", "")):find("starpillow", 1, true) ~= nil
itemCache[it] = c
end
if not c.part or not c.part.Parent then c.part = partOf(it) end
if not c.cap and not c.pump and not c.fake and not it.Name:lower():find("fake", 1, true) and now - (c.t3 or -100) >= 1 then
c.t3 = now
if capTwisted(it) then
c.cap = true
c.label = "Research Capsule"
end
end
if now - c.t >= 3 then
c.t = now
if not c.cap and not c.pump and not c.fake then
c.label = itemLabel(it)
c.color, c.stroke, c.anim = itemStyle(it.Name)
end
end
if c.cap and now - (c.t2 or -100) >= 1 then
c.t2 = now
local tw, base = capTwisted(it)
c.twBase = base
local rn = base and S.rarityName and S.rarityName(base)
local l1 = rn and ("Research Capsule | " .. rn) or "Research Capsule"
c.label = tw and (l1 .. "\n" .. tw) or l1
end
return c, c.label
end
local RARITY = {}
for rarity, list in pairs({
common = {"Boxten", "Brusha", "Cosmo", "Looey", "Poppy", "Shrimpo", "Tisha", "Yatta"},
uncommon = {"Brightney", "Connie", "Finn", "RazzleDazzle", "Razzle", "Dazzle", "Rodger", "Teagan", "Toodles"},
rare = {"Blot", "Flutter", "Gigi", "Glisten", "Goob", "Scraps", "Squirm", "Waxwell"},
main = {"Astro", "Pebble", "Shelly", "Sprout", "Vee"},
lethal = {"Dandy", "Dyle", "Dessa", "Dioda"},
}) do
for _, n in ipairs(list) do RARITY[n:lower()] = rarity end
end
function S.rarityName(base)
local r = RARITY[tostring(base):lower()]
return r and (r:sub(1, 1):upper() .. r:sub(2)) or nil
end
local RARE_BLUE = Color3.fromHSV(0.56, 1, 1)
local COMMON_GREEN = Color3.fromHSV(0.38, 1, 1)
local function capColor(base)
local r = RARITY[tostring(base):lower()]
if r == "common" then return COMMON_GREEN end
if r == "uncommon" then return Color3.fromHSV(0.38, 1, 1) end
if r == "rare" then return RARE_BLUE end
if r == "main" then return Color3.fromHSV((tick() * 0.5) % 1, 1, 1) end
if r == "lethal" then return Color3.fromHSV(0, 1, 1) end
return Color3.fromHSV(0.17, 1, 1)
end
local function pumpColor()
local t = (math.sin(tick() * 3) + 1) / 2
return Color3.fromHSV(0.11 - t * 0.05, 1, 1)
end
local S_nofog = false
local S_fb = false
local S_fb2 = false
local S_day = false
local function keeper()
local store = setmetatable({}, {__mode = "k"})
local function set(i, p, v)
local t = store[i]
if not t then t = {} store[i] = t end
if t[p] == nil then t[p] = i[p] end
if i[p] ~= v then i[p] = v end
end
local function undo()
for i, t in pairs(store) do
for p, v in pairs(t) do
pcall(function() i[p] = v end)
end
end
store = setmetatable({}, {__mode = "k"})
end
return set, undo
end
local fogSet, fogUndo = keeper()
local brSet, brUndo = keeper()
local dtSet, dtUndo = keeper()
local atmosAt = 0
local ccAt = 0
local function worldLighting()
if S_day then
dtSet(Lighting, "ClockTime", 14)
end
if S_nofog then
local now = tick()
if now - atmosAt > 2 then
atmosAt = now
for _, a in ipairs(Lighting:GetChildren()) do
if a:IsA("Atmosphere") then
fogSet(a, "Density", 0)
fogSet(a, "Offset", 0)
fogSet(a, "Haze", 0)
fogSet(a, "Glare", 0)
end
end
end
fogSet(Lighting, "FogEnd", 1e9)
fogSet(Lighting, "FogStart", 1e9)
end
if S_fb or S_fb2 then
local full = S_fb
brSet(Lighting, "Brightness", full and 2 or 1)
if full then brSet(Lighting, "ClockTime", 14) end
brSet(Lighting, "GlobalShadows", false)
local amb = full and WHITE or Color3.fromRGB(150, 150, 150)
brSet(Lighting, "Ambient", amb)
brSet(Lighting, "OutdoorAmbient", amb)
brSet(Lighting, "ExposureCompensation", 0)
local now = tick()
if now - ccAt > 0.5 then
ccAt = now
for _, parent in ipairs({Lighting, workspace.CurrentCamera}) do
if parent then
for _, e in ipairs(parent:GetChildren()) do
if e:IsA("ColorCorrectionEffect") then
brSet(e, "Brightness", 0)
brSet(e, "TintColor", WHITE)
end
end
end
end
end
end
end
S.twLbl = setmetatable({}, {__mode = "k"})
S.TW_RED = Color3.fromHSV(0, 1, 1)
S.C_TEND = Color3.fromHSV(0.17, 1, 1)
S.C_HAND = Color3.fromHSV(0.53, 1, 1)
S.C_PUD = Color3.fromHSV(0.83, 1, 1)
S.PUD_OFF = Vector3.new(0, -3.5, 0)
S.GEN_GRAY = Color3.fromRGB(128, 128, 128)
RS.RenderStepped:Connect(function(dt)
local any = S.esTw or S.esGen or S.esPl or S.esTend or S.esHand or S.esPud or S.esItem
S.acc = (S.acc or 0) + dt
if not any and S.espWas then
S.espWas = false
sweep(true)
end
if any and S.acc >= 0.08 then
S.acc = 0
S.espWas = true
if S.esTend or S.esHand or S.esPud then
local cam = workspace.CurrentCamera
if cam then camPos = cam.CFrame.Position end
end
if S.esTw then
for _, m in ipairs(snap.mon) do
local part = headOf(m)
if part then
local lbl = S.twLbl[m]
if not lbl then
lbl = "Twisted " .. shortName((S.monKey(m):gsub("Monster", "")))
S.twLbl[m] = lbl
end
put("twist", m, part, lbl, S.TW_RED, WHITE, S.TW_RED, S.TW_RED, 0.5, nil, HEAD_UP) end
end
end
if S.esGen then
local nowTick = tick()
for _, g in ipairs(snap.gen) do
local st = g:FindFirstChild("Stats")
local completed = st and st:FindFirstChild("Completed") and st.Completed.Value == true
if completed then
if not genCompleteTimes[g] then
genCompleteTimes[g] = nowTick + 1
end
else
genCompleteTimes[g] = nil
end
if not completed or (genCompleteTimes[g] and nowTick < genCompleteTimes[g]) then
local part = topPlateOf(g)
if part then
local curAmt, reqAmt = 0, 0
if st then
local cVal = st:FindFirstChild("CurrentAmount")
local rVal = st:FindFirstChild("RequiredAmount")
if cVal and rVal then
curAmt, reqAmt = math.floor(cVal.Value or 0), math.floor(rVal.Value or 0)
end
end
local pr = genProg[g]
if not pr then
pr = {v = curAmt, t = -100}
genProg[g] = pr
end
if pr.v ~= curAmt then
pr.v = curAmt
pr.t = nowTick
end
local txt
if nowTick - pr.t < 1.5 then
txt = "Generator (" .. curAmt .. "/" .. reqAmt .. ")\nbeing completed"
else
txt = "Generator\n(" .. curAmt .. "/" .. reqAmt .. ")"
end
put("gen", g, part, txt, WHITE, S.GEN_GRAY, S.GEN_GRAY, WHITE, 0.5, false)
end
end
end
end
if S.esPl then
for _, p in ipairs(Players:GetPlayers()) do
local c = p ~= me and p.Character
if c then
local hum = c:FindFirstChildOfClass("Humanoid")
local part = headOf(c)
if hum and part and hum.Health > 0 then put("plr", c, part, p.Name, Color3.fromHSV(0.38, 1, 1), BLACK, WHITE, nil, nil, nil, HEAD_UP) end
end
end
end
if S.esTend then
for _, e in ipairs(nearestN(haz.tend, 20)) do put("tend", e[1], e[2], "Sprout Tendril", S.C_TEND, WHITE, S.C_TEND, S.C_TEND, 0.5, false) end
end
local hands = {}
if S.esHand then
hands = nearestN(haz.hand, 20)
end
if S.esHand then
for _, e in ipairs(hands) do put("hand", e[1], e[2], "Blot's Hand", S.C_HAND, WHITE, S.C_HAND, S.C_HAND, 0.5, false) end
end
if S.esItem then
local pc = pumpColor()
for _, it in ipairs(snap.item) do
local c, label = itemData(it)
local bl = S.itemBL
local blocked = bl and (bl[it.Name] or (c.cap and bl.ResearchCapsule) or (c.fake and bl.FakeCapsule) or (c.pump and bl.Pumpkins) or (bl.StarPillow and c.pillow))
if c.part and not blocked then
local color, stroke, hl = c.color or WHITE, c.stroke or WHITE, nil
if c.cap then
color, stroke, hl = capColor(c.twBase), WHITE, GREEN
if tostring(c.twBase or ""):lower() == "bobette" then color = WHITE end
elseif c.kind == "pumpkin" then
color = pc
elseif c.anim == "pastel" then
color = Color3.fromHSV(0.83, 1, 1)
stroke = WHITE
elseif c.anim == "gr" then
color = Color3.fromHSV((math.sin(tick() * 3) + 1) / 6, 1, 1)
end
hl = hl or color
put("item", it, c.part, label, color, stroke, hl, hl, 1, false)
local r = reg.item[it]
if r then
r.anim = (c.kind == "pumpkin") and "pumpkin" or nil
end
if r and c.cap and tostring(c.twBase or ""):lower() == "bobette" then
local t = tick()
local top = Color3.fromHSV((t * 0.5) % 1, 1, 1)
local blink = Color3.fromRGB(255, 0, 0):Lerp(Color3.fromRGB(0, 255, 0), (math.sin(t * 6) + 1) / 2)
if r.lbl then
local gd = r.lbl:FindFirstChild("TishaBob")
if not gd then
gd = Instance.new("UIGradient")
gd.Name = "TishaBob"
gd.Rotation = 90
gd.Parent = r.lbl
end
gd.Color = ColorSequence.new({
ColorSequenceKeypoint.new(0, top),
ColorSequenceKeypoint.new(0.48, top),
ColorSequenceKeypoint.new(0.52, blink),
ColorSequenceKeypoint.new(1, blink),
})
end
if r.hl then
r.hl.OutlineColor = WHITE
r.hl.FillColor = (math.sin(t * 3) > 0) and top or blink
r.hl.FillTransparency = 0.5
end
end
end
end
local pl = S.pillows
if pl then
local bl2 = S.itemBL
for it in pairs(pl) do
if it.Parent then
local old = reg.item[it]
if not (old and seen[old]) and not (bl2 and bl2.StarPillow) then
local pp = partOf(it)
if pp then
local lb = Color3.fromHSV(0.56, 1, 1)
put("item", it, pp, "Star Pillow", lb, WHITE, lb, lb, 1, false)
end
end
else
pl[it] = nil
end
end
end
end
sweep()
end
if S_nofog or S_fb or S_fb2 or S_day then
worldLighting()
end
end)
local noclipEnabled = false
local noclipOrig = setmetatable({}, {__mode = "k"})
local noclipCleaned = setmetatable({}, {__mode = "k"})
local function cleanPart(part)
if noclipCleaned[part] or not getconnections then return end
noclipCleaned[part] = true
local signals = {
part:GetPropertyChangedSignal("CanQuery"),
part:GetPropertyChangedSignal("CanCollide"),
part:GetPropertyChangedSignal("CanTouch"),
part.Changed,
}
for _, sig in ipairs(signals) do
pcall(function()
for _, conn in ipairs(getconnections(sig)) do conn:Disconnect() end
end)
end
end
local function noclipStep()
local character = me.Character
if not character then return end
for _, part in ipairs(character:GetDescendants()) do
if part:IsA("BasePart") then
pcall(function()
if noclipOrig[part] == nil then
noclipOrig[part] = part.CanCollide
pcall(cleanPart, part)
ComponentBuilder.ncHooked = ComponentBuilder.ncHooked or setmetatable({}, {__mode = "k"})
if not ComponentBuilder.ncHooked[part] then
ComponentBuilder.ncHooked[part] = true
part:GetPropertyChangedSignal("CanCollide"):Connect(function()
if noclipEnabled and part.CanCollide then part.CanCollide = false end
end)
end
end
if part.CanCollide then part.CanCollide = false end
end)
end
end
end
local function stopNoclip()
for part, was in pairs(noclipOrig) do
pcall(function()
if part.Parent then part.CanCollide = was end
end)
end
noclipOrig = setmetatable({}, {__mode = "k"})
end
local function updateNoclip()
if not noclipEnabled then stopNoclip() end
end
local function setNoclip(state)
noclipEnabled = state
updateNoclip()
end
do
genv.TishaNoclipGen = (genv.TishaNoclipGen or 0) + 1
local myGen = genv.TishaNoclipGen
for _, sig in ipairs({RS.Stepped, RS.Heartbeat, RS.RenderStepped}) do
local conn
conn = sig:Connect(function()
if genv.TishaNoclipGen ~= myGen then
conn:Disconnect()
if noclipEnabled then
noclipEnabled = false
stopNoclip()
end
return
end
if noclipEnabled then pcall(noclipStep) end
end)
end
end
me.CharacterAdded:Connect(function(char)
noclipOrig = setmetatable({}, {__mode = "k"})
noclipCleaned = setmetatable({}, {__mode = "k"})
end)
ComponentBuilder:CreateToggle("Player", {
Name = "Noclip",
CurrentValue = false,
Callback = function(Value)
setNoclip(Value)
end,
})
local flyActive = false
local flySpeed = 25
local gravityOriginal = workspace.Gravity
if gravityOriginal < 1 then gravityOriginal = 196.2 end
local function setFly(state)
flyActive = state
if state then
if workspace.Gravity > 0 then gravityOriginal = workspace.Gravity end
workspace.Gravity = 0
else
workspace.Gravity = gravityOriginal
end
end
local tpwActive = false
local tpwSpeed = 2
local tpwExtOn = false
local tpwExtSpeed = 2
local tpwExtAt, tpwExtNow = 0, false
RS.Heartbeat:Connect(function(dt)
local character = me.Character
local hrp = character and character:FindFirstChild("HumanoidRootPart")
local humanoid = character and character:FindFirstChildOfClass("Humanoid")
if not (hrp and humanoid) then return end
if flyActive then
if workspace.Gravity ~= 0 then workspace.Gravity = 0 end
local cam = workspace.CurrentCamera
local look = cam.CFrame.LookVector
local flat = Vector3.new(look.X, 0, look.Z).Unit
local right = Vector3.new(-flat.Z, 0, flat.X)
local dir = humanoid.MoveDirection
local mv = ZERO
if dir.Magnitude > 0.01 then
mv = look * dir:Dot(flat) + cam.CFrame.RightVector * dir:Dot(right)
else
local f = (UIS:IsKeyDown(Enum.KeyCode.W) and 1 or 0) - (UIS:IsKeyDown(Enum.KeyCode.S) and 1 or 0)
local r = (UIS:IsKeyDown(Enum.KeyCode.D) and 1 or 0) - (UIS:IsKeyDown(Enum.KeyCode.A) and 1 or 0)
local u = (UIS:IsKeyDown(Enum.KeyCode.Space) and 1 or 0) - (UIS:IsKeyDown(Enum.KeyCode.LeftShift) and 1 or 0)
mv = look * f + cam.CFrame.RightVector * r + Vector3.new(0, u, 0)
end
hrp.AssemblyLinearVelocity = ZERO
if mv.Magnitude > 0.01 and flySpeed > 0 then
hrp.CFrame = hrp.CFrame + mv.Unit * (flySpeed * dt)
end
end
local dir = humanoid.MoveDirection
local spd = tpwActive and tpwSpeed or 0
if tpwExtOn then
local nowT = tick()
if nowT - tpwExtAt > 0.15 then
tpwExtAt = nowT
tpwExtNow = (S.farm and S.farm.extracting and S.farm.extracting()) == true
end
if tpwExtNow then spd = tpwExtSpeed end
end
if spd > 0 and dir.Magnitude > 0.01 then
hrp.CFrame = hrp.CFrame + dir * (spd * 10 * dt)
end
end)
ComponentBuilder:CreateToggle("Player", {
Name = "Fly",
CurrentValue = false,
Callback = setFly,
})
ComponentBuilder:CreateSlider("Player", {
Name = "Fly Speed",
Min = 1,
Max = 35,
Default = 25,
Callback = function(Value) flySpeed = Value end,
})
local speedActive = false
local walkSpeedValue = 25
local altSpeedOn = false
local altT0 = 0
local altSprintSet = false
RS.Heartbeat:Connect(function()
if not speedActive or altSpeedOn then return end
local character = me.Character
local humanoid = character and character:FindFirstChildOfClass("Humanoid")
if humanoid and humanoid.WalkSpeed ~= walkSpeedValue then
humanoid.WalkSpeed = walkSpeedValue
end
end)
ComponentBuilder:CreateToggle("Player", {
Name = "Speed",
CurrentValue = false,
Callback = function(Value)
speedActive = Value
local character = me.Character
local humanoid = character and character:FindFirstChildOfClass("Humanoid")
if humanoid and not Value then
humanoid.WalkSpeed = 16
end
end,
})
ComponentBuilder:CreateSlider("Player", {
Name = "Speed Value",
Min = 1,
Max = 75,
Default = 25,
Callback = function(Value)
walkSpeedValue = Value
end,
})
-- Alt Speed: 30 por 0.5s, velocidade normal por 0.5s, repete
RS.Heartbeat:Connect(function()
if not altSpeedOn then return end
local character = me.Character
local humanoid = character and character:FindFirstChildOfClass("Humanoid")
if not humanoid then return end
local phase = (tick() - altT0) % 1.0
local boost = phase < 0.5
-- so da o 30 durante o boost; fora dele nao mexe em nada (o jogo coloca a velocidade dele de volta)
if boost and humanoid.WalkSpeed ~= 30 then humanoid.WalkSpeed = 30 end
-- anima como se estivesse correndo, sem avisar o servidor (nao gasta stamina)
local stt = character:FindFirstChild("Stats")
local spr = stt and stt:FindFirstChild("Sprinting")
if spr then
if boost then
if spr.Value ~= true then spr.Value = true altSprintSet = true end
elseif altSprintSet then
spr.Value = false
altSprintSet = false
end
end
end)
ComponentBuilder:CreateToggle("Player", {
Name = "Alt Speed",
CurrentValue = false,
Callback = function(Value)
altSpeedOn = Value
altT0 = tick()
if not Value then
local character = me.Character
if altSprintSet then
local stt = character and character:FindFirstChild("Stats")
local spr = stt and stt:FindFirstChild("Sprinting")
if spr then spr.Value = false end
altSprintSet = false
end
end
end,
})
ComponentBuilder:CreateToggle("Player", {
Name = "TP Walk",
CurrentValue = false,
Callback = function(v) tpwActive = v end,
})
ComponentBuilder:CreateToggle("Player", {
Name = "TP Walk Only On Extract",
CurrentValue = false,
Callback = function(v) tpwExtOn = v tpwExtNow = false end,
})
ComponentBuilder:CreateSlider("Player", {
Name = "TP Walk On Extract Value",
Min = 0,
Max = 10,
Default = 2,
Step = 0.1,
Callback = function(v) tpwExtSpeed = v end,
})
ComponentBuilder:CreateSlider("Player", {
Name = "TP Walk Speed",
Min = 0,
Max = 10,
Default = 2,
Step = 0.1,
Callback = function(v) tpwSpeed = v end,
})
local rngOrig = {}
local rngToons = {Shelly = true, Sprout = true, Cosmo = true, Scraps = true, Glisten = true}
local function rangeScan(restore)
local connections = getconnections(RS.RenderStepped)
for _, conn in pairs(connections) do
local func = conn.Function
if func then
local ok, upvals = pcall(getupvalues, func)
if ok and upvals then
for _, val in pairs(upvals) do
if typeof(val) == "table" then
local ok2, name = pcall(function() return val.Name end)
local ok3, radius = pcall(function() return val.PlayerRadius end)
if ok2 and ok3 and rngToons[name] and radius then
if restore then
local o = rngOrig[val]
if o then val.PlayerRadius = o rngOrig[val] = nil end
elseif radius ~= 500 then
if rngOrig[val] == nil then rngOrig[val] = radius end
val.PlayerRadius = 500
end
end
end
end
end
end
end
end
ComponentBuilder:CreateToggle("Player", {
Name = "Infinite Ability Range",
CurrentValue = false,
Callback = function(v)
if v then pcall(rangeScan, false) else pcall(rangeScan, true) end
end,
})
do
-- Ichor Puddles ESP (refeito): Highlight + texto, mostra todas as pocas (menos as das Blot hands)
local draw = {}
local function clear(e)
if e.box then e.box:Destroy() end
if e.gui then e.gui:Destroy() end
end
local function clearAll()
for inst, e in pairs(draw) do clear(e) draw[inst] = nil end
end
task.spawn(function()
while true do
task.wait(0.1)
if not S.esPud then
if next(draw) then clearAll() end
else
pcall(function()
local cam = workspace.CurrentCamera
if cam then camPos = cam.CFrame.Position end
local hands = nearestN(haz.hand, 400)
local all = {}
for inst in pairs(haz.pud) do
if inWorld(inst) then
local pt = partOf(inst)
if pt then all[#all + 1] = {inst, pt} end
else
haz.pud[inst] = nil
end
end
local top = {}
for _, e in ipairs(all) do
local hidden = false
local a = e[1].Parent
local depth = 0
while a and a ~= workspace and depth < 12 do
if haz.pud[a] then hidden = true break end
a = a.Parent
depth = depth + 1
end
if not hidden then
e[3] = footprint(e[1], e[2])
top[#top + 1] = e
end
end
-- poca duplicada (varias pecas/decals na mesma poca): fica so a maior
table.sort(top, function(x, y) return x[3] > y[3] end)
local uniq = {}
for _, e in ipairs(top) do
local ep = e[2].Position
local dup = false
for _, k in ipairs(uniq) do
local kp = k[2].Position
local dx, dz = ep.X - kp.X, ep.Z - kp.Z
local reach = math.max(k[3], e[3])
if dx * dx + dz * dz <= reach * reach and math.abs(ep.Y - kp.Y) < 4 then
dup = true
break
end
end
if not dup then uniq[#uniq + 1] = e end
end
local list = dropPudsOnHands(uniq, hands)
local keep = {}
for _, e in ipairs(list) do
local inst, part = e[1], e[2]
if part and part.Parent then
keep[inst] = true
local d = draw[inst]
if not d or d.part ~= part or not d.box.Parent then
if d then clear(d) end
local box = Instance.new("Highlight")
box.Name = "TishaPud"
box.Adornee = inst
box.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
box.FillColor = S.C_PUD
box.OutlineColor = S.C_PUD
box.FillTransparency = 0.5
box.OutlineTransparency = 0
box.Parent = pg
local g = Instance.new("BillboardGui")
g.Name = "TishaPudTag"
g.Adornee = part
g.AlwaysOnTop = true
g.Size = UDim2.fromOffset(160, 24)
g.StudsOffsetWorldSpace = Vector3.new(0, 2.5, 0)
g.MaxDistance = 100000
local t = Instance.new("TextLabel")
t.Name = "T"
t.BackgroundTransparency = 1
t.Size = UDim2.fromScale(1, 1)
t.Text = "Ichor Puddle"
t.TextColor3 = S.C_PUD
t.TextStrokeColor3 = BLACK
t.TextStrokeTransparency = 0
t.Font = S.espFont or Enum.Font.GothamBold
t.TextSize = S.size or 14
t.Parent = g
g.Parent = pg
d = {box = box, gui = g, lbl = t, part = part}
draw[inst] = d
end
if tick() - (d.offAt or -100) > 0.5 then
d.offAt = tick()
-- texto logo acima da base da poca (nao do centro de uma peca alta/invisivel)
local ok, cf, sz = pcall(function()
if inst:IsA("Model") then return inst:GetBoundingBox() end
return part.CFrame, part.Size
end)
if ok and cf and sz then
local base = cf.Position - Vector3.new(0, sz.Y / 2, 0)
d.gui.StudsOffsetWorldSpace = base + Vector3.new(0, 2, 0) - part.Position
end
end
if d.lbl.TextSize ~= (S.size or 14) then d.lbl.TextSize = S.size or 14 end
if S.espFont and d.lbl.Font ~= S.espFont then d.lbl.Font = S.espFont end
d.gui.Enabled = not (S.noTags and S.noTagKind.pud)
end
end
for inst, d in pairs(draw) do
if not keep[inst] then clear(d) draw[inst] = nil end
end
end)
end
end
end)
end
ComponentBuilder:CreateToggle("Visuals", {Name = "ESP Items", CurrentValue = false, Callback = function(v) S.esItem = v if v and S.startPillows then S.startPillows() end end})
ComponentBuilder:CreateToggle("Visuals", {Name = "ESP Twisteds", CurrentValue = false, Callback = function(v) S.esTw = v end})
ComponentBuilder:CreateToggle("Visuals", {Name = "ESP Generators", CurrentValue = false, Callback = function(v) S.esGen = v end})
ComponentBuilder:CreateToggle("Visuals", {Name = "ESP Players", CurrentValue = false, Callback = function(v) S.esPl = v end})
ComponentBuilder:CreateToggle("Visuals", {Name = "Sprout Tendril ESP", CurrentValue = false, Callback = function(v) S.esTend = v if v then hazStart() end end})
ComponentBuilder:CreateToggle("Visuals", {Name = "Blot Hands ESP", CurrentValue = false, Callback = function(v) S.esHand = v if v then hazStart() end end})
ComponentBuilder:CreateToggle("Visuals", {Name = "Ichor Puddles ESP", CurrentValue = false, Callback = function(v) S.esPud = v if v then hazStart() end end})
ComponentBuilder:CreateToggle("Visuals", {Name = "Remove ESP Nametags", CurrentValue = false, Callback = function(v) S.noTags = v end})
ComponentBuilder:CreateMultiDropdown("Visuals", {
Name = "Remove ESP Nametag Blacklist",
Options = {"ESP Items", "ESP Twisteds", "ESP Generators", "ESP Players", "ESP Sprout Tendril", "ESP Blot's Hands", "ESP Ichor Puddles"},
Callback = function(map)
S.noTagKind = {
item = map["ESP Items"], twist = map["ESP Twisteds"], gen = map["ESP Generators"],
plr = map["ESP Players"], tend = map["ESP Sprout Tendril"], hand = map["ESP Blot's Hands"], pud = map["ESP Ichor Puddles"],
}
end,
})
ComponentBuilder:CreateSlider("Visuals", {Name = "ESP Text Size", Min = 8, Max = 60, Default = 14, Step = 1, Callback = function(v) S.size = v end})
ComponentBuilder:CreateToggle("Visuals", {Name = "Full Bright", CurrentValue = false, Callback = function(v) S_fb = v brUndo() end})
ComponentBuilder:CreateToggle("Visuals", {Name = "Day Time", CurrentValue = false, Callback = function(v) S_day = v if not v then dtUndo() end end})
ComponentBuilder:CreateToggle("Visuals", {Name = "Alt Full Bright", CurrentValue = false, Callback = function(v) S_fb2 = v brUndo() end})
ComponentBuilder:CreateToggle("Visuals", {Name = "No Fog", CurrentValue = false, Callback = function(v) S_nofog = v if not v then fogUndo() end end})
do
-- Noclip Cam: a camera nao e mais empurrada pelas paredes (hook no Popper do PlayerModule)
local hooked = false
local function hookPopper()
if hooked then return true end
local ok = pcall(function()
local cm = me:WaitForChild("PlayerScripts", 5):WaitForChild("PlayerModule", 5):WaitForChild("CameraModule", 5)
local zc = cm:FindFirstChild("ZoomController")
local pop = (zc and zc:FindFirstChild("Popper")) or cm:FindFirstChild("Poppercam")
local m = require(pop)
if type(m) == "function" then
local old
old = hookfunction(m, function(...)
if S.noclipCam then
local f, d = ...
if typeof(f) == "CFrame" and type(d) == "number" then return d end
end
return old(...)
end)
else
local old = m.Update
m.Update = function(self, dt, cf, focus, ...)
if S.noclipCam then return cf, focus end
return old(self, dt, cf, focus, ...)
end
end
end)
hooked = ok
return ok
end
ComponentBuilder:CreateToggle("Visuals", {Name = "Noclip Cam", CurrentValue = false, Callback = function(v)
S.noclipCam = v
if v then
if not hookPopper() then
S.noclipCam = false
WindUI:Notify({Title = "Tisha's Cleaner GUI", Content = "Noclip Cam is not supported by your executor.", Icon = "x", Duration = 4})
end
end
end})
end
local antiPopupOn = false
local popUpAddedConn = nil
local function setPopupConns(enable)
if not getconnections then return end
pcall(function()
local ev = ReplicatedStorage:FindFirstChild("Events")
local pe = ev and ev:FindFirstChild("PopUpEvent")
if pe then
for _, conn in ipairs(getconnections(pe.OnClientEvent)) do
if enable then conn:Enable() else conn:Disable() end
end
end
end)
end
ComponentBuilder:CreateToggle("Visuals", {
Name = "Anti Vee Pop-ups",
CurrentValue = false,
Callback = function(v)
antiPopupOn = v
if v then
setPopupConns(false)
if not popUpAddedConn then
popUpAddedConn = ReplicatedStorage.DescendantAdded:Connect(function(d)
if antiPopupOn and d.Name == "PopUpEvent" and d:IsA("RemoteEvent") then
pcall(function()
for _, conn in ipairs(getconnections(d.OnClientEvent)) do conn:Disable() end
end)
end
end)
end
else
if popUpAddedConn then
popUpAddedConn:Disconnect()
popUpAddedConn = nil
end
setPopupConns(true)
end
end,
})
local autoAbilityEnabled = false
local veeEnabled, veeBusy = false, false
local autoCalibrationEnabled = false
local autoElevatorEnabled = false
RS.Heartbeat:Connect(function()
if autoAbilityEnabled then
pcall(function()
local char = me.Character
local hrp = char and char:FindFirstChild("HumanoidRootPart")
local ev = ReplicatedStorage:FindFirstChild("Events")
local ab = ev and ev:FindFirstChild("AbilityEvent")
if char and hrp and ab then
ab:InvokeServer(char, hrp.CFrame, false)
end
end)
end
end)
ComponentBuilder:CreateToggle("Automations", {
Name = "Auto Use Ability",
CurrentValue = false,
Callback = function(v) autoAbilityEnabled = v end,
})
do
local autoSquirmEnabled = false
local squirmGrabbed = false
local squirmDir = "left"
task.spawn(function()
local ev = ReplicatedStorage:WaitForChild("Events")
local remote = ev:WaitForChild("TwistedSquirmGrab")
remote.OnClientEvent:Connect(function(action)
if action == "GrabStart" then
squirmGrabbed = true
elseif action == "GrabEnd" then
squirmGrabbed = false
end
end)
while true do
task.wait(0.06)
if autoSquirmEnabled and squirmGrabbed then
pcall(function()
if squirmDir == "left" then
remote:FireServer("Struggle", "left")
squirmDir = "right"
else
remote:FireServer("Struggle", "right")
squirmDir = "left"
end
end)
end
end
end)
ComponentBuilder:CreateToggle("Automations", {
Name = "Auto Squirm Escape",
CurrentValue = false,
Callback = function(v) autoSquirmEnabled = v end,
})
end
local skillOrig = nil
do
local WHITE_GJ = Color3.new(1, 1, 1)
local function styleGJ(l)
if l:GetAttribute("TishaStyled") then return end
l:SetAttribute("TishaStyled", true)
local main = l:FindFirstChildOfClass("UIGradient")
if not main then
main = Instance.new("UIGradient")
main.Name = "TishaGJ"
main.Parent = l
end
for _, c in ipairs(l:GetChildren()) do
if c:IsA("UIGradient") and c ~= main then c.Enabled = false end
end
main.Enabled = true
main.Color = ColorSequence.new(Color3.fromRGB(235, 186, 65), Color3.fromRGB(246, 137, 38))
main.Rotation = 90
main.Offset = Vector2.new(0, 0)
main.Transparency = NumberSequence.new(0)
if not l:FindFirstChild("TishaGJ2") then
local st = Instance.new("UIStroke")
st.Name = "TishaGJ2"
st.Color = Color3.new(0, 0, 0)
st.Thickness = 0.5
st.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
st.Parent = l
end
l.TextColor3 = WHITE_GJ
l:GetPropertyChangedSignal("TextColor3"):Connect(function()
if l.TextColor3 ~= WHITE_GJ then l.TextColor3 = WHITE_GJ end
end)
end
task.spawn(function()
while true do
pcall(function()
local g = pg:FindFirstChild("ScreenGui")
local m = g and g:FindFirstChild("Menu")
local l = m and m:FindFirstChild("SkillCheckMessage")
if l then styleGJ(l) end
end)
task.wait(1)
end
end)
end
local function skillSuper()
task.spawn(function()
pcall(function()
local g = pg:FindFirstChild("ScreenGui")
local m = g and g:FindFirstChild("Menu")
local l = m and m:FindFirstChild("SkillCheckMessage")
if not l then return end
S.gjTweens = S.gjTweens or {}
for _, tw in ipairs(S.gjTweens) do pcall(function() tw:Cancel() end) end
S.gjTweens = {}
local st = l:FindFirstChild("TishaGJ2")
if not l:GetAttribute("TishaGJBusy") then
S.gjVis, S.gjTrans, S.gjStrokeT = l.Visible, l.TextTransparency, l.TextStrokeTransparency
end
local tok = (l:GetAttribute("TishaGJTok") or 0) + 1
l:SetAttribute("TishaGJTok", tok)
l:SetAttribute("TishaGJBusy", true)
l.Text = "Great Job!"
l.TextTransparency = 0
if st then st.Transparency = 0 end
l.Visible = true
task.wait(1.7)
if l:GetAttribute("TishaGJTok") ~= tok then return end
local info = TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
local t1 = TweenService:Create(l, info, {TextTransparency = 1})
S.gjTweens[#S.gjTweens + 1] = t1
t1:Play()
if st then
local t2 = TweenService:Create(st, info, {Transparency = 1})
S.gjTweens[#S.gjTweens + 1] = t2
t2:Play()
end
task.wait(0.45)
if l:GetAttribute("TishaGJTok") ~= tok then return end
if l.Text == "Great Job!" then
l.Visible = S.gjVis
l.TextTransparency = S.gjTrans
end
if st then st.Transparency = 0 end
l:SetAttribute("TishaGJBusy", nil)
end)
end)
return "supercomplete"
end
local function calibrationStep()
local ev = ReplicatedStorage:FindFirstChild("Events")
ev = ev and ev:FindFirstChild("SkillcheckUpdate")
if not ev then return end
local cur = getcallbackvalue and getcallbackvalue(ev, "OnClientInvoke")
if autoCalibrationEnabled then
if cur ~= skillSuper then
if cur ~= nil then skillOrig = cur end
ev.OnClientInvoke = skillSuper
end
else
if skillOrig and cur == skillSuper then ev.OnClientInvoke = skillOrig end
skillOrig = nil
end
end
task.spawn(function()
while true do
task.wait(0.2)
pcall(calibrationStep)
end
end)
ComponentBuilder:CreateToggle("Automations", {
Name = "Auto Calibration",
CurrentValue = false,
Callback = function(v)
autoCalibrationEnabled = v
pcall(calibrationStep)
end,
})
local function getElevatorPos()
local e = workspace:FindFirstChild("Elevators")
e = e and e:FindFirstChild("Elevator")
if not e then return nil end
local b = e:FindFirstChild("Base")
if b and b:IsA("BasePart") then return b.Position + Vector3.new(0, 4, 0) end
return e:GetPivot().Position + Vector3.new(0, 4, 0)
end
local function allGeneratorsDone()
local info = workspace:FindFirstChild("Info")
local c = info and info:FindFirstChild("GeneratorsCompleted") and info.GeneratorsCompleted.Value
local r = info and info:FindFirstChild("RequiredGenerators") and info.RequiredGenerators.Value
if type(c) == "number" and type(r) == "number" and r > 0 then return c >= r end
return false
end
local function isInsideElevator(hrp)
local e = workspace:FindFirstChild("Elevators")
e = e and e:FindFirstChild("Elevator")
if not e then return false end
local ok, cf, size = pcall(function() return e:GetBoundingBox() end)
if not ok or not cf then return false end
local rel = cf:PointToObjectSpace(hrp.Position)
return math.abs(rel.X) <= size.X / 2 + 2
and math.abs(rel.Z) <= size.Z / 2 + 2
and math.abs(rel.Y) <= size.Y / 2 + 8
end
do
local elevatorArmed = true
local elevatorNotDoneSince = nil
local elevatorFirstTp = nil
local elevCond = "Instant"
local elevGo = false
local panicStart, panicLastTp = nil, -100
local timerCache, timerAt, timerWarned = nil, -100, false
-- tempo restante do elevador: procura um valor com nome de timer em Info / Elevators
local function elevTimeLeft()
local now = tick()
if now - timerAt < 0.5 then return timerCache end
timerAt = now
timerCache = nil
local function parse(v)
local x = v.Value
if type(x) == "number" then return x end
if type(x) == "string" then
local m, sc = x:match("^(%d+):(%d+)$")
if m then return tonumber(m) * 60 + tonumber(sc) end
return tonumber(x)
end
return nil
end
local roots = {workspace:FindFirstChild("Info"), workspace:FindFirstChild("Elevators")}
for _, root in ipairs(roots) do
if root then
for _, d in ipairs(root:GetDescendants()) do
if d:IsA("ValueBase") then
local n = d.Name:lower()
if n:find("time", 1, true) or n:find("countdown", 1, true) then
local t = parse(d)
if t then
timerCache = t
return t
end
end
end
end
end
end
return nil
end
local function everyoneReady()
local igp = workspace:FindFirstChild("InGamePlayers")
if igp then
for _, f in ipairs(igp:GetChildren()) do
if f.Name ~= me.Name then
local st = f:FindFirstChild("Stats")
local ie = st and st:FindFirstChild("InElevator")
if ie and ie:IsA("BoolValue") and ie.Value then return true end
end
end
end
local t = elevTimeLeft()
return t ~= nil and t > 0 and t <= 5
end
RS.Stepped:Connect(function()
if not autoElevatorEnabled or veeBusy then return end
local Info = workspace:FindFirstChild("Info")
local panic = Info and Info:FindFirstChild("Panic") and Info.Panic.Value == true
local done = allGeneratorsDone()
if not (panic or done) then
panicStart = nil
elevGo = false
elevatorNotDoneSince = elevatorNotDoneSince or tick()
if tick() - elevatorNotDoneSince >= 3 then
elevatorArmed = true
elevatorFirstTp = nil
end
return
end
elevatorNotDoneSince = nil
if elevCond == "Everyone At Elevator" and not elevGo then
if everyoneReady() then elevGo = true else return end
end
local hrp = me.Character and me.Character:FindFirstChild("HumanoidRootPart")
if not hrp then return end
if panic then
-- modo panico: teleporta a cada 0.5s durante 4s
panicStart = panicStart or tick()
if tick() - panicStart > 4 then return end
if tick() - panicLastTp >= 0.5 then
panicLastTp = tick()
local pos = getElevatorPos()
if pos then hrp.CFrame = CFrame.new(pos) end
end
return
end
if not elevatorArmed then return end
if isInsideElevator(hrp) then
elevatorArmed = false
return
end
if elevatorFirstTp and tick() - elevatorFirstTp > 1.5 then
elevatorArmed = false
return
end
local pos = getElevatorPos()
if pos then
elevatorFirstTp = elevatorFirstTp or tick()
hrp.CFrame = CFrame.new(pos)
end
end)
ComponentBuilder:CreateToggle("Automations", {
Name = "Auto TP Elevator",
CurrentValue = false,
Callback = function(v)
autoElevatorEnabled = v
elevatorArmed = true
elevatorNotDoneSince = nil
elevatorFirstTp = nil
panicStart = nil
elevGo = false
end,
})
ComponentBuilder:CreateDropdown("Automations", {
Name = "Auto TP Elevator Conditions",
Options = {"Instant", "Everyone At Elevator"},
Default = "Instant",
Callback = function(v)
elevCond = v
elevGo = false
panicStart = nil
end,
})
end
local savedPosition = nil
local originalGravity = 196.2
local collectingState = false
local RANK = {caps = 1, heal = 2, tape = 3, event = 4, extr = 5, other = 6}
local PICK = {caps = false, event = false, heal = false, extr = false, tape = false, pillow = false}
local INVENTORY_MAX = 3
local function slotFilled(slot)
local v = slot
if not slot:IsA("ValueBase") then v = slot:FindFirstChild("Value") end
if not (v and v:IsA("ValueBase")) then return false end
local x = v.Value
return x ~= nil and x ~= "" and x ~= false and tostring(x):lower() ~= "none"
end
local function getInventory()
local igp = workspace:FindFirstChild("InGamePlayers")
local mine = igp and (igp:FindFirstChild(me.Name) or igp:FindFirstChild(tostring(me.UserId)))
return mine and mine:FindFirstChild("Inventory")
end
local function inventoryFull()
local inv = getInventory()
if not inv then return false end
local filled, cap = 0, INVENTORY_MAX
for _, slot in ipairs(inv:GetChildren()) do
if slot.Name:match("^Slot%d+$") and slotFilled(slot) then
filled = filled + 1
if slot.Name == "Slot4" then cap = 4 end
end
end
return filled >= cap
end
local function hasAny(n, list)
for _, w in ipairs(list) do
if n:find(w, 1, true) then return true end
end
return false
end
S.farm = {on = false, pick = true, bl = {}, maxHeals = 2, hAt = -100, hN = 0, ign = setmetatable({}, {__mode = "k"})}
function S.farm.dbg(msg)
local F = S.farm
if tick() - (F.dbgAt or -100) < 1 then return end
F.dbgAt = tick()
pcall(function() WindUI:Notify({Title = "DEBUG", Content = msg, Icon = "info", Duration = 5}) end)
end
function S.farm.stopText(t)
local u = tostring(t):upper()
return u:find("STOP EXTRACTING", 1, true) ~= nil or u:find("PARAR A EXTRA", 1, true) ~= nil
or u:find("PARAR EXTRA", 1, true) ~= nil
end
function S.farm.gui()
local F = S.farm
if F.guiObj and not F.guiObj.Parent then F.guiObj = nil end
if not F.guiObj and tick() - (F.guiAt or -100) > 2 then
F.guiAt = tick()
for _, d in ipairs(pg:GetDescendants()) do
if (d:IsA("TextLabel") or d:IsA("TextButton")) and S.farm.stopText(d.Text) then
F.guiObj = d
break
end
end
end
local o = F.guiObj
if not o then return false end
local a = o
while a and a ~= pg do
if a:IsA("GuiObject") and not a.Visible then return false end
if a:IsA("ScreenGui") and not a.Enabled then return false end
a = a.Parent
end
return true
end
function S.farm.raw()
local igp = workspace:FindFirstChild("InGamePlayers")
local mine = igp and igp:FindFirstChild(me.Name)
local d = mine and mine:FindFirstChild("Decoding")
return (d and d.Value == "Generator") or S.farm.gui()
end
function S.farm.srv()
local F = S.farm
if F.raw() then F.srvAt = tick() end
-- segura 0.6s depois do ultimo sinal (o valor do servidor pode piscar)
return tick() - (F.srvAt or -100) < 1.5
end
S.farm.barnC = setmetatable({}, {__mode = "k"})
function S.farm.isBarn(g)
if not g then return false end
local c = S.farm.barnC[g]
if c == nil then
c = g:FindFirstChild("ScreenBorder", true) ~= nil
S.farm.barnC[g] = c
end
return c
end
function S.farm.extracting()
return S.farm.localExt == true or S.farm.srv()
end
function S.farm.picking()
local F = S.farm
if not (F.on and F.pick) then return false end
if F.extracting() and not F.force then return false end
return true
end
-- Pick-up pausa: 5s depois de tomar hit, e 5s depois de um twisted te perseguir/ver
S.hitAt, S.chaseAt = -100, -100
task.spawn(function()
local lastHp, lastHum = nil, nil
while true do
task.wait(0.1)
pcall(function()
local c = me.Character
local h = c and c:FindFirstChildOfClass("Humanoid")
if h then
if h ~= lastHum then lastHum = h lastHp = h.Health end
if h.Health < lastHp - 0.01 then S.hitAt = tick() end
lastHp = h.Health
end
for _, m in ipairs(snap.mon) do
local cv = m:FindFirstChild("ChasingValue")
if cv and (cv.Value == me.Name or (cv:IsA("ObjectValue") and cv.Value and cv.Value.Name == me.Name)) then
S.chaseAt = tick()
break
end
end
end)
end
end)
function S.pickBlocked()
local now = tick()
return now - S.hitAt < 5 or now - S.chaseAt < 5
end
function S.farm.heals()
local F = S.farm
if tick() - F.hAt < 0.1 then return F.hN end
F.hAt = tick()
local n = 0
local inv = getInventory()
if inv then
for _, slot in ipairs(inv:GetChildren()) do
if slot.Name:match("^Slot%d+$") then
local v = slot
if not slot:IsA("ValueBase") then v = slot:FindFirstChild("Value") end
if v and v:IsA("ValueBase") then
local x = v.Value
if typeof(x) == "Instance" then x = x.Name end
x = tostring(x or "")
if x:find("Bandage", 1, true) or x:find("HealthKit", 1, true) then n = n + 1 end
end
end
end
end
F.hN = n
return n
end
local function pickKind(it)
local n = it.Name
if n:find("Fake", 1, true) or n:find("Stopwatch", 1, true) then return nil end
if PICK.event and hasAny(n, {"Pumpkin", "Ornament", "Basket"}) then return "event", false end
if PICK.heal and hasAny(n, {"Bandage", "HealthKit"}) then return "heal", true end
if PICK.extr and hasAny(n, {"JumperCable", "SkillCheckCandy", "ExtractionSpeedCandy", "Instructions"}) then return "extr", true end
if PICK.tape and n:find("Tape", 1, true) then return "tape", false end
local F = S.farm
if F.picking() and not F.bl[n] and not n:find("ResearchCapsule", 1, true)
and not (F.bl.Pumpkins and n:find("Pumpkin", 1, true)) then
if hasAny(n, {"Bandage", "HealthKit"}) then
if F.heals() >= F.maxHeals then return nil end
return "heal", true
end
if hasAny(n, {"Pumpkin", "Ornament", "Basket"}) then return "event", false end
if hasAny(n, {"JumperCable", "SkillCheckCandy", "ExtractionSpeedCandy", "Instructions"}) then return "extr", true end
if n:find("Tape", 1, true) then return "tape", false end
return "other", true
end
return nil
end
local function anyPickEnabled()
return PICK.caps or PICK.event or PICK.heal or PICK.extr or PICK.tape or PICK.pillow or S.farm.picking()
end
local function endCollecting(hrp)
if collectingState then
collectingState = false
workspace.Gravity = originalGravity
local h = hrp or (me.Character and me.Character:FindFirstChild("HumanoidRootPart"))
if savedPosition and h then h.CFrame = savedPosition end
savedPosition = nil
end
end
function S.farm.bad(...)
for _, o in ipairs({...}) do
local x = o
while x and x ~= workspace do
if x.Name == "GigiHoard" or x.Name == "Noclip" or x.Name == "NoClip_Collider" then return true end
x = x.Parent
end
end
return false
end
function S.farm.targets(room)
local targets = {}
if S.pickBlocked() then return targets end
if PICK.caps or (S.farm.picking() and not S.farm.bl.ResearchCapsule) then
local F = S.farm
if tick() - (F.capAt or -100) > 0.5 or F.capRoom ~= room then
F.capAt = tick()
F.capRoom = room
F.capList = {}
for _, m in ipairs(room:GetDescendants()) do
if m.Name:find("ResearchCapsule", 1, true) and (m:IsA("Model") or m:IsA("BasePart")) then
F.capList[#F.capList + 1] = m
end
end
end
for _, m in ipairs(F.capList) do
if m.Parent then
local part = partOf(m)
local prompt = m:FindFirstChildWhichIsA("ProximityPrompt", true)
if part and prompt and prompt.Enabled and (S.farm.ign[prompt] or 0) <= tick() and not S.farm.bad(m, part, prompt) then
targets[#targets + 1] = {part = part, prompt = prompt, rank = RANK.caps}
end
end
end
end
if PICK.event or PICK.heal or PICK.extr or PICK.tape or S.farm.picking() then
local full = nil
for _, it in ipairs(snap.item) do
if it.Parent then
local kind, needsInv = pickKind(it)
if kind then
if needsInv then
if full == nil then full = inventoryFull() end
end
if not (needsInv and full) then
local part = partOf(it)
local prompt = it:FindFirstChildWhichIsA("ProximityPrompt", true)
if part and prompt and prompt.Enabled and (S.farm.ign[prompt] or 0) <= tick() and not S.farm.bad(it, part, prompt) then
targets[#targets + 1] = {part = part, prompt = prompt, rank = RANK[kind]}
end
end
end
end
end
end
if PICK.pillow and S.pillowL then
for inst in pairs(S.pillowL) do
if inst.Parent and inst:IsDescendantOf(workspace) then
local part = partOf(inst)
-- com prompt (StarPillow) aperta o prompt; sem prompt (StarPillowLocal) pega encostando
local prompt = inst:FindFirstChildWhichIsA("ProximityPrompt", true)
local key = prompt or part
if part and (not prompt or prompt.Enabled) and key and (S.farm.ign[key] or 0) <= tick() then
targets[#targets + 1] = {part = part, prompt = prompt, rank = 1.5, down = 2}
end
else
S.pillowL[inst] = nil
end
end
end
return targets
end
function S.farm.hasTargets()
local room = workspace:FindFirstChild("CurrentRoom")
if not room then return false end
return #S.farm.targets(room) > 0
end
task.spawn(function()
while true do
task.wait()
if anyPickEnabled() then
pcall(function()
local char = me.Character
local hrp = char and char:FindFirstChild("HumanoidRootPart")
local room = workspace:FindFirstChild("CurrentRoom")
if not (hrp and room) then
if collectingState then
savedPosition = nil
endCollecting(hrp)
end
return
end
if veeBusy then return end
if S.farm.extracting() and not S.farm.force then
if collectingState then
savedPosition = nil
endCollecting(hrp)
end
return
end
local targets = S.farm.targets(room)
if #targets > 0 then
if not collectingState then
collectingState = true
savedPosition = hrp.CFrame
if workspace.Gravity > 0 then
originalGravity = workspace.Gravity
end
workspace.Gravity = 0
end
local t = targets[1]
for i = 2, #targets do
if targets[i].rank < t.rank then t = targets[i] end
end
-- item que nao some depois de 2.5s tentando (inalcancavel / ja pego): ignora por 8s
local F = S.farm
local key = t.prompt or t.part
if F.cur ~= key then
F.cur = key
F.curAt = tick()
elseif tick() - F.curAt > 2.5 and not F.force then
F.ign[key] = tick() + 8
F.cur = nil
return
end
-- vai ate o proprio prompt (pode ficar longe do centro do item)
local ppos = t.part.Position
pcall(function()
local par = t.prompt and t.prompt.Parent
if par and par:IsA("BasePart") then ppos = par.Position
elseif par:IsA("Attachment") then ppos = par.WorldPosition end
end)
S.farm.dbg("Pick-up TP | extracting=" .. tostring(S.farm.extracting()) .. " raw=" .. tostring(S.farm.raw()) .. " gui=" .. tostring(S.farm.gui()) .. " item=" .. tostring(t.part.Parent and t.part.Parent.Name))
hrp.CFrame = CFrame.new(ppos - Vector3.new(0, t.down or 5, 0))
task.wait()
if not t.prompt then
-- item de encostar: o teleporte ja encosta; reforca com firetouchinterest
if firetouchinterest then
pcall(function()
firetouchinterest(hrp, t.part, 0)
firetouchinterest(hrp, t.part, 1)
end)
end
elseif t.prompt and fireproximityprompt then
pcall(function()
t.prompt.HoldDuration = 0
t.prompt.RequiresLineOfSight = false
end)
for _ = 1, 12 do
fireproximityprompt(t.prompt)
end
end

else
endCollecting(hrp)
end
end)
else
endCollecting()
end
end
end)
ComponentBuilder:CreateToggle("Automations", {
Name = "Auto Pick Up Capsules",
Order = 2,
CurrentValue = false,
Callback = function(v) PICK.caps = v end,
})
ComponentBuilder:CreateToggle("Automations", {
Name = "Auto Pick Up Event Currency",
Order = 5,
CurrentValue = false,
Callback = function(v) PICK.event = v end,
})
ComponentBuilder:CreateToggle("Automations", {
Name = "Auto Pick Up Heals",
Order = 3,
CurrentValue = false,
Callback = function(v) PICK.heal = v end,
})
ComponentBuilder:CreateToggle("Automations", {
Name = "Auto Pick Up Extraction Items",
Order = 6,
CurrentValue = false,
Callback = function(v) PICK.extr = v end,
})
ComponentBuilder:CreateToggle("Automations", {
Name = "Auto Pick Up StarPillows",
Order = 7,
CurrentValue = false,
Callback = function(v)
PICK.pillow = v
if v and not S.pillowL then
S.pillowL = {}
local function scan(d)
if d.Name == "StarPillowLocal" or d.Name == "StarPillow" then
local p = d.Parent
if not (p and (p.Name == "StarPillowLocal" or p.Name == "StarPillow")) then S.pillowL[d] = true end
end
end
for _, d in ipairs(workspace:GetDescendants()) do scan(d) end
workspace.DescendantAdded:Connect(scan)
end
end,
})
ComponentBuilder:CreateToggle("Automations", {
Name = "Auto Pick Up Tapes",
Order = 4,
CurrentValue = false,
Callback = function(v) PICK.tape = v end,
})
local veeSeen = setmetatable({}, {__mode = "k"})
local veePending = {}
local veeDone = false
local veeCool = 0
local veeTry = setmetatable({}, {__mode = "k"})
local function veeThreshold(m)
local n = m.Name
return (n:find("Dyle", 1, true) or n:find("Dandy", 1, true) or n:find("Dessa", 1, true) or n:find("Dioda", 1, true)) and 70 or 35
end
local function veeMargin(part)
local best = math.huge
for _, m in ipairs(snap.mon) do
local mp = torsoOf(m)
if mp then
best = math.min(best, (mp.Position - part.Position).Magnitude - veeThreshold(m))
end
end
return best
end
local function startMachine(g)
local valve = g:FindFirstChild("Valve", true)
local prompt = valve and valve:FindFirstChildWhichIsA("ProximityPrompt", true)
if not prompt then
for _, d in ipairs(g:GetDescendants()) do
if d:IsA("ProximityPrompt") and d.Enabled then prompt = d break end
end
end
if prompt and prompt.Enabled and fireproximityprompt then
pcall(function()
prompt.HoldDuration = 0
prompt.RequiresLineOfSight = false
end)
for _ = 1, 3 do fireproximityprompt(prompt) end
end
end
local VEE_STAY, VEE_TRIES = 1.5, 20
local function machineDone(g)
local st = g:FindFirstChild("Stats")
local c = st and st:FindFirstChild("Completed")
return c ~= nil and c.Value == true
end
local function machineAmount(g)
local st = g:FindFirstChild("Stats")
local c = st and st:FindFirstChild("CurrentAmount")
return c and tonumber(c.Value) or 0
end
local function useVee(g)
local char = me.Character
local hrp = char and char:FindFirstChild("HumanoidRootPart")
local part = plateOf(g)
if not (hrp and part) then return false end
veeBusy = true
S.veeRun = true
local back = hrp.CFrame
local ok = false
pcall(function()
for _ = 1, VEE_TRIES do
if not g.Parent or machineDone(g) then ok = true break end
local startAmount = machineAmount(g)
local t0 = tick()
local fired1, fired2 = false, false
while tick() - t0 < VEE_STAY do
local h = me.Character and me.Character:FindFirstChild("HumanoidRootPart")
local p = plateOf(g)
if not (h and p) then return end
local target = p.CFrame + Vector3.new(0, 3, 0)
if (h.Position - target.Position).Magnitude > 6 then
h.AssemblyLinearVelocity = ZERO
h.CFrame = target
end
local el = tick() - t0
if not fired1 and el >= 0.3 then fired1 = true startMachine(g) end
if not fired2 and el >= 0.8 then fired2 = true startMachine(g) end
task.wait(0.05)
end
if not g.Parent or machineDone(g) or machineAmount(g) > startAmount then ok = true break end
end
end)
local h2 = me.Character and me.Character:FindFirstChild("HumanoidRootPart")
if h2 then
h2.AssemblyLinearVelocity = ZERO
h2.CFrame = back
end
S.veeRun = false
veeBusy = false
return ok
end
task.spawn(function()
while true do
task.wait(0.3)
if #snap.gen == 0 then veeDone = false end
-- veeBusy preso (ninguem usando de fato): solta
if veeBusy and not S.veeRun and not S.farm.on then veeBusy = false end
if veeEnabled and not veeDone and not veeBusy and tick() >= veeCool and not S.farm.extracting() then
pcall(function()
for _, g in ipairs(snap.gen) do
if not veeSeen[g] then
veeSeen[g] = true
veePending[#veePending + 1] = g
end
end
local bestIdx, bestMargin
for i = #veePending, 1, -1 do
local g = veePending[i]
local st = g:FindFirstChild("Stats")
local done = st and st:FindFirstChild("Completed") and st.Completed.Value == true
if not g.Parent or done then
table.remove(veePending, i)
else
local part = plateOf(g)
if part then
local mg = veeMargin(part)
if mg >= 0 and (not bestMargin or mg > bestMargin) then
bestIdx, bestMargin = i, mg
end
end
end
end
if bestIdx then
endCollecting()
local vg = table.remove(veePending, bestIdx)
veeDone = useVee(vg)
if not veeDone then
-- falhou: nao perde a maquina, tenta de novo (ate 3x) depois de 2s
veeTry[vg] = (veeTry[vg] or 0) + 1
if veeTry[vg] <= 3 and vg.Parent then veePending[#veePending + 1] = vg end
veeCool = tick() + 2
end
end
end)
end
end
end)
ComponentBuilder:CreateToggle("Automations", {
Name = "Auto Use Vee Remote",
Order = 1,
CurrentValue = false,
Callback = function(v)
veeEnabled = v
veePending = {}
veeDone = false
veeCool = 0
veeTry = setmetatable({}, {__mode = "k"})
if v then veeSeen = setmetatable({}, {__mode = "k"}) end
end,
})
local tpSkipMonster = true
local tpMonsterDist = 35
local tpDangerDist = 65
local GEN_BUSY_TIME = 1.5
task.spawn(function()
while true do
task.wait(0.25)
local now = tick()
for _, g in ipairs(snap.gen) do
local st = g:FindFirstChild("Stats")
local cVal = st and st:FindFirstChild("CurrentAmount")
if cVal then
local amt = math.floor(tonumber(cVal.Value) or 0)
local pr = genProg[g]
if not pr then
genProg[g] = {v = amt, t = -100}
elseif pr.v ~= amt then
pr.v = amt
pr.t = now
end
end
end
end
end)
local function getClosestGen()
local bestGen, shortestDist, bestModel = nil, math.huge, nil
local hrp = me.Character and me.Character:FindFirstChild("HumanoidRootPart")
if not hrp then return nil end
for _, g in ipairs(snap.gen) do
local st = g:FindFirstChild("Stats")
local completed = st and st:FindFirstChild("Completed") and st.Completed.Value == true
local pr = genProg[g]
local busy = pr ~= nil and tick() - pr.t < GEN_BUSY_TIME
if not completed and not busy then
local part = plateOf(g)
if part then
local dist = (part.Position - hrp.Position).Magnitude
if dist < shortestDist then
if tpSkipMonster then
local safe = true
for _, m in ipairs(snap.mon) do
local mPart = torsoOf(m)
local lim = tpMonsterDist
if S.Dangerous and S.Dangerous[m.Name] and tpDangerDist > lim then lim = tpDangerDist end
if mPart and (mPart.Position - part.Position).Magnitude <= lim then
safe = false
break
end
end
if safe then
shortestDist = dist
bestGen = part
bestModel = g
end
else
shortestDist = dist
bestGen = part
bestModel = g
end
end
end
end
end
return bestGen, bestModel
end
local function getClosestTopPlate()
local bestPart, shortestDist = nil, math.huge
local hrp = me.Character and me.Character:FindFirstChild("HumanoidRootPart")
if not hrp then return nil end
for _, g in ipairs(snap.gen) do
local part = topPlateOf(g)
if part then
local dist = (part.Position - hrp.Position).Magnitude
if dist < shortestDist then
shortestDist = dist
bestPart = part
end
end
end
return bestPart
end
local function tpTo(part, gen)
local hrp = me.Character and me.Character:FindFirstChild("HumanoidRootPart")
if not (hrp and part) then return end
-- maquina: teleporta na frente da valve, olhando pra ela
if gen and S.frontSpot then
local ok, cf = pcall(S.frontSpot, gen, part.Position)
if ok and cf then
hrp.AssemblyLinearVelocity = ZERO
hrp.AssemblyAngularVelocity = ZERO
hrp.CFrame = cf
-- garante que o personagem fique em pe (sem cair/deitar)
local hum = me.Character and me.Character:FindFirstChildOfClass("Humanoid")
if hum then
pcall(function()
hum.PlatformStand = false
hum.Sit = false
hum:ChangeState(Enum.HumanoidStateType.GettingUp)
end)
end
return
end
end
-- so a posicao da peca; a rotacao da peca (que pode ser torta) nao e copiada
local pos = part.Position + Vector3.new(0, 3, 0)
local look = hrp.CFrame.LookVector
local flat = Vector3.new(look.X, 0, look.Z)
if flat.Magnitude < 0.01 then flat = Vector3.new(0, 0, -1) end
hrp.AssemblyLinearVelocity = ZERO
hrp.AssemblyAngularVelocity = ZERO
hrp.CFrame = CFrame.lookAt(pos, pos + flat)
end
ComponentBuilder:CreateButton("Teleport", {
Name = "TP To Generator",
Callback = function() tpTo(getClosestGen()) end,
})
ComponentBuilder:CreateButton("Teleport", {
Name = "TP Above Gen",
Callback = function() tpTo(getClosestTopPlate()) end,
})
ComponentBuilder:CreateToggle("Teleport", {
Name = "Skip Machines With Twisted Near",
CurrentValue = true,
Callback = function(v) tpSkipMonster = v end,
})
ComponentBuilder:CreateSlider("Teleport", {
Name = "Twisted Distance",
Min = 10,
Max = 100,
Default = 35,
Step = 1,
Callback = function(v) tpMonsterDist = v end,
})
local floatBtns = {}
local function floatToggle(text, textSize, yScale, getTarget)
return function(v)
local b = floatBtns[text]
if v and not b then
b = mk("TextButton", {
Name = "Float" .. text:gsub(" ", ""),
Size = UDim2.fromOffset(120, 38),
Position = UDim2.new(0.5, -60, yScale, 0),
BackgroundColor3 = Color3.fromRGB(24, 24, 28),
BackgroundTransparency = 0.05,
Text = text,
Font = Enum.Font.GothamMedium,
TextSize = 13,
TextColor3 = WHITE,
AutoButtonColor = false,
BorderSizePixel = 0,
ZIndex = 25,
}, gui)
round(b, 10)
local fs = Instance.new("UIStroke")
fs.Color = WHITE
fs.Transparency = 0.85
fs.Thickness = 1
fs.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
fs.Parent = b
b.MouseEnter:Connect(function()
TweenService:Create(b, TweenInfo.new(0.12), {BackgroundColor3 = Color3.fromRGB(40, 40, 48)}):Play()
end)
b.MouseLeave:Connect(function()
TweenService:Create(b, TweenInfo.new(0.12), {BackgroundColor3 = Color3.fromRGB(24, 24, 28)}):Play()
end)
local drag = makeDraggable(b)
b.Activated:Connect(function()
if not drag.moved then tpTo(getTarget()) end
end)
floatBtns[text] = b
end
if b then b.Visible = v end
end
end
ComponentBuilder:CreateToggle("Teleport", {
Name = "TP Generator Button",
CurrentValue = false,
Callback = floatToggle("TP Generator", 14, 0.85, getClosestGen),
})
ComponentBuilder:CreateToggle("Teleport", {
Name = "TP Above Gen Button",
CurrentValue = false,
Callback = floatToggle("TP Above Gen", 13, 0.78, getClosestTopPlate),
})
S.itemList = {
"StarPillow", "Valve",
"Jawbreaker", "JumperCable", "ExtractionSpeedCandy", "SkillCheckCandy", "HealthKit",
"Bandage", "SpeedCandy", "StealthCandy", "StaminaCandy", "ProteinBar", "Tape",
"SmokeBomb", "Instructions", "AirHorn", "Gumball", "PopBottle", "Pop", "Chocolate",
"ChocolateBox", "DandyEasterEggs", "ChristmasCookie", "FakeCapsule", "BonBon",
"ResearchCapsule", "EjectButton", "Stopwatch", "Ornament", "Pumpkins", "Basket"
}
-- Visuals: Item ESP blacklist
S.itemBL = {}
ComponentBuilder:CreateMultiDropdown("Visuals", {
Name = "Item ESP Blacklist",
Options = S.itemList,
Callback = function(map) S.itemBL = map end,
})
-- Visuals: FOV
do
local fovOn, fovVal, fovConn = false, 70, nil
ComponentBuilder:CreateToggle("Visuals", {
Name = "FOV Changer",
CurrentValue = false,
Callback = function(v)
fovOn = v
if v then
if not fovConn then
fovConn = RS.RenderStepped:Connect(function()
local cam = workspace.CurrentCamera
if cam then cam.FieldOfView = fovVal end
end)
end
else
if fovConn then fovConn:Disconnect() fovConn = nil end
local cam = workspace.CurrentCamera
if cam then cam.FieldOfView = 70 end
end
end,
})
ComponentBuilder:CreateSlider("Visuals", {
Name = "FOV Value",
Min = 10,
Max = 120,
Default = 70,
Callback = function(v) fovVal = v end,
})
end
-- Teleport: elevator button
do
local function elevatorPart()
local e = workspace:FindFirstChild("Elevators")
e = e and e:FindFirstChild("Elevator")
if not e then return nil end
local b = e:FindFirstChild("Base")
if b and b:IsA("BasePart") then return b end
return partOf(e)
end
ComponentBuilder:CreateButton("Teleport", {
Name = "TP To Elevator",
Callback = function() tpTo(elevatorPart()) end,
})
ComponentBuilder:CreateToggle("Teleport", {
Name = "TP Elevator Button",
CurrentValue = false,
Callback = floatToggle("TP Elevator", 14, 0.71, elevatorPart),
})
end
-- Player: Anti Slip
do
local slipOn, slipConn = false, nil
local slipProps = PhysicalProperties.new(15, 3, 0, 1, 1)
local slipDefaults = {}
local function slipApply(char)
for _, part in ipairs(char:GetDescendants()) do
if part:IsA("BasePart") then
if slipDefaults[part] == nil then slipDefaults[part] = part.CustomPhysicalProperties or false end
part.CustomPhysicalProperties = slipProps
end
end
end
ComponentBuilder:CreateToggle("Player", {
Name = "Anti Slip",
CurrentValue = false,
Callback = function(v)
slipOn = v
local char = me.Character
if v then
if char then slipApply(char) end
if not slipConn then
slipConn = RS.RenderStepped:Connect(function(dt)
local c = me.Character
local hum = c and c:FindFirstChildOfClass("Humanoid")
local root = c and c:FindFirstChild("HumanoidRootPart")
if hum and root and hum.Health > 0 and hum.MoveDirection.Magnitude == 0 then
local vel = root.AssemblyLinearVelocity
if Vector3.new(vel.X, 0, vel.Z).Magnitude > 0.5 then
local k = math.clamp(dt * 25, 0, 1)
root.AssemblyLinearVelocity = Vector3.new(vel.X * (1 - k), vel.Y, vel.Z * (1 - k))
end
end
end)
end
else
if slipConn then slipConn:Disconnect() slipConn = nil end
for part, old in pairs(slipDefaults) do
pcall(function() part.CustomPhysicalProperties = old or nil end)
end
slipDefaults = {}
end
end,
})
me.CharacterAdded:Connect(function(char)
if slipOn then
task.delay(1, function()
if slipOn and char.Parent then slipApply(char) end
end)
end
end)
end
-- Player: Item Aura + blacklist
do
local auraOn, auraBL = false, {}
ComponentBuilder:CreateToggle("Player", {
Name = "Item Aura",
CurrentValue = false,
Callback = function(v) auraOn = v end,
})
ComponentBuilder:CreateMultiDropdown("Player", {
Name = "Item Aura Blacklist",
Options = S.itemList,
Callback = function(map) auraBL = map end,
})
task.spawn(function()
while true do
if auraOn and fireproximityprompt then
pcall(function()
local hrp = me.Character and me.Character:FindFirstChild("HumanoidRootPart")
if not hrp then return end
for _, it in ipairs(snap.item) do
if it.Parent then
local c = itemData(it)
local blocked = c.fake or it.Name:lower():find("fake", 1, true)
or auraBL[it.Name] or (c.cap and auraBL.ResearchCapsule) or (c.pump and auraBL.Pumpkins)
if not blocked then
local part = partOf(it)
local prompt = it:FindFirstChildWhichIsA("ProximityPrompt", true)
if part and prompt and prompt.Enabled
and (part.Position - hrp.Position).Magnitude <= (prompt.MaxActivationDistance or 10) then
fireproximityprompt(prompt)
end
end
end
end
end)
task.wait(0.25)
else
task.wait(0.25)
end
end
end)
end
-- Player: Jump
do
local jumpOn, jumpPow, infJump = false, 50, false
local jumpOrigPower, jumpOrigUse = nil, nil
local function myHum()
local c = me.Character
return c and c:FindFirstChildOfClass("Humanoid"), c
end
RS.Heartbeat:Connect(function()
if not (jumpOn or infJump) then return end
local h, c = myHum()
if not h then return end
if jumpOn then
h.UseJumpPower = true
h.JumpPower = jumpPow
end
pcall(function() c:SetAttribute("CanJump", true) end)
end)
ComponentBuilder:CreateToggle("Player", {
Name = "Enable Jump",
CurrentValue = false,
Callback = function(v)
jumpOn = v
local h = myHum()
if v then
if h then jumpOrigPower, jumpOrigUse = h.JumpPower, h.UseJumpPower end
elseif h and jumpOrigPower then
h.UseJumpPower = jumpOrigUse
h.JumpPower = jumpOrigPower
end
end,
})
ComponentBuilder:CreateSlider("Player", {
Name = "Jump Power",
Min = 10,
Max = 250,
Default = 50,
Step = 5,
Callback = function(v) jumpPow = v end,
})
ComponentBuilder:CreateToggle("Player", {
Name = "Infinite Jump",
CurrentValue = false,
Callback = function(v) infJump = v end,
})
UIS.JumpRequest:Connect(function()
if infJump then
local h = myHum()
if h then h:ChangeState(Enum.HumanoidStateType.Jumping) end
end
end)
end
-- Automations: Auto Heal
do
local healOn, healBusy, lastHeal = false, false, 0
local TWO_LIFE = {shelly = true, vee = true, astro = true, sprout = true, pebble = true, bassie = true, bobette = true, gourdy = true}
local function toonIs2Life()
local c = me.Character
local list = {c and c.Name}
local igp = workspace:FindFirstChild("InGamePlayers")
local mine = igp and igp:FindFirstChild(me.Name)
if mine then list[#list + 1] = mine:GetAttribute("ToonName") end
for _, a in ipairs({"Toon", "Character", "CharacterName", "SelectedToon", "ToonName"}) do
list[#list + 1] = me:GetAttribute(a)
end
for _, n in ipairs(list) do
if type(n) == "string" and TWO_LIFE[n:lower():gsub("monster", "")] then return true end
end
return false
end
local function slotItem(slot)
local v = slot
if not slot:IsA("ValueBase") then v = slot:FindFirstChild("Value") end
if not (v and v:IsA("ValueBase")) then return "" end
local x = v.Value
if typeof(x) == "Instance" then x = x.Name end
return tostring(x or ""):lower()
end
local function findSlot(inv, kind)
for _, slot in ipairs(inv:GetChildren()) do
if slot.Name:match("^Slot%d+$") then
local n = slotItem(slot)
if kind == "band" and n:find("bandage", 1, true) then return slot end
if kind == "kit" and (n:find("healthkit", 1, true) or n:find("medkit", 1, true) or n:find("health kit", 1, true)) then return slot end
end
end
return nil
end
task.spawn(function()
while true do
task.wait(0.25)
if healOn and not healBusy then
pcall(function()
local char = me.Character
local hum = char and char:FindFirstChildOfClass("Humanoid")
local inv = char and char:FindFirstChild("Inventory")
if not inv then
local igp = workspace:FindFirstChild("InGamePlayers")
local mine = igp and igp:FindFirstChild(me.Name)
inv = mine and mine:FindFirstChild("Inventory")
end
if not (hum and inv) or hum.Health <= 0 then return end
local max = hum.MaxHealth
if max > 10 then max = 3 end
if toonIs2Life() then max = 2 end
local hp = math.floor(hum.Health + 0.5)
local missing = max - hp
if missing <= 0 or tick() - lastHeal < 1.5 then return end
local band, kit = findSlot(inv, "band"), findSlot(inv, "kit")
local slot
if max <= 2 then
if band and kit then
slot = (math.random() < 0.75) and band or kit
else
slot = band or kit
end
elseif missing == 1 then
slot = band
else
slot = kit or band
end
if slot then
healBusy = true
lastHeal = tick()
task.spawn(function()
pcall(function()
local ev = ReplicatedStorage:FindFirstChild("Events")
ev = ev and ev:FindFirstChild("ItemEvent")
if ev then ev:InvokeServer(char, slot) end
end)
healBusy = false
end)
end
end)
end
end
end)
ComponentBuilder:CreateToggle("Automations", {
Name = "Auto Use Heal Items",
CurrentValue = false,
Callback = function(v) healOn = v end,
})
end
-- Automations: Auto Hide Connie + Auto Use Stamina Items
do
local connieOn, staminaOn = false, false
local chasedPrev, lastConnie, lastStam = false, -100, -100
local function toonIsConnie()
local list = {me.Character and me.Character.Name}
local igp = workspace:FindFirstChild("InGamePlayers")
local mine = igp and igp:FindFirstChild(me.Name)
if mine then list[#list + 1] = mine:GetAttribute("ToonName") end
for _, a in ipairs({"Toon", "Character", "CharacterName", "SelectedToon", "ToonName"}) do
list[#list + 1] = me:GetAttribute(a)
end
for _, n in ipairs(list) do
if type(n) == "string" and n:lower():find("connie", 1, true) then return true end
end
return false
end
local function beingChased()
local room = workspace:FindFirstChild("CurrentRoom")
if not room then return false end
for _, map in ipairs(room:GetChildren()) do
local mf = map:FindFirstChild("Monsters")
if mf then
for _, m in ipairs(mf:GetChildren()) do
local cv = m:FindFirstChild("ChasingValue")
if cv and (cv.Value == me.Name or (cv:IsA("ObjectValue") and cv.Value and cv.Value.Name == me.Name)) then
return true
end
end
end
end
return false
end
local function myInventory()
local char = me.Character
local inv = char and char:FindFirstChild("Inventory")
if inv then return inv, char end
local igp = workspace:FindFirstChild("InGamePlayers")
local mine = igp and igp:FindFirstChild(me.Name)
return mine and mine:FindFirstChild("Inventory"), char
end
local function slotName(slot)
local v = slot
if not slot:IsA("ValueBase") then v = slot:FindFirstChild("Value") end
if not (v and v:IsA("ValueBase")) then return "" end
local x = v.Value
if typeof(x) == "Instance" then x = x.Name end
return tostring(x or ""):lower()
end
task.spawn(function()
while true do
task.wait(0.15)
if connieOn then
pcall(function()
local chased = beingChased()
-- usa a habilidade da Connie so quando um twisted comeca a te ver
if chased and not chasedPrev and tick() - lastConnie > 2 and toonIsConnie() then
lastConnie = tick()
local char = me.Character
local hrp = char and char:FindFirstChild("HumanoidRootPart")
local ev = ReplicatedStorage:FindFirstChild("Events")
local ab = ev and ev:FindFirstChild("AbilityEvent")
if char and hrp and ab then
task.spawn(function() pcall(function() ab:InvokeServer(char, hrp.CFrame, false) end) end)
end
end
chasedPrev = chased
end)
else
chasedPrev = false
end
if staminaOn and tick() - lastStam > 1 then
pcall(function()
local igp = workspace:FindFirstChild("InGamePlayers")
local mine = igp and igp:FindFirstChild(me.Name)
local st = mine and mine:FindFirstChild("Stats")
local cs = st and st:FindFirstChild("CurrentStamina")
local stam = cs and tonumber(cs.Value)
if not stam or stam > 20 then return end
local inv, char = myInventory()
if not (inv and char) then return end
-- 15 ou menos: PopBottle e Pop; 20 ou menos: ProteinBar e StaminaCandy
local order = {}
if stam <= 15 then order[#order + 1] = "popbottle" order[#order + 1] = "pop" end
order[#order + 1] = "proteinbar"
order[#order + 1] = "staminacandy"
for _, key in ipairs(order) do
for _, slot in ipairs(inv:GetChildren()) do
local n = slotName(slot):gsub("[^%a]", "")
local hit = false
if slot.Name:match("^Slot%d+$") then
if key == "pop" then hit = n:find("pop", 1, true) ~= nil and not n:find("popbottle", 1, true)
else hit = n:find(key, 1, true) ~= nil end
end
if hit then
lastStam = tick()
local ev = ReplicatedStorage:FindFirstChild("Events")
ev = ev and ev:FindFirstChild("ItemEvent")
if ev then task.spawn(function() pcall(function() ev:InvokeServer(char, slot) end) end) end
return
end
end
end
end)
end
end
end)
-- Auto Use Items: itens que nao tem opcao propria de auto usar
local itemsOn, lastItem = false, -100
-- BonBon e Stopwatch ficam no Auto Use Extraction Items
local USE_ITEMS = {"Jawbreaker", "SpeedCandy", "StealthCandy", "SmokeBomb", "AirHorn", "Gumball", "Chocolate",
"ChocolateBox", "ChristmasCookie", "EjectButton"}
local ITEM_KEY = {}
for _, n in ipairs(USE_ITEMS) do ITEM_KEY[n:lower()] = n end
task.spawn(function()
while true do
task.wait(0.1)
if itemsOn and tick() - lastItem > 0.5 and workspace:FindFirstChild("CurrentRoom") then
pcall(function()
local inv, char = myInventory()
if not (inv and char) then return end
local hum = char:FindFirstChildOfClass("Humanoid")
if not hum or hum.Health <= 0 then return end
for _, slot in ipairs(inv:GetChildren()) do
if slot.Name:match("^Slot%d+$") then
local nm = ITEM_KEY[(slotName(slot):gsub("[^%a]", ""))]
if nm then
lastItem = tick()
local ev = ReplicatedStorage:FindFirstChild("Events")
ev = ev and ev:FindFirstChild("ItemEvent")
if ev then task.spawn(function() pcall(function() ev:InvokeServer(char, slot) end) end) end
return
end
end
end
end)
end
end
end)
ComponentBuilder:CreateToggle("Automations", {
Name = "Auto Use Items",
CurrentValue = false,
Callback = function(v) itemsOn = v end,
})
ComponentBuilder:CreateToggle("Automations", {
Name = "Auto Hide Connie",
CurrentValue = false,
Callback = function(v) connieOn = v chasedPrev = false end,
})
ComponentBuilder:CreateToggle("Automations", {
Name = "Auto Use Stamina Items",
CurrentValue = false,
Callback = function(v) staminaOn = v end,
})
end
-- Automations: Auto Use Extraction Items
do
local extrOn, extrBusy = false, false
local extrUsed = {}
local extrCached = nil
local extrScan = 0
local EXTR_ITEMS = {"extractionspeedcandy", "valve", "skillcheckcandy", "jumpercable", "bonbon", "instructions", "stopwatch"}
local function guiShown(o)
local a = o
while a and a ~= pg do
if a:IsA("GuiObject") and not a.Visible then return false end
if a:IsA("ScreenGui") and not a.Enabled then return false end
a = a.Parent
end
return true
end
local function slotName(slot)
local v = slot
if not slot:IsA("ValueBase") then v = slot:FindFirstChild("Value") end
if not (v and v:IsA("ValueBase")) then return "" end
local x = v.Value
if typeof(x) == "Instance" then x = x.Name end
return tostring(x or ""):lower()
end
local function isExtracting()
if extrCached and not extrCached.Parent then extrCached = nil end
if not extrCached and tick() - extrScan > 2 then
extrScan = tick()
for _, d in ipairs(pg:GetDescendants()) do
if (d:IsA("TextLabel") or d:IsA("TextButton")) and S.farm.stopText(d.Text) then
extrCached = d
break
end
end
end
-- so usa os items quando o SERVIDOR confirma que voce esta extraindo (nada de flag local)
if S.farm.raw() == true then return true end
return S.farm.localExt == true and S.farm.isBarn(S.farm.localGen)
end
task.spawn(function()
while true do
task.wait(0.25)
if extrOn then
pcall(function()
if not isExtracting() then
extrUsed = {}
return
end
if extrBusy then return end
local char = me.Character
local inv = char and char:FindFirstChild("Inventory")
if not inv then
local igp = workspace:FindFirstChild("InGamePlayers")
local mine = igp and igp:FindFirstChild(me.Name)
inv = mine and mine:FindFirstChild("Inventory")
end
if not (char and inv) then return end
for _, slot in ipairs(inv:GetChildren()) do
if slot.Name:match("^Slot%d+$") then
local name = slotName(slot)
for _, key in ipairs(EXTR_ITEMS) do
if name:find(key, 1, true) then
local id = slot.Name .. ":" .. name
if not extrUsed[id] then
extrUsed[id] = true
extrBusy = true
task.spawn(function()
pcall(function()
local ev = ReplicatedStorage:FindFirstChild("Events")
ev = ev and ev:FindFirstChild("ItemEvent")
if ev then ev:InvokeServer(char, slot) end
end)
task.wait(0.3)
extrBusy = false
end)
return
end
end
end
end
end
end)
end
end
end)
ComponentBuilder:CreateToggle("Automations", {
Name = "Auto Use Extraction Items",
CurrentValue = false,
Callback = function(v)
extrOn = v
extrUsed = {}
end,
})
end
-- Automations: Autofarm (do Plagg Hub)
xpcall(function()
local LocalPlayer = me
local Enabled = false
local DefaultGravity = workspace.Gravity
local SprintThread = nil
local avoidDist = 35
local priorityMode, skipBusy = "Safest", true
local avoidDangerDist = 65
S.Dangerous = {
    ["DessaMonster"] = true,
    ["DiodaMonster"] = true,
    ["DandyMonster"] = true,
    ["DyleMonster"] = true,
    ["BassieMonster"] = true,
    ["ScrapsMonster"] = true,
    ["GoobMonster"] = true,
    ["GigiMonster"] = true,
    ["GingerMonster"] = true,
    ["SproutMonster"] = true,
}
local DangerousTwisteds = S.Dangerous
local IgnoreList = {
    ["RazzleDazzleMonster"] = true,
    ["SquirmMonster"] = true,
    ["RodgerMonster"] = true,
    ["WaxwellMonster"] = true,
    ["BlottMonster"] = true
}

local function SafeTeleport(targetCFrame)
    local char = LocalPlayer.Character
    if char and char:FindFirstChild("HumanoidRootPart") then
        char:PivotTo(targetCFrame)
    end
end

local function IsPlayerExtracting()
    return S.farm.srv()
end

local function IsBeingChased()
    local room = workspace:FindFirstChild("CurrentRoom")
    if not room then
        return false
    end
    for _, map in pairs(room:GetChildren()) do
        local mFolder = map:FindFirstChild("Monsters")
        if mFolder then
            for _, m in pairs(mFolder:GetChildren()) do
                if not IgnoreList[m.Name] then
                    local cv = m:FindFirstChild("ChasingValue")
                    if cv and (cv.Value == LocalPlayer.Name or (cv:IsA("ObjectValue") and cv.Value and cv.Value.Name == LocalPlayer.Name)) then
                        return true
                    end
                end
            end
        end
    end
    return false
end

local HAND_RADIUS = 5
local handCache, handAt = {}, -100
local function handPositions()
    if tick() - handAt < 0.1 then return handCache end
    handAt = tick()
    pcall(hazStart)
    local list = {}
    handCache = list
    for t in pairs(haz.hand) do
        if t.Parent then
            local ok, p = pcall(function()
                if t:IsA("BasePart") then return t.Position end
                return t:GetPivot().Position
            end)
            if ok and p then list[#list + 1] = p end
        end
    end
    return list
end

local function monRootOf(m)
    local r = m:FindFirstChild("HumanoidRootPart")
    if r and r:IsA("BasePart") then return r end
    -- sem HumanoidRootPart: so aceita se for mesmo um twisted (nome termina em Monster)
    if tostring(m.Name):match("Monster$") then
        r = m.PrimaryPart
        if r and r:IsA("BasePart") then return r end
        return m:FindFirstChildWhichIsA("BasePart", true)
    end
    return nil
end
-- twisted perto de pos? usa o snap (inclui andares com estrutura diferente) + a pasta Monsters direto
local function monsterNear(pos)
    local seen = {}
    local function chk(m)
        if seen[m] or not m.Parent or IgnoreList[m.Name] or S.monAlias[tostring(m.Name):lower()] then return false end
        seen[m] = true
        local root = monRootOf(m)
        if not root then return false end
        local limit = DangerousTwisteds[m.Name] and avoidDangerDist or avoidDist
        local dist = (root.Position - pos).Magnitude
        return dist <= limit
    end
    for _, m in ipairs(snap.mon) do
        if chk(m) then return true end
    end
    local room = workspace:FindFirstChild("CurrentRoom")
    if room then
        for _, map in pairs(room:GetChildren()) do
            local mf = map:FindFirstChild("Monsters")
            if mf then
                for _, m in pairs(mf:GetChildren()) do
                    if m:IsA("Folder") then
                        for _, m2 in pairs(m:GetChildren()) do
                            if chk(m2) then return true end
                        end
                    elseif chk(m) then return true end
                end
            end
        end
    end
    return false
end
-- pos dentro (ou a ate 4 studs) de algum Sprout Tendril
local function insideTendril(pos)
    pcall(hazStart)
    for t in pairs(haz.tend) do
        if t.Parent then
            local ok, cf, size = pcall(function()
                if t:IsA("BasePart") then return t.CFrame, t.Size end
                return t:GetBoundingBox()
            end)
            if ok and cf and size then
                local rel = cf:PointToObjectSpace(pos)
                local half = size / 2 + Vector3.new(4, 4, 4)
                if math.abs(rel.X) <= half.X and math.abs(rel.Y) <= half.Y and math.abs(rel.Z) <= half.Z then
                    return true
                end
            end
        end
    end
    return false
end
local function IsDangerNear(pos)
    for _, hp in ipairs(handPositions()) do
        if (hp - pos).Magnitude <= HAND_RADIUS then
            return true
        end
    end
    if insideTendril(pos) then return true end
    return monsterNear(pos)
end

local hideAt = nil
local function threatNear(pos)
    return monsterNear(pos)
end
local function needHide()
    return IsBeingChased() or (hideAt ~= nil and threatNear(hideAt))
end

local function AbortExtractions()
    local room = workspace:FindFirstChild("CurrentRoom")
    if not room then
        return
    end
    for _, map in pairs(room:GetChildren()) do
        local gens = map:FindFirstChild("Generators")
        if gens then
            for _, gen in pairs(gens:GetChildren()) do
                local stats = gen:FindFirstChild("Stats")
                local stopRemote = stats and stats:FindFirstChild("StopInteracting")
                if stopRemote then
                    stopRemote:FireServer("Stop")
                end
            end
        end
    end
end

local function getElevatorPos()
    local e = workspace:FindFirstChild("Elevators")
    e = e and e:FindFirstChild("Elevator")
    if not e then return nil end
    local b = e:FindFirstChild("Base")
    if b and b:IsA("BasePart") then return b.Position + Vector3.new(0, 4, 0) end
    return e:GetPivot().Position + Vector3.new(0, 4, 0)
end

local function allGeneratorsDone()
    local info = workspace:FindFirstChild("Info")
    local c = info and info:FindFirstChild("GeneratorsCompleted") and info.GeneratorsCompleted.Value
    local r = info and info:FindFirstChild("RequiredGenerators") and info.RequiredGenerators.Value
    if type(c) == "number" and type(r) == "number" and r > 0 then return c >= r end
    return false
end

local function inElevator(hrp)
    local e = workspace:FindFirstChild("Elevators")
    e = e and e:FindFirstChild("Elevator")
    if not e then return false end
    local ok, cf, size = pcall(function() return e:GetBoundingBox() end)
    if not ok or not cf then return false end
    local rel = cf:PointToObjectSpace(hrp.Position)
    return math.abs(rel.X) <= size.X / 2 + 2
        and math.abs(rel.Z) <= size.Z / 2 + 2
        and math.abs(rel.Y) <= size.Y / 2 + 8
end

--==================================================================
local RunService = RS
local NoclipConnection = nil
local noclipManual = false
local noclipAuto = false
local noclipCleaned = setmetatable({}, {__mode = "k"})
local noclipOrig = setmetatable({}, {__mode = "k"})

local noclipSuspended = false

local function restoreCollision()
    for part, was in pairs(noclipOrig) do
        pcall(function()
            if part.Parent then part.CanCollide = was end
        end)
    end
    noclipOrig = setmetatable({}, {__mode = "k"})
end

local function applyNoclip()
    local character = LocalPlayer.Character
    if not character then return end
    -- dentro do elevador o noclip pausa (senão você cai pelo chão)
    local root = character:FindFirstChild("HumanoidRootPart")
    if root and inElevator(root) then
        if not noclipSuspended then
            noclipSuspended = true
            restoreCollision()
        end
        return
    end
    noclipSuspended = false
    for _, part in ipairs(character:GetDescendants()) do
        if part:IsA("BasePart") then
            if not noclipCleaned[part] then
                noclipCleaned[part] = true
                if getconnections then
                    pcall(function()
                        for _, conn in ipairs(getconnections(part:GetPropertyChangedSignal("CanQuery"))) do conn:Disconnect() end
                        for _, conn in ipairs(getconnections(part:GetPropertyChangedSignal("CanCollide"))) do conn:Disconnect() end
                        for _, conn in ipairs(getconnections(part:GetPropertyChangedSignal("CanTouch"))) do conn:Disconnect() end
                        for _, conn in ipairs(getconnections(part.Changed)) do conn:Disconnect() end
                    end)
                end
            end
            if noclipOrig[part] == nil then noclipOrig[part] = part.CanCollide end
            part.CanCollide = false
        end
    end
end

local function updateNoclip()
    local want = noclipManual or noclipAuto
    if want then
        if not NoclipConnection then
            NoclipConnection = RunService.Stepped:Connect(applyNoclip)
        end
    else
        if NoclipConnection then
            NoclipConnection:Disconnect()
            NoclipConnection = nil
        end
        restoreCollision()
    end
end

--==================================================================
-- AUTOFARM PERSISTENTE
--==================================================================
local TWEEN_SPEED = 20 -- studs por segundo
local currentTween = nil
local colliderList, colliderAt = {}, -100

local function cancelTween()
    if currentTween then
        pcall(function() currentTween:Cancel() end)
        currentTween = nil
    end
end

local function nearestCollider(hrp)
    if tick() - colliderAt > 5 then
        colliderAt = tick()
        colliderList = {}
        for _, d in ipairs(workspace:GetDescendants()) do
            if (d.Name == "NoClip_Collider" or d.Name == "NoClip") and d:IsA("BasePart") then
                local skip = d.Parent and (d.Parent.Name == "GigiHoard" or d.Parent.Name == "InformationBoard") or false
                local a = d.Parent
                while a and a ~= workspace do
                    local ln = a.Name:lower()
                    if a.Name == "Column" then skip = true break end
                    if ln:find("plant", 1, true) then skip = true break end
                    if ln:find("crate", 1, true) then skip = true break end
                    if a.Name == "Pot" then skip = true break end
                    if a.Name == "GigiHoard" or a.Name == "InformationBoard" then skip = true break end
                    a = a.Parent
                end
                local mdl = d:FindFirstAncestorOfClass("Model")
                if not skip and not (mdl and mdl:FindFirstChildOfClass("Humanoid")) then
                    colliderList[#colliderList + 1] = d
                end
            end
        end
    end
    pcall(hazStart)
    local tpos = {}
    for t in pairs(haz.tend) do
        if t.Parent then
            local ok, p = pcall(function()
                if t:IsA("BasePart") then return t.Position end
                return t:GetPivot().Position
            end)
            if ok and p then tpos[#tpos + 1] = p end
        end
    end
    local hpos = handPositions()
    local function hasHand(c)
        if #hpos == 0 then return false end
        local half = c.Size / 2 + Vector3.new(HAND_RADIUS, HAND_RADIUS, HAND_RADIUS)
        for _, p in ipairs(hpos) do
            local rel = c.CFrame:PointToObjectSpace(p)
            if math.abs(rel.X) <= half.X and math.abs(rel.Y) <= half.Y and math.abs(rel.Z) <= half.Z then
                return true
            end
        end
        return false
    end
    local function hasTendril(c)
        if hasHand(c) then return true end
        if #tpos == 0 then return false end
        local half = c.Size / 2 + Vector3.new(4, 4, 4)
        for _, p in ipairs(tpos) do
            local rel = c.CFrame:PointToObjectSpace(p)
            if math.abs(rel.X) <= half.X and math.abs(rel.Y) <= half.Y and math.abs(rel.Z) <= half.Z then
                return true
            end
        end
        return false
    end
    local best, bestDist = nil, math.huge
    local safeBest, safeDist = nil, math.huge
    for _, c in ipairs(colliderList) do
        if c.Parent then
            local dist = (c.Position - hrp.Position).Magnitude
            if dist < bestDist then
                best, bestDist = c, dist
            end
            if dist < safeDist and not hasTendril(c) then
                safeBest, safeDist = c, dist
            end
        end
    end
    return safeBest or best
end

local function genDone(g)
    local st = g:FindFirstChild("Stats")
    local c = st and st:FindFirstChild("Completed")
    return c ~= nil and c.Value == true
end

-- mantém o personagem SEMPRE em pé (sem deitar / sem inclinar)
local standingChar = nil

local function uprightCF(pos, refCF)
    local look = refCF.LookVector
    local flat = Vector3.new(look.X, 0, look.Z)
    if flat.Magnitude < 0.01 then flat = Vector3.new(0, 0, -1) end
    return CFrame.lookAt(pos, pos + flat.Unit)
end

local function frontSpot(g, fallbackPos)
    local v = g:FindFirstChild("Valve", true)
    if v and not v:IsA("BasePart") then v = v:FindFirstChildWhichIsA("BasePart", true) end
    local vp = (v and v.Position) or fallbackPos
    local center = g:GetPivot().Position
    local d = Vector3.new(vp.X - center.X, 0, vp.Z - center.Z)
    if d.Magnitude < 0.5 and v then
        local lv = v.CFrame.LookVector
        d = Vector3.new(lv.X, 0, lv.Z)
    end
    if d.Magnitude < 0.01 then d = Vector3.new(0, 0, 1) end
    local pos = vp + d.Unit * 3 + Vector3.new(0, 2, 0)
    -- fica no chao (na coordenada X/Z do ponto) em vez de flutuar: evita lag back
    pcall(function()
        local ch = me.Character
        local h = ch and ch:FindFirstChildOfClass("Humanoid")
        local root = ch and ch:FindFirstChild("HumanoidRootPart")
        local hover = ((h and h.HipHeight) or 2) + ((root and root.Size.Y / 2) or 1)
        local rp = RaycastParams.new()
        rp.FilterType = Enum.RaycastFilterType.Exclude
        rp.FilterDescendantsInstances = {ch, g}
        local hit = workspace:Raycast(Vector3.new(pos.X, vp.Y + 3, pos.Z), Vector3.new(0, -80, 0), rp)
        if hit then pos = Vector3.new(pos.X, hit.Position.Y + hover + 0.2, pos.Z) end
    end)
    return CFrame.lookAt(pos, Vector3.new(vp.X, pos.Y, vp.Z))
end
S.frontSpot = frontSpot

local function keepStanding(char, hrp)
    local hum = char and char:FindFirstChildOfClass("Humanoid")
    if not (hum and hrp) then return end
    pcall(function()
        if standingChar ~= char then
            standingChar = char
            hum:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
            hum:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false)
        end
        hum.PlatformStand = false
        hum.Sit = false
        local st = hum:GetState()
        if st == Enum.HumanoidStateType.FallingDown or st == Enum.HumanoidStateType.Ragdoll
            or st == Enum.HumanoidStateType.PlatformStanding or st == Enum.HumanoidStateType.Physics then
            hum:ChangeState(Enum.HumanoidStateType.Running)
        end
    end)
    -- se estiver inclinado/deitado, endireita (sem mexer enquanto o tween roda)
    local tweening = currentTween and currentTween.PlaybackState == Enum.PlaybackState.Playing
    if not tweening and not hrp.Anchored and hrp.CFrame.UpVector.Y < 0.99 then
        hrp.CFrame = uprightCF(hrp.Position, hrp.CFrame)
    end
end

local function minMonsterDist(pos)
    local best = 1e4
    local room = workspace:FindFirstChild("CurrentRoom")
    if not room then return best end
    for _, map in pairs(room:GetChildren()) do
        local mf = map:FindFirstChild("Monsters")
        if mf then
            for _, m in pairs(mf:GetChildren()) do
                local root = m:FindFirstChild("HumanoidRootPart")
                if root and not IgnoreList[m.Name] then
                    local d = (root.Position - pos).Magnitude
                    if d < best then best = d end
                end
            end
        end
    end
    return best
end
local function genBusy(g)
    local pr = genProg[g]
    return pr ~= nil and tick() - pr.t < 1.5
end
local function RunAutoFarm()
    task.spawn(function()
        local currentGen = nil
        local extractingGen = nil
        local localExtracting = false   -- flag local: setado ao disparar o prompt, limpo quando servidor confirma fim
        local localExtractingGen = nil  -- qual máquina está sendo feita localmente
        local localSince = 0            -- quando a flag local foi marcada
        local lastAmt, lastAmtAt = -1, 0 -- progresso da maquina travada
        local pickSince, pickIgnoreUntil = nil, 0
        while Enabled do
            local char = LocalPlayer.Character
            local hrp = char and char:FindFirstChild("HumanoidRootPart")
            if S.buying then
                task.wait(0.1)
                continue
            end
            veeBusy = false
            S.farm.state = "Idle"
            if char and hrp then keepStanding(char, hrp) end
            -- gravidade 0 só dentro do mapa; no elevador / panic fica normal
            if not collectingState then
                local roomNow = workspace:FindFirstChild("CurrentRoom")
                local infoNow = workspace:FindFirstChild("Info")
                local panicNow = infoNow and infoNow:FindFirstChild("Panic") and infoNow.Panic.Value == true
                local wantZero = roomNow ~= nil and not panicNow and not allGeneratorsDone() and not (hrp and inElevator(hrp))
                local normalGrav = (DefaultGravity > 0) and DefaultGravity or 196.2
                local g = wantZero and 0 or normalGrav
                if workspace.Gravity ~= g then workspace.Gravity = g end
            end

            -- guarda continua: em qualquer momento que voce esta numa maquina (extraindo, apertando o prompt
            -- ou preso nela) e um twisted entra na distancia, para e se esconde
            local atMachine = IsPlayerExtracting() or localExtracting
                or (currentGen ~= nil and hrp ~= nil and currentGen.Parent ~= nil
                    and (currentGen:GetPivot().Position - hrp.Position).Magnitude < 20)
            if hrp and not hideAt and atMachine and threatNear(hrp.Position) then
                hideAt = hrp.Position
                AbortExtractions()
            end

            -- Twisted TE VIU (chasing) ou perto da maquina: noclip + tween (velocidade 20) ate a coluna mais proxima
            local firstHide = S.farm.startHide and workspace:FindFirstChild("CurrentRoom") ~= nil
                and hrp ~= nil and not inElevator(hrp) and not allGeneratorsDone()
            if needHide() or firstHide then
                if collectingState then collectingState = false savedPosition = nil end
                S.farm.state = "Hiding"
                veeBusy = true
                noclipAuto = true
                updateNoclip()
                task.spawn(function()
                    while Enabled and needHide() do
                        AbortExtractions()
                        task.wait(0.1)
                    end
                end)
                local tweenTarget = nil
                local hideT0, arrivedAt = tick(), nil
                -- NAO ancora o HRP (parte ancorada nao replica a posicao pro servidor e voce
                -- leva dano onde o servidor acha que voce esta). Fixa a posicao todo frame.
                local pinCF = nil
                local safeSince = nil
                local pinConn = RS.Heartbeat:Connect(function()
                    if pinCF then
                        local h = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                        if h then
                            h.AssemblyLinearVelocity = Vector3.zero
                            h.AssemblyAngularVelocity = Vector3.zero
                            h.CFrame = pinCF
                        end
                    end
                end)
                repeat
                    char = LocalPlayer.Character
                    hrp = char and char:FindFirstChild("HumanoidRootPart")
                    if hrp then
                        hrp.AssemblyLinearVelocity = Vector3.zero
                        hrp.AssemblyAngularVelocity = Vector3.zero
                        keepStanding(char, hrp)
                        local col = nearestCollider(hrp)
                        if col then
                            -- X e Z da peca, altura (Y) do proprio jogador
                            local cpos = Vector3.new(col.Position.X, hrp.Position.Y, col.Position.Z)
                            local dist = (cpos - hrp.Position).Magnitude
                            if dist > 2 then
                                pinCF = nil
                                if tweenTarget ~= col or not currentTween or currentTween.PlaybackState ~= Enum.PlaybackState.Playing then
                                    hrp.Anchored = false
                                    cancelTween()
                                    tweenTarget = col
                                    currentTween = TweenService:Create(
                                        hrp,
                                        TweenInfo.new(dist / TWEEN_SPEED, Enum.EasingStyle.Linear),
                                        {CFrame = CFrame.new(cpos) * hrp.CFrame.Rotation}
                                    )
                                    currentTween:Play()
                                end
                            else
                                -- chegou: fica preso dentro da peça, sem poder se mexer
                                cancelTween()
                                hrp.Anchored = false
                                arrivedAt = arrivedAt or tick()
                                pinCF = pinCF or (CFrame.new(cpos) * hrp.CFrame.Rotation)
                                hrp.CFrame = pinCF
                            end
                        end
                    end
                    if needHide() then
                        safeSince = nil
                        firstHide = false
                    elseif not safeSince and not firstHide then
                        safeSince = tick()
                    end
                    task.wait(0.1)
                until not Enabled or (safeSince and tick() - safeSince >= 5)
                    or (firstHide and ((arrivedAt and tick() - arrivedAt >= 1) or tick() - hideT0 > 15))
                S.farm.startHide = false
                pinCF = nil
                pinConn:Disconnect()
                cancelTween()
                local hNow = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                if hNow then hNow.Anchored = false end
                task.wait(0.05)
                hideAt = nil
                noclipAuto = false
                updateNoclip()
                veeBusy = false
                currentGen = nil
                extractingGen = nil
                continue
            end

            -- Auto TP Elevator: panic ou todas as máquinas prontas -> vai pro elevador e fica lá
            local Info = workspace:FindFirstChild("Info")
            local panic = Info and Info:FindFirstChild("Panic") and Info.Panic.Value == true
            if panic or allGeneratorsDone() then
                if collectingState then collectingState = false savedPosition = nil end
                veeBusy = true
                if hrp and not inElevator(hrp) then
                    local epos = getElevatorPos()
                    if epos then
                        hrp.AssemblyLinearVelocity = Vector3.zero
                        hrp.CFrame = uprightCF(epos, hrp.CFrame)
                    end
                end
                task.wait(0.2)
                continue
            end
            local Room = workspace:FindFirstChild("CurrentRoom")

            -- Se está extraindo (flag local OU servidor confirmou), NÃO faz mais nada
            -- (nem items, nem troca de máquina) até a extração acabar
            -- limpa flag local assim que servidor confirma que parou
            -- TRAVA: depois de apertar o prompt fica preso na maquina ate ela terminar,
            -- sumir, ou ficar 6s sem nenhum progresso nem sinal de extracao
            -- Force Autofarm Get Items: para de extrair pra pegar os items
            if S.farm.force and S.farm.picking() and (localExtracting or IsPlayerExtracting()) and S.farm.hasTargets() then
                pcall(AbortExtractions)
                localExtracting = false
                S.farm.localExt = false
                localExtractingGen = nil
                extractingGen = nil
                S.farm.srvAt = nil
            end
            if localExtracting then
                local lg = localExtractingGen
                if not lg or not lg.Parent or genDone(lg) then
                    S.farm.dbg("Lock released: " .. ((not lg or not lg.Parent) and "machine gone" or "machine done"))
                    localExtracting = false
                    S.farm.localExt = false
                    localExtractingGen = nil
                else
                    local st = lg:FindFirstChild("Stats")
                    local ca = st and st:FindFirstChild("CurrentAmount")
                    local amt = ca and tonumber(ca.Value) or 0
                    if amt ~= lastAmt then
                        lastAmt = amt
                        lastAmtAt = tick()
                    end
                    if IsPlayerExtracting() then lastAmtAt = tick() end
                    if tick() - math.max(localSince, lastAmtAt) > (S.farm.isBarn(lg) and 15 or 10) then
                        S.farm.dbg("Lock released: no progress/signal")
                        localExtracting = false
                        S.farm.localExt = false
                        localExtractingGen = nil
                    end
                end
            end
            if localExtracting or IsPlayerExtracting() then
                S.farm.state = "Extracting"
                -- registra qual máquina está sendo usada (para travamento)
                if localExtractingGen and localExtractingGen.Parent then
                    extractingGen = localExtractingGen
                end
                if not extractingGen then
                    -- tenta descobrir a máquina mais próxima do jogador como âncora
                    if hrp and Room then
                        local closestG, closestD = nil, math.huge
                        for _, map in pairs(Room:GetChildren()) do
                            local gens = map:FindFirstChild("Generators")
                            if gens then
                                for _, g in pairs(gens:GetChildren()) do
                                    if not genDone(g) then
                                        local d = (g:GetPivot().Position - hrp.Position).Magnitude
                                        if d < closestD then closestD = d closestG = g end
                                    end
                                end
                            end
                        end
                        extractingGen = closestG or currentGen
                    end
                end
                -- fica parado na máquina atual, sem teleportar
                if extractingGen and extractingGen.Parent and not genDone(extractingGen) then
                    -- so volta pro MESMO ponto onde apertou o prompt (antes recalculava pelo centro da maquina,
                    -- que pode ficar a mais de 8 studs do prompt e te tirava de la no meio da extracao)
                    local spot = (extractingGen == S.farm.lockGen) and S.farm.lockSpot or nil
                    if hrp and spot then
                        if (hrp.Position - spot.Position).Magnitude > 8 then
                            SafeTeleport(spot)
                        elseif spot.LookVector:Dot(hrp.CFrame.LookVector) < 0.9 then
                            -- so gira para ficar de frente com a valve
                            hrp.CFrame = CFrame.lookAt(hrp.Position, hrp.Position + spot.LookVector)
                        end
                    end
                else
                    -- máquina terminou ou sumiu
                    currentGen = nil
                    extractingGen = nil
                    localExtracting = false
                    S.farm.localExt = false
                    localExtractingGen = nil
                end
                task.wait(0.1)
                continue
            end

            -- Extração terminou: limpa os locks
            extractingGen = nil
            localExtracting = false
            S.farm.localExt = false
            localExtractingGen = nil

            -- ITEMS PRIMEIRO: o pick up padrao coleta (em segundo plano) e o autofarm espera ele terminar
            local pendingItems = false
            if S.farm.picking() and tick() >= pickIgnoreUntil then
                pendingItems = S.farm.hasTargets()
            end
            if collectingState or pendingItems then
                pickSince = pickSince or tick()
                if tick() - pickSince > 8 and not S.farm.force then
                    -- item impossivel de pegar: ignora items por 10s e vai pra maquina
                    pickIgnoreUntil = tick() + 10
                    pickSince = nil
                else
                    task.wait(0.05)
                    continue
                end
            else
                pickSince = nil
            end

            if Room and hrp then
                local targetGen, targetPrompt = nil, nil
                local bestDist = math.huge
                for _, map in pairs(Room:GetChildren()) do
                    local gens = map:FindFirstChild("Generators")
                    if gens then
                        for _, g in pairs(gens:GetChildren()) do
                            if not genDone(g) then
                                local p = g:FindFirstChildWhichIsA("ProximityPrompt", true)
                                if p and p.Enabled then
                                    local pos = g:GetPivot().Position
                                    if not IsDangerNear(pos) then
                                        local d = (pos - hrp.Position).Magnitude
                                        local score = d
                                        if priorityMode == "Safest" then score = -minMonsterDist(pos) + d * 0.01 end
                                        if skipBusy and genBusy(g) then score = math.huge end
                                        if score < bestDist then
                                            bestDist = score
                                            targetGen = g
                                            targetPrompt = p
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
                currentGen = targetGen
                if targetGen then
                    S.farm.state = "Going to machine"
                    -- vai ate o proprio prompt (o centro da maquina pode ficar fora do alcance)
                    local ppos = targetGen:GetPivot().Position
                    pcall(function()
                        local par = targetPrompt.Parent
                        if par:IsA("BasePart") then ppos = par.Position
                        elseif par:IsA("Attachment") then ppos = par.WorldPosition end
                    end)
                    local spot = frontSpot(targetGen, ppos)
                    -- twisted chegou perto enquanto escolhia: cancela e escolhe de novo
                    if IsDangerNear(ppos) or IsDangerNear(spot.Position) then
                        currentGen = nil
                        task.wait(0.1)
                        continue
                    end
                    S.farm.dbg("TP to machine | extracting=" .. tostring(S.farm.extracting()) .. " raw=" .. tostring(S.farm.raw()) .. " gui=" .. tostring(S.farm.gui()))
                    SafeTeleport(spot)
                    if targetPrompt and targetPrompt.Enabled and fireproximityprompt then
                        pcall(function()
                            targetPrompt.HoldDuration = 0
                            targetPrompt.RequiresLineOfSight = false
                        end)
                        -- da tempo do servidor registrar a nova posicao antes de apertar
                        task.wait(0.12)
                        -- aperta o prompt muito rapido ate a extracao comecar
                        local t0 = tick()
                        local barn = S.farm.isBarn(targetGen)
                        local function genAmt()
                            local st = targetGen:FindFirstChild("Stats")
                            local ca = st and st:FindFirstChild("CurrentAmount")
                            return ca and tonumber(ca.Value) or 0
                        end
                        local amt0 = genAmt()
                        repeat
                            local h2 = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                            if h2 and (h2.Position - spot.Position).Magnitude > 5 then
                                SafeTeleport(spot)
                            end
                            for _ = 1, (barn and 1 or 6) do
                                fireproximityprompt(targetPrompt)
                            end
                            task.wait(0.05)
                        until not Enabled or IsPlayerExtracting() or genAmt() ~= amt0 or genDone(targetGen)
                            or not targetPrompt.Parent or needHide() or tick() - t0 > 1.5
                            or IsDangerNear(spot.Position) or (barn and tick() - t0 > 0.3)
                        -- so trava na maquina se a extracao realmente comecou; se o prompt
                        -- falhou, nao fica preso: tenta de novo na hora
                        -- maquina do Barnaby (ScreenBorder): o servidor nao marca extracao, trava pelo aperto
                        if IsPlayerExtracting() or genAmt() ~= amt0 or (barn and Enabled and not genDone(targetGen) and targetPrompt.Parent and not needHide()) then
                            S.farm.localGen = targetGen
                            S.farm.lockGen = targetGen
                            S.farm.lockSpot = spot
                            localExtracting = true
                            localSince = tick()
                            lastAmtAt = tick()
                            lastAmt = -1
                            S.farm.localExt = true
                            localExtractingGen = targetGen
                        end
                    end
                end
            end
            if not currentGen then task.wait(0.15) else task.wait() end
        end
        cancelTween()
        local hEnd = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if hEnd then hEnd.Anchored = false end
        noclipAuto = false
        updateNoclip()
        veeBusy = false
    end)
end
ComponentBuilder:CreateToggle("Automations", {
    Name = "Autofarm",
    CurrentValue = false,
    Callback = function(Value)
        Enabled = Value
        S.farm.on = Value
        S.farm.startHide = Value
        if Enabled then
            if workspace.Gravity > 0 then DefaultGravity = workspace.Gravity end
            workspace.Gravity = 0
            RunAutoFarm()
            SprintThread = task.spawn(function()
                local lp = game.Players.LocalPlayer
                local rs = game:GetService("ReplicatedStorage")
                local sprintEvent = rs:WaitForChild("Events"):WaitForChild("SprintEvent")
                local isSprinting = false
                while Enabled and task.wait(0.2) do
                    local stats = workspace:FindFirstChild("InGamePlayers") and workspace.InGamePlayers:FindFirstChild(lp.Name) and workspace.InGamePlayers[lp.Name]:FindFirstChild("Stats") and workspace.InGamePlayers[lp.Name].Stats:FindFirstChild("CurrentStamina")
                    if stats then
                        local stam = stats.Value
                        if not isSprinting and (stam > 20) then
                            sprintEvent:FireServer(true)
                            isSprinting = true
                        elseif isSprinting and (stam < 20) then
                            sprintEvent:FireServer(false)
                            isSprinting = false
                        elseif not isSprinting and (stam >= 40) then
                            sprintEvent:FireServer(true)
                            isSprinting = true
                        end
                    end
                end
            end)
        else
            workspace.Gravity = DefaultGravity
            if SprintThread then
                task.cancel(SprintThread)
                SprintThread = nil
            end
            pcall(function()
                ReplicatedStorage.Events.SprintEvent:FireServer(false)
            end)
        end
    end,
})
ComponentBuilder:CreateDropdown("Automations", {
    Name = "Autofarm Machine Priority",
    Options = {"Closest", "Safest"},
    Default = "Safest",
    Callback = function(v) priorityMode = v end,
})
ComponentBuilder:CreateSlider("Automations", {
Name = "Dodge normal twisteds distance",
Min = 10,
Max = 100,
Default = 35,
Step = 1,
Callback = function(v) avoidDist = v end,
})
ComponentBuilder:CreateSlider("Automations", {
Name = "Dodge dangerous twisteds distance",
Min = 10,
Max = 150,
Default = 65,
Step = 1,
Callback = function(v) avoidDangerDist = v end,
})
ComponentBuilder:CreateToggle("Automations", {
Name = "Pick Up Items On Autofarm",
CurrentValue = true,
Callback = function(v) S.farm.pick = v end,
})
ComponentBuilder:CreateToggle("Automations", {
Name = "Force Autofarm Get Items",
CurrentValue = false,
Callback = function(v) S.farm.force = v end,
})
ComponentBuilder:CreateSlider("Automations", {
Name = "Max Heals Limit",
Min = 0,
Max = 4,
Default = 2,
Step = 1,
Callback = function(v) S.farm.maxHeals = v end,
})
do
local allowed = {}
for _, k in ipairs({"Bandage", "HealthKit", "ExtractionSpeedCandy", "SkillCheckCandy", "Jawbreaker", "JumperCable",
"Instructions", "BonBon", "Valve", "ResearchCapsule", "Tape", "Pumpkins", "Basket", "DandyEasterEggs",
"ChristmasCookie", "Ornament"}) do allowed[k] = true end
local defaultBL = {}
for _, k in ipairs(S.itemList) do
if not allowed[k] then
defaultBL[#defaultBL + 1] = k
S.farm.bl[k] = true
end
end
ComponentBuilder:CreateMultiDropdown("Automations", {
Name = "Autofarm Pick Up Blacklist",
Options = S.itemList,
Default = defaultBL,
Callback = function(map) S.farm.bl = map end,
})
-- Auto Buy Dandy Shop
local buyOn = false
local buyBL = {}
for _, k in ipairs(defaultBL) do buyBL[k] = true end
local buyTried = setmetatable({}, {__mode = "k"})
local buyDone = setmetatable({}, {__mode = "k"}) -- prompt -> ate quando nao volta a comprar
-- procura dentro do slot um objeto com o nome de um item que NAO esta na blacklist
local function slotItem(slot)
    local allowed = {}
    for _, k in ipairs(S.itemList) do
        if not buyBL[k] then allowed[k:lower()] = k end
    end
    local function check(x)
        if type(x) == "string" then return allowed[x:lower()] end
        return nil
    end
    local hit = check(slot.Name)
    if hit then return hit end
    for _, d in ipairs(slot:GetDescendants()) do
        hit = check(d.Name)
        if not hit and d:IsA("StringValue") then hit = check(d.Value) end
        if hit then return hit end
    end
    return nil
end
local function buyTargets()
    local e = workspace:FindFirstChild("Elevators")
    e = e and e:FindFirstChild("Elevator")
    local store = e and e:FindFirstChild("DandyStore")
    local list = {}
    if not store then return list, "DandyStore not found" end
    local dbg = {}
    for _, slot in ipairs(store:GetChildren()) do
        if slot.Name:match("^Slot%d+$") then
            local prompt = slot:FindFirstChildWhichIsA("ProximityPrompt", true)
            local item = slotItem(slot)
            local names = {}
            for _, d in ipairs(slot:GetDescendants()) do
                if #names < 12 then names[#names + 1] = d.Name end
            end
            dbg[#dbg + 1] = slot.Name .. " prompt=" .. tostring(prompt ~= nil) .. (prompt and (" on=" .. tostring(prompt.Enabled)) or "") .. " item=" .. tostring(item) .. " [" .. table.concat(names, ",") .. "]"
            if prompt and item and not buyBL[item] and (buyDone[prompt] or 0) <= tick() then
                local part = partOf(slot)
                if part then
                    list[#list + 1] = {prompt = prompt, item = item, part = part, heal = (item == "Bandage" or item == "HealthKit")}
                end
            end
        end
    end
    return list, table.concat(dbg, " | ")
end
local function buyTween(hrp, pos, back)
    local dist = (pos - hrp.Position).Magnitude
    if dist < 1 then return end
    local tw = TweenService:Create(hrp, TweenInfo.new(dist / 20, Enum.EasingStyle.Linear), {CFrame = CFrame.new(pos) * hrp.CFrame.Rotation})
    tw:Play()
    while tw.PlaybackState == Enum.PlaybackState.Playing do
        hrp.AssemblyLinearVelocity = Vector3.zero
        if IsBeingChased() or (not back and not buyOn) then
            tw:Cancel()
            return false
        end
        task.wait(0.05)
    end
    return true
end
local function runBuy()
    local char = me.Character
    local hrp = char and char:FindFirstChild("HumanoidRootPart")
    local function why() end
    if not hrp then return why("No character") end
    if IsBeingChased() then return why("Being chased") end
    if inventoryFull() then return why("Inventory full") end
    local targets, dbg = buyTargets()
    if #targets == 0 then
        return why("Nothing to buy: " .. tostring(dbg):sub(1, 220))
    end
    S.buying = true
    veeBusy = true
    local saved = hrp.CFrame
    pcall(function()
        -- espera 4 segundos antes de comprar o primeiro item
        local waited = 0
        while waited < 4 and buyOn do
            if IsBeingChased() then return end
            task.wait(0.2)
            waited = waited + 0.2
        end
        if not buyOn then return end
        local pos = hrp.Position
        while #targets > 0 and buyOn do
            local best, bi, bd = nil, nil, math.huge
            for i, t in ipairs(targets) do
                local d = (t.part.Position - pos).Magnitude - (t.heal and 100000 or 0)
                if d < bd then best, bi, bd = t, i, d end
            end
            table.remove(targets, bi)
            if best.prompt.Parent and (buyDone[best.prompt] or 0) <= tick() and not IsBeingChased() and not inventoryFull() then
                local ok = buyTween(hrp, best.part.Position + Vector3.new(0, 2, 0))
                if ok == false then break end
                pos = hrp.Position
                task.wait(0.15)
                -- aperta 2 vezes e nao volta nesse slot por 20s
                buyDone[best.prompt] = tick() + 20
                if fireproximityprompt then
                    pcall(function()
                        best.prompt.HoldDuration = 0
                        best.prompt.RequiresLineOfSight = false
                    end)
                    for _ = 1, 2 do
                        pcall(fireproximityprompt, best.prompt)
                        task.wait(0.15)
                    end
                end
                task.wait(0.5)
            end
        end
        if not IsBeingChased() then buyTween(hrp, saved.Position, true) end
    end)
    veeBusy = false
    S.buying = false
end
task.spawn(function()
    while true do
        task.wait(1)
        if buyOn and not S.buying and not collectingState and not S.farm.extracting() then
            pcall(runBuy)
        end
    end
end)
ComponentBuilder:CreateToggle("Automations", {
Name = "Auto Buy Dandy Shop",
CurrentValue = false,
Callback = function(v)
buyOn = v
if not v then buyTried = setmetatable({}, {__mode = "k"}) buyDone = setmetatable({}, {__mode = "k"}) end
end,
})
ComponentBuilder:CreateMultiDropdown("Automations", {
Name = "Auto Buy Dandy Shop Blacklist",
Options = S.itemList,
Default = defaultBL,
Callback = function(map) buyBL = map end,
})
end
end, function(e) return e end)
-- Automations: Auto Barnaby
do
local barnLoaded = false
ComponentBuilder:CreateButton("Automations", {
Name = "Auto Barnaby",
Callback = function()
if barnLoaded then return end
barnLoaded = true
local ok = pcall(function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/christmas-cookie/extensions/refs/heads/main/arcademachine", true))()
end)
if not ok then barnLoaded = false end
end,
})
end
do
local swimOn, swimHooked, swimGen = false, false, 0
local function barnabify(session)
if session.tishaGen == swimGen then return end
session.tishaGen = swimGen
local myGen = swimGen
-- botao END GAME (encerra a partida)
pcall(function()
local uisource = ReplicatedStorage.SharedData.ArcadeGames.SwimmyBarnaby.ClientUI
local customui = uisource:Clone()
customui.Name = "end me"
if customui:IsA("ScreenGui") then customui.DisplayOrder = 999999999 end
customui.Parent = pg
local bottom = customui.Bottom
local mobile = bottom.Mobile
local unpressed = mobile.Unpressed
local textlabel = unpressed.TextLabel
local hint = bottom.Hint
textlabel.Text = "END GAME"
bottom.Visible = true
hint.Visible = false
bottom.ZIndex = 9e9
mobile.ZIndex = 9e9
unpressed.ZIndex = 9e9
textlabel.ZIndex = 9e9
mobile.Activated:Connect(function()
session.forcekill = true
customui:Destroy()
end)
task.spawn(function()
while customui.Parent and swimOn and swimGen == myGen and not session.forcekill and session.SessionId do
task.wait(0.5)
end
pcall(function() customui:Destroy() end)
end)
end)
session.forcekill = false
if type(session.tick) == "function" or (getmetatable(session) and session.tick) then
local oldtick = session.tick
session.tick = function(self, ...)
if not swimOn then return oldtick(self, ...) end
if self.forcekill then return -1 end
local result = oldtick(self, ...)
if result == -1 then return 0 end
return result
end
end
if type(session.Jump) == "function" then
local oldJump = session.Jump
session.Jump = function(...)
if swimOn then return end
return oldJump(...)
end
end
if session.Fish and type(session.Fish.Jump) == "function" then
local oldFJump = session.Fish.Jump
session.Fish.Jump = function(...)
if swimOn then return end
return oldFJump(...)
end
end
if session.Fish then
pcall(function() session.Fish:SetGravity(0) end)
if session.Fish.Part then
task.spawn(function()
while session.SessionId and not session.forcekill and swimOn and swimGen == myGen do
pcall(function()
local cf = session.Fish.Part:GetPivot()
session.Fish.Part:PivotTo(CFrame.new(cf.X, 0, cf.Z))
end)
task.wait()
end
end)
end
end
task.spawn(function()
while session.SessionId and not session.forcekill and swimOn and swimGen == myGen do
pcall(function()
if session.Parent then
for _, child in ipairs(session.Parent:GetChildren()) do
if child:IsA("Model") and (child.Name:find("Obstacle") or child:FindFirstChild("BendySeaweed")) then
for _, descendant in ipairs(child:GetDescendants()) do
if descendant:IsA("BasePart") then
descendant.CanCollide = false
descendant.CanTouch = false
descendant:Destroy()
end
end
end
end
end
end)
task.wait()
end
end)
end
local function installSwim()
if swimHooked then return end
swimHooked = true
pcall(function()
local barnabymodule = require(ReplicatedStorage.SharedData.ArcadeGames.SwimmyBarnaby)
local oldstart = barnabymodule.Start
barnabymodule.Start = function(self, creators)
if swimOn and creators and creators.Obstacle then
local oldvein = creators.Obstacle
creators.Obstacle = function(...)
local vein = oldvein(...)
if vein and vein.Model then
pcall(function()
for _, part in ipairs(vein.Model:GetDescendants()) do
if part:IsA("BasePart") then
part.CanCollide = false
part.CanTouch = false
end
end
end)
end
return vein
end
end
local res = oldstart(self, creators)
if swimOn then barnabify(self) end
return res
end
end)
end
local function scanSwim()
pcall(function()
for _, v in ipairs(getgc(true)) do
if type(v) == "table" and rawget(v, "GAME_CONFIG") and rawget(v, "SessionId") then
barnabify(v)
end
end
end)
end
ComponentBuilder:CreateToggle("Automations", {
Name = "Auto Swimmy Barnaby On Lobby",
CurrentValue = false,
Callback = function(v)
swimOn = v
if v then
swimGen = swimGen + 1
installSwim()
scanSwim()
end
end,
})
end
-- Automations: Auto Vote Card
do
local CARDS = {"First Aid", "Medical Attention", "Blind Grab", "Lost and Found", "Spare Change", "Penny Pincher",
"Frugal", "Decency", "Etiquette", "Well-Paced", "Endurance", "TIME'S UP", "Sparkplug", "Piping Tape",
"Frost Shield", "Air Freshener", "Electrician", "Avaricious", "Covetous", "Suppression", "Tech Savvy", "Rehearsal", "Practice"}
local cardKey = {}
for _, c in ipairs(CARDS) do cardKey[c:lower():gsub("[^%a]", "")] = c end
local bestOn, bestBL = false, {}
-- nome da carta -> o que ela faz (usado na blacklist)
local LABEL = {
["First Aid"] = "Heal 1", ["Medical Attention"] = "Heal 2",
["Blind Grab"] = "Random Item 1", ["Lost and Found"] = "Random Item 2",
["Spare Change"] = "Tapes 1", ["Penny Pincher"] = "Tapes 2",
["Frugal"] = "Shop Discount",
["Decency"] = "Panic Time 1", ["Etiquette"] = "Panic Time 2",
["Well-Paced"] = "Max Stamina 1", ["Endurance"] = "Max Stamina 2",
["TIME'S UP"] = "Dyle Floor Challenge",
["Sparkplug"] = "Blackout Glow",
["Piping Tape"] = "Less Ichor Leak",
["Frost Shield"] = "Less Iced Over",
["Air Freshener"] = "Less Spring Fever",
["Electrician"] = "Less Blackout",
["Avaricious"] = "Rare Loot 1", ["Covetous"] = "Rare Loot 2",
["Suppression"] = "Slower Panic Twisteds",
["Tech Savvy"] = "Faster Machines",
["Rehearsal"] = "Ability Cooldown 1", ["Practice"] = "Ability Cooldown 2",
}
local LABEL_CARD, LABEL_LIST = {}, {}
for _, c in ipairs(CARDS) do
local l = LABEL[c]
if l then
LABEL_CARD[l] = c
-- Tech Savvy (Faster Machines) e sempre a 1a escolha e nao pode ir pra blacklist
if c ~= "Tech Savvy" then LABEL_LIST[#LABEL_LIST + 1] = l end
end
end
-- melhor -> pior (menor numero = melhor)
local RANK = {}
for i, group in ipairs({
{"Tech Savvy"}, {"First Aid", "Medical Attention"}, {"Avaricious", "Covetous"}, {"Well-Paced", "Endurance"},
{"Rehearsal", "Practice"}, {"Decency", "Etiquette"}, {"Suppression"}, {"Electrician"}, {"Piping Tape"},
{"Frugal"}, {"Blind Grab", "Lost and Found"},
{"Spare Change", "Penny Pincher"}, {"Sparkplug"}, {"Frost Shield", "Air Freshener"}, {"TIME'S UP"},
}) do
for _, n in ipairs(group) do RANK[n] = i end
end
local lastClick = setmetatable({}, {__mode = "k"})
local function shown(o)
    local x = o
    while x and x:IsA("GuiObject") do
        if not x.Visible then return false end
        x = x.Parent
    end
    local sg = o:FindFirstAncestorWhichIsA("ScreenGui")
    return sg == nil or sg.Enabled
end
local function findButton(lbl)
    local x = lbl
    for _ = 1, 6 do
        if not x or not x:IsA("GuiObject") then break end
        if x:IsA("GuiButton") then return x end
        local b = x:FindFirstChildWhichIsA("GuiButton", true)
        if b and x ~= lbl then return b end
        x = x.Parent
    end
    return nil
end
local function press(b)
    if not getconnections then return end
    for _, sig in ipairs({b.Activated, b.MouseButton1Click, b.MouseButton1Down, b.MouseButton1Up}) do
        pcall(function()
            for _, c in ipairs(getconnections(sig)) do pcall(function() c:Fire() end) end
        end)
    end
end
local TWO_LIFE = {shelly = true, vee = true, astro = true, sprout = true, pebble = true, bassie = true, bobette = true, gourdy = true}
local function lowLife()
local c = me.Character
local h = c and c:FindFirstChildOfClass("Humanoid")
if not h or h.Health <= 0 then return false end
local list = {c and c.Name}
local igp = workspace:FindFirstChild("InGamePlayers")
local mine = igp and igp:FindFirstChild(me.Name)
if mine then list[#list + 1] = mine:GetAttribute("ToonName") end
for _, a in ipairs({"Toon", "Character", "CharacterName", "SelectedToon", "ToonName"}) do
list[#list + 1] = me:GetAttribute(a)
end
local two = false
for _, n in ipairs(list) do
if type(n) == "string" and TWO_LIFE[n:lower():gsub("monster", "")] then two = true end
end
local hp = math.floor(h.Health + 0.5)
-- toon de 2 vidas: cura se estiver com 1; os outros: com 2 ou menos
if two then return hp <= 1 end
return hp <= 2
end
local function fullLife()
local c = me.Character
local h = c and c:FindFirstChildOfClass("Humanoid")
return h ~= nil and h.Health > 0 and h.Health >= h.MaxHealth
end
local function voteStep()
    local pg = Players.LocalPlayer and Players.LocalPlayer:FindFirstChild("PlayerGui")
    if not pg then return end
    local found, seenBtn = {}, {}
    for _, d in ipairs(pg:GetDescendants()) do
        if d:IsA("TextLabel") or d:IsA("TextButton") then
            local t = d.Text
            if #t > 0 and #t < 40 then
                local card = cardKey[t:lower():gsub("<[^>]+>", ""):gsub("[^%a]", "")]
                if card and shown(d) then
                    local b = findButton(d)
                    if b and not seenBtn[b] then
                        seenBtn[b] = true
                        found[#found + 1] = {card = card, btn = b}
                    end
                end
            end
        end
    end
    if #found < 2 then return end
    -- vida baixa: forca votar na carta de cura (ignora a blacklist)
    if lowLife() then
        for _, f in ipairs(found) do
            if f.card == "First Aid" or f.card == "Medical Attention" then
                if tick() - (lastClick[f.btn] or -100) > 4 then
                    lastClick[f.btn] = tick()
                    press(f.btn)
                end
                return
            end
        end
    end
    do
        local pick, pr = nil, 1e9
        local full = fullLife()
        for pass = 1, 2 do
            for _, f in ipairs(found) do
                local heal = f.card == "First Aid" or f.card == "Medical Attention"
                -- vida cheia: nao vota em cura (so se nao sobrar outra opcao)
                if (pass == 2 or not (full and heal)) and (not bestBL[f.card] or f.card == "Tech Savvy") then
                    local r = RANK[f.card] or 50
                    if r < pr then pick, pr = f, r end
                end
            end
            if pick then break end
        end
        if pick and tick() - (lastClick[pick.btn] or -100) > 4 then
            lastClick[pick.btn] = tick()
            press(pick.btn)
        end
        return
    end
end
task.spawn(function()
    while true do
        task.wait(0.6)
        if bestOn then pcall(voteStep) end
    end
end)
local DEFAULT_BL = {"Random Item 1", "Random Item 2", "Panic Time 1", "Panic Time 2", "Slower Panic Twisteds",
"Dyle Floor Challenge", "Blackout Glow", "Less Blackout"}
for _, l in ipairs(DEFAULT_BL) do bestBL[LABEL_CARD[l]] = true end
ComponentBuilder:CreateToggle("Automations", {
Name = "Auto Vote Best Card",
CurrentValue = false,
Callback = function(v) bestOn = v end,
})
ComponentBuilder:CreateMultiDropdown("Automations", {
Name = "Auto Vote Best Card Blacklist",
Options = LABEL_LIST,
Default = DEFAULT_BL,
Callback = function(map)
local bl = {}
for label, on in pairs(map) do
if on and LABEL_CARD[label] then bl[LABEL_CARD[label]] = true end
end
bestBL = bl
end,
})
end
-- Extras
do
local lp = Players.LocalPlayer
-- Player: Anti AFK
local afkOn = true
pcall(function()
    local VU = game:GetService("VirtualUser")
    lp.Idled:Connect(function()
        if afkOn then
            VU:CaptureController()
            VU:ClickButton2(Vector2.new())
        end
    end)
end)
ComponentBuilder:CreateToggle("Player", {
Name = "Anti AFK",
CurrentValue = true,
Callback = function(v) afkOn = v end,
})
end
-- Organiza a ordem das opcoes em cada aba
do
local ORDER = {
Player = {
"Noclip", "Fly", "Fly Speed", "Speed", "Speed Value", "Alt Speed", "TP Walk", "TP Walk Speed", "TP Walk Only On Extract", "TP Walk On Extract Value", "Anti Slip",
"Enable Jump", "Jump Power", "Infinite Jump",
"Infinite Ability Range",
"Item Aura", "Item Aura Blacklist",
},
Visuals = {
"ESP Items", "Item ESP Blacklist", "ESP Twisteds", "ESP Generators", "ESP Players",
"Sprout Tendril ESP", "Blot Hands ESP", "Ichor Puddles ESP",
"ESP Text Size", "Remove ESP Nametags", "Remove ESP Nametag Blacklist",
"Full Bright", "Alt Full Bright", "Day Time", "No Fog", "Noclip Cam",
"FOV Changer", "FOV Value", "Anti Vee Pop-ups",
},
Automations = {
"Autofarm", "Autofarm Machine Priority", "Dodge normal twisteds distance", "Dodge dangerous twisteds distance", "Pick Up Items On Autofarm", "Force Autofarm Get Items", "Autofarm Pick Up Blacklist", "Max Heals Limit", "Auto Buy Dandy Shop", "Auto Buy Dandy Shop Blacklist", "Auto Barnaby", "Auto Swimmy Barnaby On Lobby", "Auto Calibration", "Auto Squirm Escape", "Auto Use Vee Remote", "Auto Use Ability", "Auto Hide Connie",
"Auto Use Items", "Auto Use Heal Items", "Auto Use Extraction Items", "Auto Use Stamina Items", "Auto TP Elevator", "Auto TP Elevator Conditions",
"Auto Pick Up Capsules", "Auto Pick Up Heals", "Auto Pick Up Extraction Items",
"Auto Pick Up Tapes", "Auto Pick Up Event Currency", "Auto Pick Up StarPillows",
},
Teleport = {
"TP To Generator", "TP Above Gen", "TP To Elevator", "TP Generator Button", "TP Above Gen Button",
"TP Elevator Button", "Skip Machines With Twisted Near", "Twisted Distance",
},
}
ComponentBuilder.order = ORDER
end
-- Star Pillow scanner (ESP Items)
do
S.pillows = {}
local started = false
local function pillowScan(v)
local cn = v.ClassName
if not haz.cls[cn] or cn == "Decal" or cn == "Texture" then return end
local low = v.Name:lower()
if not low:find("pillow", 1, true) then return end
local key = low:gsub("[^%a]", "")
if not key:find("starpillow", 1, true) then return end
local p = v.Parent
if p and (p:IsA("BasePart") or p:IsA("Model")) and p.Name:lower():gsub("[^%a]", ""):find("starpillow", 1, true) then return end
if inPlayer(v) then return end
S.pillows[v] = true
end
S.startPillows = function()
if started then return end
started = true
for _, v in ipairs(workspace:GetDescendants()) do pillowScan(v) end
workspace.DescendantAdded:Connect(pillowScan)
end
end
do
local LIST = {
{"Riddance", [[loadstring(game:HttpGet("https://raw.githubusercontent.com/riddance-club/script/refs/heads/main/loader.lua"))()]]},
{"Looey's Circus gui", [[loadstring(game:HttpGet("https://raw.githubusercontent.com/SlasamBr/Looeyayles/refs/heads/main/Deltarune%20script%20trust"))()]]},
{"Yatta's crazy gui", [[loadstring(game:HttpGet("https://raw.githubusercontent.com/BluuGuy-Sure/BluuHead-Dandy-s-World/refs/heads/main/JustThisOnce.lua"))()]]},
{"Boxten sex gui", [[loadstring(game:HttpGet("https://raw.githubusercontent.com/Team-Noxious/Roblox/refs/heads/main/Loader.lua"))({load = "Boxten Sex GUI"})]]},
}
for _, e in ipairs(LIST) do
local name, code = e[1], e[2]
ComponentBuilder:CreateButton("Scripts", {
Name = name,
Callback = function()
local copy = setclipboard or toclipboard or (syn and syn.write_clipboard) or (Clipboard and Clipboard.set)
local ok = copy and pcall(copy, code)
pcall(function()
WindUI:Notify({
Title = name,
Content = ok and "Loadstring copied!" or "Could not copy (executor has no clipboard function)",
Icon = ok and "check" or "x",
Duration = 4,
})
end)
end,
})
end
end
ComponentBuilder:Build()
pcall(function() Window:SelectTab(1) end)
pcall(function()
WindUI:Notify({Title = "Tisha's Cleaner GUI", Content = "Tisha's Cleaner GUI loaded", Icon = "check", Duration = 6})
end)
