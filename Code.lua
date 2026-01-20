-- CLIENT SECURITY SCANNER v0.8.0
-- Client Security Risk Scanner (Honest Assessment)
-- NO false claims - architectural risk analysis only

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")

-- Ждём загрузки игрока
local player = Players.LocalPlayer
while not player do
    task.wait()
    player = Players.LocalPlayer
end

-- Родительский контейнер
local parent = player:WaitForChild("PlayerGui")

-- Очистка старого GUI
pcall(function()
    local old = parent:FindFirstChild("CodexSecurityScannerV8")
    if old then old:Destroy() end
end)

-- Создание GUI
local gui = Instance.new("ScreenGui")
gui.Name = "CodexSecurityScannerV8"
gui.ResetOnSpawn = false
gui.ZIndexBehavior = Enum.ZIndexBehavior.Global
gui.DisplayOrder = 999
gui.Parent = parent

-- Основной фрейм
local frame = Instance.new("Frame")
frame.Size = UDim2.fromScale(0.96, 0.9)
frame.Position = UDim2.fromScale(0.5, 0.5)
frame.AnchorPoint = Vector2.new(0.5, 0.5)
frame.BackgroundColor3 = Color3.fromRGB(12, 12, 18)
frame.BorderSizePixel = 0
frame.Visible = true
frame.Active = true
frame.Parent = gui

-- Масштаб для мобильных
local uiScale = Instance.new("UIScale")
uiScale.Scale = 0.85
uiScale.Parent = frame

if UserInputService.TouchEnabled then
    uiScale.Scale = 0.75
end

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 16)
corner.Parent = frame

-- Заголовок
local titleBar = Instance.new("Frame")
titleBar.Size = UDim2.new(1, 0, 0, 42)
titleBar.BackgroundColor3 = Color3.fromRGB(25, 30, 40)
titleBar.BorderSizePixel = 0
titleBar.Parent = frame

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -90, 1, 0)
title.Position = UDim2.new(0, 14, 0, 0)
title.Text = "Client Security Scanner v8.0"
title.BackgroundTransparency = 1
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Font = Enum.Font.GothamBold
title.TextSize = 18
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = titleBar

local riskBadge = Instance.new("TextLabel")
riskBadge.Size = UDim2.new(0, 80, 0, 24)
riskBadge.Position = UDim2.new(1, -84, 0.5, 0)
riskBadge.AnchorPoint = Vector2.new(0, 0.5)
riskBadge.Text = "N/A"
riskBadge.BackgroundColor3 = Color3.fromRGB(80, 90, 120)
riskBadge.TextColor3 = Color3.fromRGB(255, 255, 255)
riskBadge.Font = Enum.Font.GothamBold
riskBadge.TextSize = 12
riskBadge.Parent = titleBar

local badgeCorner = Instance.new("UICorner")
badgeCorner.CornerRadius = UDim.new(0, 12)
badgeCorner.Parent = riskBadge

-- Система вкладок
local tabsContainer = Instance.new("Frame")
tabsContainer.Size = UDim2.new(1, -20, 0, 38)
tabsContainer.Position = UDim2.new(0, 10, 0, 48)
tabsContainer.BackgroundTransparency = 1
tabsContainer.Parent = frame

local tabs = {
    {name = "Security", color = Color3.fromRGB(220, 80, 80)},
    {name = "Overview", color = Color3.fromRGB(70, 150, 255)},
    {name = "Remotes", color = Color3.fromRGB(120, 200, 120)},
    {name = "Scripts", color = Color3.fromRGB(200, 120, 255)},
    {name = "Info", color = Color3.fromRGB(160, 160, 190)}
}

local tabButtons = {}
local currentTab = 5  -- Начинаем с Info

-- Контейнеры вкладок
local mainContainer = Instance.new("Frame")
mainContainer.Size = UDim2.new(1, -20, 1, -140)
mainContainer.Position = UDim2.new(0, 10, 0, 94)
mainContainer.BackgroundTransparency = 1
mainContainer.ClipsDescendants = true
mainContainer.Parent = frame

local tabContents = {}

for i, tab in ipairs(tabs) do
    -- Кнопки вкладок
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0.19, -4, 1, 0)
    btn.Position = UDim2.new((i-1) * 0.19, 0, 0, 0)
    btn.Text = tab.name
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 12
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.BackgroundColor3 = i == 5 and tab.color or Color3.fromRGB(40, 45, 60)
    btn.AutoButtonColor = true
    btn.Parent = tabsContainer
    
    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 6)
    btnCorner.Parent = btn
    
    tabButtons[i] = btn
    
    -- Контент вкладок
    local tabFrame = Instance.new("Frame")
    tabFrame.Size = UDim2.new(1, 0, 1, 0)
    tabFrame.BackgroundTransparency = 1
    tabFrame.Visible = i == 5  -- Info видна
    tabFrame.Parent = mainContainer
    
    tabContents[i] = tabFrame
end

-- Вкладка 1: Security
local securityFrame = tabContents[1]
local securityScroll = Instance.new("ScrollingFrame")
securityScroll.Size = UDim2.new(1, 0, 1, 0)
securityScroll.BackgroundTransparency = 1
securityScroll.ScrollBarThickness = 4
securityScroll.ScrollBarImageColor3 = Color3.fromRGB(60, 65, 80)
securityScroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
securityScroll.Parent = securityFrame

local securityLabel = Instance.new("TextLabel")
securityLabel.Size = UDim2.new(1, -10, 0, 0)
securityLabel.Position = UDim2.new(0, 5, 0, 5)
securityLabel.BackgroundTransparency = 1
securityLabel.TextColor3 = Color3.fromRGB(220, 240, 255)
securityLabel.Font = Enum.Font.Code
securityLabel.TextSize = 12
securityLabel.TextXAlignment = Enum.TextXAlignment.Left
securityLabel.TextYAlignment = Enum.TextYAlignment.Top
securityLabel.TextWrapped = true
securityLabel.AutomaticSize = Enum.AutomaticSize.Y
securityLabel.RichText = true
securityLabel.Parent = securityScroll

-- Вкладка 2: Overview
local overviewFrame = tabContents[2]
local overviewScroll = Instance.new("ScrollingFrame")
overviewScroll.Size = UDim2.new(1, 0, 1, 0)
overviewScroll.BackgroundTransparency = 1
overviewScroll.ScrollBarThickness = 4
overviewScroll.ScrollBarImageColor3 = Color3.fromRGB(60, 65, 80)
overviewScroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
overviewScroll.Parent = overviewFrame

local overviewLabel = Instance.new("TextLabel")
overviewLabel.Size = UDim2.new(1, -10, 0, 0)
overviewLabel.Position = UDim2.new(0, 5, 0, 5)
overviewLabel.BackgroundTransparency = 1
overviewLabel.TextColor3 = Color3.fromRGB(180, 220, 255)
overviewLabel.Font = Enum.Font.Code
overviewLabel.TextSize = 12
overviewLabel.TextXAlignment = Enum.TextXAlignment.Left
overviewLabel.TextYAlignment = Enum.TextYAlignment.Top
overviewLabel.TextWrapped = true
overviewLabel.AutomaticSize = Enum.AutomaticSize.Y
overviewLabel.RichText = true
overviewLabel.Parent = overviewScroll

-- Вкладка 3: Remotes
local remotesFrame = tabContents[3]
local remotesScroll = Instance.new("ScrollingFrame")
remotesScroll.Size = UDim2.new(1, 0, 1, 0)
remotesScroll.BackgroundTransparency = 1
remotesScroll.ScrollBarThickness = 4
remotesScroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
remotesScroll.Parent = remotesFrame

local remotesLabel = Instance.new("TextLabel")
remotesLabel.Size = UDim2.new(1, -10, 0, 0)
remotesLabel.Position = UDim2.new(0, 5, 0, 5)
remotesLabel.BackgroundTransparency = 1
remotesLabel.TextColor3 = Color3.fromRGB(200, 230, 255)
remotesLabel.Font = Enum.Font.Code
remotesLabel.TextSize = 12
remotesLabel.TextXAlignment = Enum.TextXAlignment.Left
remotesLabel.TextYAlignment = Enum.TextYAlignment.Top
remotesLabel.TextWrapped = true
remotesLabel.AutomaticSize = Enum.AutomaticSize.Y
remotesLabel.RichText = true
remotesLabel.Parent = remotesScroll

-- Вкладка 4: Scripts
local scriptsFrame = tabContents[4]
local scriptsScroll = Instance.new("ScrollingFrame")
scriptsScroll.Size = UDim2.new(1, 0, 1, 0)
scriptsScroll.BackgroundTransparency = 1
scriptsScroll.ScrollBarThickness = 4
scriptsScroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
scriptsScroll.Parent = scriptsFrame

local scriptsLabel = Instance.new("TextLabel")
scriptsLabel.Size = UDim2.new(1, -10, 0, 0)
scriptsLabel.Position = UDim2.new(0, 5, 0, 5)
scriptsLabel.BackgroundTransparency = 1
scriptsLabel.TextColor3 = Color3.fromRGB(220, 240, 255)
scriptsLabel.Font = Enum.Font.Code
scriptsLabel.TextSize = 12
scriptsLabel.TextXAlignment = Enum.TextXAlignment.Left
scriptsLabel.TextYAlignment = Enum.TextYAlignment.Top
scriptsLabel.TextWrapped = true
scriptsLabel.AutomaticSize = Enum.AutomaticSize.Y
scriptsLabel.RichText = true
scriptsLabel.Parent = scriptsScroll

-- Вкладка 5: Info
local infoFrame = tabContents[5]
local infoScroll = Instance.new("ScrollingFrame")
infoScroll.Size = UDim2.new(1, 0, 1, 0)
infoScroll.BackgroundTransparency = 1
infoScroll.ScrollBarThickness = 4
infoScroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
infoScroll.Parent = infoFrame

local infoLabel = Instance.new("TextLabel")
infoLabel.Size = UDim2.new(1, -10, 0, 0)
infoLabel.Position = UDim2.new(0, 5, 0, 5)
infoLabel.BackgroundTransparency = 1
infoLabel.TextColor3 = Color3.fromRGB(220, 240, 255)
infoLabel.Font = Enum.Font.Code
infoLabel.TextSize = 12
infoLabel.TextXAlignment = Enum.TextXAlignment.Left
infoLabel.TextYAlignment = Enum.TextYAlignment.Top
infoLabel.TextWrapped = true
infoLabel.AutomaticSize = Enum.AutomaticSize.Y
infoLabel.RichText = true
infoLabel.Parent = infoScroll

-- Кнопки действий
local actionsFrame = Instance.new("Frame")
actionsFrame.Size = UDim2.new(1, -20, 0, 40)
actionsFrame.Position = UDim2.new(0, 10, 1, -44)
actionsFrame.BackgroundTransparency = 1
actionsFrame.Parent = frame

local scanBtn = Instance.new("TextButton")
scanBtn.Size = UDim2.new(0.24, -4, 1, 0)
scanBtn.Position = UDim2.new(0, 0, 0, 0)
scanBtn.Text = "Scan"
scanBtn.Font = Enum.Font.GothamBold
scanBtn.TextSize = 13
scanBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
scanBtn.BackgroundColor3 = Color3.fromRGB(220, 80, 80)
scanBtn.AutoButtonColor = true
scanBtn.Parent = actionsFrame

local copyBtn = Instance.new("TextButton")
copyBtn.Size = UDim2.new(0.24, -4, 1, 0)
copyBtn.Position = UDim2.new(0.25, 0, 0, 0)
copyBtn.Text = "Copy"
copyBtn.Font = Enum.Font.GothamBold
copyBtn.TextSize = 13
copyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
copyBtn.BackgroundColor3 = Color3.fromRGB(120, 200, 120)
copyBtn.AutoButtonColor = true
copyBtn.Parent = actionsFrame

local clearBtn = Instance.new("TextButton")
clearBtn.Size = UDim2.new(0.24, -4, 1, 0)
clearBtn.Position = UDim2.new(0.75, 0, 0, 0)
clearBtn.Text = "Clear"
clearBtn.Font = Enum.Font.GothamBold
clearBtn.TextSize = 13
clearBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
clearBtn.BackgroundColor3 = Color3.fromRGB(80, 90, 120)
clearBtn.AutoButtonColor = true
clearBtn.Parent = actionsFrame

-- Стиль кнопок
for _, btn in pairs({scanBtn, copyBtn, clearBtn}) do
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 6)
    corner.Parent = btn
end

-- ============================================================================
-- КОНСТАНТЫ И ДАННЫЕ
-- ============================================================================

-- ✅ ФИКС: Правильные пути для клиентского сканирования
local SCAN_ROOTS = {
    game.ReplicatedStorage,
    game.ReplicatedFirst,
    game.Workspace,
    player:WaitForChild("PlayerGui"),
    player:WaitForChild("PlayerScripts")
}

-- Только релевантные классы объектов
local RELEVANT_CLASSES = {
    RemoteEvent = true,
    RemoteFunction = true,
    BindableEvent = true,
    BindableFunction = true,
    LocalScript = true,
    ModuleScript = true
}

-- Подозрительные ключевые слова для модулей
local SUSPICIOUS_KEYWORDS = {
    "admin", "cash", "money", "coins", "give", "unlock", "ban", "kick",
    "god", "fly", "speed", "noclip", "invisible", "teleport", "cheat",
    "hack", "exploit", "bypass", "free", "premium", "reward", "spawn"
}

-- Общие имена Remote'ов (плохая практика)
local GENERIC_NAMES = {"event", "function", "remote", "fire", "call", "main", "update", "data"}

-- Структура данных (с поддержкой анализа рисков)
local DiagnosticData = {
    remotes = {
        remoteEvents = {count = 0, items = {}},
        remoteFunctions = {count = 0, items = {}},
        bindableEvents = {count = 0, items = {}},
        bindableFunctions = {count = 0, items = {}}
    },
    scripts = {
        localScripts = {count = 0, items = {}},
        disabledScripts = {count = 0, items = {}},
        moduleScripts = {count = 0, items = {}}
    },
    metadata = {
        gameName = game.Name,
        placeId = game.PlaceId,
        scanTime = 0,
        relevantObjectsScanned = 0,
        totalObjectsExamined = 0
    },
    -- НОВОЕ: Данные оценки риска
    security = {
        riskScore = 0,
        riskLevel = "Not Scanned",
        riskColor = Color3.fromRGB(80, 90, 120),
        findings = {},
        summary = "No scan performed"
    }
}

-- Буферы для производительности
local securityBuffer = {}
local overviewBuffer = {}
local remotesBuffer = {}
local scriptsBuffer = {}
local infoBuffer = {}

-- ============================================================================
-- ВСПОМОГАТЕЛЬНЫЕ ФУНКЦИИ
-- ============================================================================

-- Логирование в буфер
local function addToBuffer(tab, text)
    if tab == 1 then
        table.insert(securityBuffer, text)
    elseif tab == 2 then
        table.insert(overviewBuffer, text)
    elseif tab == 3 then
        table.insert(remotesBuffer, text)
    elseif tab == 4 then
        table.insert(scriptsBuffer, text)
    elseif tab == 5 then
        table.insert(infoBuffer, text)
    end
end

-- Вывод из буфера
local function flushBuffer(tab)
    local label = tab == 1 and securityLabel or 
                  tab == 2 and overviewLabel or 
                  tab == 3 and remotesLabel or 
                  tab == 4 and scriptsLabel or 
                  tab == 5 and infoLabel
    
    if not label then return end
    
    local buffer = tab == 1 and securityBuffer or
                   tab == 2 and overviewBuffer or
                   tab == 3 and remotesBuffer or
                   tab == 4 and scriptsBuffer or
                   tab == 5 and infoBuffer
    
    -- Ограничение строк
    if #buffer > 50 then
        for i = 1, #buffer - 50 do
            table.remove(buffer, 1)
        end
    end
    
    label.Text = table.concat(buffer, "\n")
end

-- Единая функция логирования
local function logToTab(tab, text)
    addToBuffer(tab, text)
    flushBuffer(tab)
end

-- Классификация Remote'ов
local function classifyRemote(remote)
    if remote:IsDescendantOf(game.ReplicatedStorage) then
        return "ReplicatedStorage"
    elseif remote:IsDescendantOf(game.Workspace) then
        return "Workspace"
    elseif remote:IsDescendantOf(game.ReplicatedFirst) then
        return "ReplicatedFirst"
    elseif remote:IsDescendantOf(player.PlayerGui) then
        return "PlayerGui"
    elseif remote:IsDescendantOf(player.PlayerScripts) then
        return "PlayerScripts"
    else
        return "Other"
    end
end

-- ============================================================================
-- ФУНКЦИЯ ПЕРЕКЛЮЧЕНИЯ ВКЛАДОК (ФИКС: ПЕРЕД ВЫЗОВОМ)
-- ============================================================================

local function switchTab(tabIndex)
    if currentTab == tabIndex then return end
    
    tabButtons[currentTab].BackgroundColor3 = Color3.fromRGB(40, 45, 60)
    tabContents[currentTab].Visible = false
    
    tabButtons[tabIndex].BackgroundColor3 = tabs[tabIndex].color
    tabContents[tabIndex].Visible = true
    currentTab = tabIndex
    
    -- Автоматически показываем соответствующий контент
    if tabIndex == 1 then
        showSecurity()
    elseif tabIndex == 2 then
        showOverview()
    elseif tabIndex == 3 then
        showRemotes()
    elseif tabIndex == 4 then
        showScripts()
    elseif tabIndex == 5 then
        showInfo()
    end
end

-- ============================================================================
-- ФУНКЦИИ АНАЛИЗА РИСКОВ
-- ============================================================================

-- Расчет риска безопасности
local function calculateSecurityRisk()
    local risk = 0
    local findings = {}
    
    -- Фактор 1: Remote'ы в Workspace (высокий риск)
    local workspaceRemotes = 0
    for _, remote in ipairs(DiagnosticData.remotes.remoteEvents.items) do
        if remote.location == "Workspace" then
            workspaceRemotes = workspaceRemotes + 1
        end
    end
    for _, remote in ipairs(DiagnosticData.remotes.remoteFunctions.items) do
        if remote.location == "Workspace" then
            workspaceRemotes = workspaceRemotes + 1
        end
    end
    
    if workspaceRemotes > 0 then
        local points = math.min(workspaceRemotes * 3, 25)
        risk = risk + points
        table.insert(findings, {
            text = string.format("Remotes in Workspace (%d)", workspaceRemotes),
            risk = points,
            description = "Remote objects in Workspace are easily accessible and indicate poor architecture."
        })
    end
    
    -- Фактор 2: Remote'ы в PlayerGui (критический риск)
    local playerGuiRemotes = 0
    for _, remote in ipairs(DiagnosticData.remotes.remoteEvents.items) do
        if remote.location == "PlayerGui" then
            playerGuiRemotes = playerGuiRemotes + 1
        end
    end
    
    if playerGuiRemotes > 0 then
        local points = math.min(playerGuiRemotes * 8, 40)
        risk = risk + points
        table.insert(findings, {
            text = string.format("Remotes in PlayerGui (%d)", playerGuiRemotes),
            risk = points,
            description = "Remote objects in PlayerGui are client-specific and often indicate serious security issues."
        })
    end
    
    -- Фактор 3: Слишком много RemoteEvent'ов
    if DiagnosticData.remotes.remoteEvents.count > 30 then
        local points = math.min((DiagnosticData.remotes.remoteEvents.count - 30) * 0.5, 15)
        risk = risk + points
        table.insert(findings, {
            text = string.format("High number of RemoteEvents (%d)", DiagnosticData.remotes.remoteEvents.count),
            risk = points,
            description = "Large number of RemoteEvents increases attack surface area."
        })
    end
    
    -- Фактор 4: RemoteFunctions > RemoteEvents
    if DiagnosticData.remotes.remoteFunctions.count > DiagnosticData.remotes.remoteEvents.count then
        risk = risk + 12
        table.insert(findings, {
            text = "More RemoteFunctions than RemoteEvents",
            risk = 12,
            description = "RemoteFunctions are more complex to secure and validate properly."
        })
    end
    
    -- Фактор 5: Disabled LocalScripts
    if DiagnosticData.scripts.disabledScripts.count > 0 then
        local points = math.min(DiagnosticData.scripts.disabledScripts.count * 2, 10)
        risk = risk + points
        table.insert(findings, {
            text = string.format("Disabled LocalScripts (%d)", DiagnosticData.scripts.disabledScripts.count),
            risk = points,
            description = "Disabled scripts may contain debugging code or unused functionality."
        })
    end
    
    -- Фактор 6: Подозрительные имена модулей
    local suspiciousModules = {}
    for _, module in ipairs(DiagnosticData.scripts.moduleScripts.items) do
        local nameLower = string.lower(module.name)
        for _, keyword in ipairs(SUSPICIOUS_KEYWORDS) do
            if string.find(nameLower, keyword) then
                table.insert(suspiciousModules, module.name)
                break
            end
        end
    end
    
    if #suspiciousModules > 0 then
        local points = math.min(#suspiciousModules * 3, 18)
        risk = risk + points
        table.insert(findings, {
            text = string.format("Suspicious module names (%d)", #suspiciousModules),
            risk = points,
            description = "ModuleScripts with names suggesting admin/gameplay functionality."
        })
    end
    
    -- Фактор 7: Remote'ы с общими именами
    local genericRemoteNames = 0
    for _, remote in ipairs(DiagnosticData.remotes.remoteEvents.items) do
        local nameLower = string.lower(remote.name)
        for _, pattern in ipairs(GENERIC_NAMES) do
            if nameLower == pattern then
                genericRemoteNames = genericRemoteNames + 1
                break
            end
        end
    end
    
    if genericRemoteNames > 0 then
        local points = math.min(genericRemoteNames * 1.5, 8)
        risk = risk + points
        table.insert(findings, {
            text = string.format("Generic remote names (%d)", genericRemoteNames),
            risk = points,
            description = "Generic remote names indicate lack of proper architecture."
        })
    end
    
    -- Фактор 8: Bindable'ы в клиентских локациях (низкий риск)
    local clientBindables = DiagnosticData.remotes.bindableEvents.count + DiagnosticData.remotes.bindableFunctions.count
    if clientBindables > 20 then
        local points = math.min((clientBindables - 20) * 0.2, 5)
        risk = risk + points
        table.insert(findings, {
            text = string.format("Many client Bindables (%d)", clientBindables),
            risk = points,
            description = "Excessive client Bindables may indicate complex client-side logic."
        })
    end
    
    -- Ограничиваем и определяем уровень
    risk = math.clamp(risk, 0, 100)
    
    local riskLevel, riskColor
    if risk >= 71 then
        riskLevel = "CRITICAL"
        riskColor = Color3.fromRGB(220, 60, 60)  -- красный
    elseif risk >= 41 then
        riskLevel = "HIGH"
        riskColor = Color3.fromRGB(255, 150, 50)  -- оранжевый
    elseif risk >= 21 then
        riskLevel = "MEDIUM"
        riskColor = Color3.fromRGB(255, 200, 50)  -- желтый
    elseif risk >= 1 then
        riskLevel = "LOW"
        riskColor = Color3.fromRGB(40, 180, 40)   -- зеленый
    else
        riskLevel = "SAFE"
        riskColor = Color3.fromRGB(40, 120, 180)  -- синий
    end
    
    -- Сортируем находки
    table.sort(findings, function(a, b)
        return a.risk > b.risk
    end)
    
    -- Сохраняем результаты
    DiagnosticData.security.riskScore = risk
    DiagnosticData.security.riskLevel = riskLevel
    DiagnosticData.security.riskColor = riskColor
    DiagnosticData.security.findings = findings
    
    -- Генерируем summary
    if #findings > 0 then
        local summary = string.format("Risk Score: %d/100\n", risk)
        summary = summary .. string.format("Risk Level: %s\n", riskLevel)
        summary = summary .. string.format("Findings: %d potential issue(s)", #findings)
        DiagnosticData.security.summary = summary
    else
        DiagnosticData.security.summary = "No significant risks detected"
    end
end

-- ============================================================================
-- ФУНКЦИИ ОТОБРАЖЕНИЯ
-- ============================================================================

local function showSecurity()
    securityBuffer = {}
    
    logToTab(1, "<font color='#FFD700'>=== SECURITY RISK ASSESSMENT ===</font>")
    logToTab(1, "")
    
    if DiagnosticData.metadata.scanTime == 0 then
        logToTab(1, "No scan data available.")
        logToTab(1, "Click 'Scan' to analyze security risks.")
        return
    end
    
    -- Показываем уровень риска
    local riskColor = string.format("#%02X%02X%02X", 
        math.floor(DiagnosticData.security.riskColor.R * 255),
        math.floor(DiagnosticData.security.riskColor.G * 255),
        math.floor(DiagnosticData.security.riskColor.B * 255))
    
    logToTab(1, string.format("Overall Risk: <font color='%s'><b>%s (%d/100)</b></font>", 
        riskColor, DiagnosticData.security.riskLevel, DiagnosticData.security.riskScore))
    logToTab(1, "")
    
    -- Показываем основные находки
    if #DiagnosticData.security.findings > 0 then
        logToTab(1, "<font color='#FFA500'>POTENTIAL RISK FACTORS:</font>")
        
        for i, finding in ipairs(DiagnosticData.security.findings) do
            if i <= 8 then  -- Ограничиваем количество
                local color = "#FF6666"
                if finding.risk <= 5 then color = "#FFA500"
                elseif finding.risk <= 10 then color = "#FFCC00"
                else color = "#FF6666" end
                
                logToTab(1, string.format("• <font color='%s'>[+%d]</font> %s", 
                    color, finding.risk, finding.text))
            end
        end
        
        if #DiagnosticData.security.findings > 8 then
            logToTab(1, string.format("... and %d more", #DiagnosticData.security.findings - 8))
        end
        
        logToTab(1, "")
    end
    
    -- Важные предупреждения
    logToTab(1, "<font color='#4ECDC4'>IMPORTANT NOTES:</font>")
    logToTab(1, "• This is a CLIENT-SIDE assessment only")
    logToTab(1, "• Does NOT confirm actual vulnerabilities")
    logToTab(1, "• Server validation cannot be analyzed")
    logToTab(1, "• High risk = potential architectural issues")
    logToTab(1, "")
    
    -- Рекомендации
    if DiagnosticData.security.riskScore >= 41 then
        logToTab(1, "<font color='#FF6666'>RECOMMENDATION:</font>")
        logToTab(1, "Game shows patterns associated with security risks.")
        logToTab(1, "Consider reviewing server-side validation.")
    elseif DiagnosticData.security.riskScore >= 21 then
        logToTab(1, "<font color='#FFA500'>RECOMMENDATION:</font>")
        logToTab(1, "Moderate risk detected. Monitor for issues.")
    else
        logToTab(1, "<font color='#90EE90'>RECOMMENDATION:</font>")
        logToTab(1, "Low risk profile detected.")
    end
end

local function showOverview()
    overviewBuffer = {}
    
    logToTab(2, "<font color='#FFD700'>=== SCAN RESULTS ===</font>")
    
    if DiagnosticData.metadata.scanTime > 0 then
        logToTab(2, string.format("Scan completed in <b>%.2fs</b>", DiagnosticData.metadata.scanTime))
        logToTab(2, string.format("Relevant objects found: <b>%d</b>", DiagnosticData.metadata.relevantObjectsScanned))
        logToTab(2, string.format("Total objects examined: <b>%d</b>", DiagnosticData.metadata.totalObjectsExamined))
        logToTab(2, "")
        
        -- Показываем риск
        logToTab(2, string.format("Security Risk: <b>%s (%d/100)</b>", 
            DiagnosticData.security.riskLevel, DiagnosticData.security.riskScore))
        logToTab(2, "")
        
        logToTab(2, "Remote Events: " .. DiagnosticData.remotes.remoteEvents.count)
        logToTab(2, "Remote Functions: " .. DiagnosticData.remotes.remoteFunctions.count)
        logToTab(2, "Bindable Events: " .. DiagnosticData.remotes.bindableEvents.count)
        logToTab(2, "Bindable Functions: " .. DiagnosticData.remotes.bindableFunctions.count)
        logToTab(2, "")
        
        logToTab(2, "Local Scripts: " .. DiagnosticData.scripts.localScripts.count)
        if DiagnosticData.scripts.disabledScripts.count > 0 then
            logToTab(2, "  • Disabled: " .. DiagnosticData.scripts.disabledScripts.count)
        end
        logToTab(2, "Module Scripts: " .. DiagnosticData.scripts.moduleScripts.count)
        
        -- Анализ локаций
        local locationCount = {}
        for _, remote in ipairs(DiagnosticData.remotes.remoteEvents.items) do
            locationCount[remote.location] = (locationCount[remote.location] or 0) + 1
        end
        for _, remote in ipairs(DiagnosticData.remotes.remoteFunctions.items) do
            locationCount[remote.location] = (locationCount[remote.location] or 0) + 1
        end
        
        if next(locationCount) then
            logToTab(2, "")
            logToTab(2, "Remote Locations:")
            for location, count in pairs(locationCount) do
                logToTab(2, "  • " .. location .. ": " .. count)
            end
        end
    else
        logToTab(2, "No scan data available.")
        logToTab(2, "Click 'Scan' to analyze the game.")
    end
end

local function showRemotes()
    remotesBuffer = {}
    logToTab(3, "<font color='#FFD700'>=== REMOTE OBJECTS ===</font>")
    
    if DiagnosticData.metadata.scanTime == 0 then
        logToTab(3, "No scan data available.")
        return
    end
    
    -- Highlight risky remotes
    local riskyLocations = {"Workspace", "PlayerGui"}
    
    if DiagnosticData.remotes.remoteEvents.count > 0 then
        logToTab(3, string.format("\nRemote Events (%d):", DiagnosticData.remotes.remoteEvents.count))
        
        local riskyShown = 0
        local normalShown = 0
        
        for i, remote in ipairs(DiagnosticData.remotes.remoteEvents.items) do
            local isRisky = false
            for _, loc in ipairs(riskyLocations) do
                if remote.location == loc then
                    isRisky = true
                    break
                end
            end
            
            if isRisky and riskyShown < 10 then
                logToTab(3, "• " .. remote.name .. " <font color='#FFA500'>(" .. remote.location .. ")</font>")
                riskyShown = riskyShown + 1
            elseif not isRisky and normalShown < 5 then
                logToTab(3, "• " .. remote.name .. " (" .. remote.location .. ")")
                normalShown = normalShown + 1
            end
        end
        
        local remaining = DiagnosticData.remotes.remoteEvents.count - riskyShown - normalShown
        if remaining > 0 then
            logToTab(3, string.format("... and %d more", remaining))
        end
    else
        logToTab(3, "No Remote Events found")
    end
    
    if DiagnosticData.remotes.remoteFunctions.count > 0 then
        logToTab(3, string.format("\nRemote Functions (%d):", DiagnosticData.remotes.remoteFunctions.count))
        for i, remote in ipairs(DiagnosticData.remotes.remoteFunctions.items) do
            if i <= 10 then
                logToTab(3, "• " .. remote.name .. " (" .. remote.location .. ")")
            end
        end
        if DiagnosticData.remotes.remoteFunctions.count > 10 then
            logToTab(3, string.format("... and %d more", DiagnosticData.remotes.remoteFunctions.count - 10))
        end
    else
        logToTab(3, "No Remote Functions found")
    end
end

local function showScripts()
    scriptsBuffer = {}
    logToTab(4, "<font color='#FFD700'>=== SCRIPTS ANALYSIS ===</font>")
    
    if DiagnosticData.metadata.scanTime == 0 then
        logToTab(4, "No scan data available.")
        return
    end
    
    if DiagnosticData.scripts.localScripts.count > 0 then
        logToTab(4, string.format("\nLocal Scripts (%d):", DiagnosticData.scripts.localScripts.count))
        
        -- Показываем отключенные скрипты
        if DiagnosticData.scripts.disabledScripts.count > 0 then
            logToTab(4, "<font color='#FFA500'>Disabled scripts:</font>")
            for i, script in ipairs(DiagnosticData.scripts.disabledScripts.items) do
                if i <= 5 then
                    logToTab(4, "• " .. script.name)
                end
            end
            if DiagnosticData.scripts.disabledScripts.count > 5 then
                logToTab(4, string.format("... and %d more", DiagnosticData.scripts.disabledScripts.count - 5))
            end
            logToTab(4, "")
        end
        
        local enabledCount = DiagnosticData.scripts.localScripts.count - DiagnosticData.scripts.disabledScripts.count
        logToTab(4, string.format("Enabled LocalScripts: %d", enabledCount))
    else
        logToTab(4, "No LocalScripts found")
    end
    
    -- Подозрительные модули
    if DiagnosticData.scripts.moduleScripts.count > 0 then
        logToTab(4, string.format("\nModule Scripts (%d):", DiagnosticData.scripts.moduleScripts.count))
        
        local suspiciousCount = 0
        for _, module in ipairs(DiagnosticData.scripts.moduleScripts.items) do
            local nameLower = string.lower(module.name)
            for _, keyword in ipairs(SUSPICIOUS_KEYWORDS) do
                if string.find(nameLower, keyword) then
                    suspiciousCount = suspiciousCount + 1
                    if suspiciousCount <= 3 then
                        logToTab(4, "• " .. module.name .. " <font color='#FFA500'>[suspicious name]</font>")
                    end
                    break
                end
            end
        end
        
        if suspiciousCount > 0 then
            logToTab(4, string.format("<font color='#FFA500'>Found %d modules with suspicious names</font>", suspiciousCount))
        end
    end
end

local function showInfo()
    infoBuffer = {}
    logToTab(5, "<font color='#FFD700'>=== CLIENT SECURITY SCANNER v8.0 ===</font>")
    logToTab(5, "")
    
    logToTab(5, "<font color='#4ECDC4'>Purpose:</font>")
    logToTab(5, "Honest assessment of client-side security risks")
    logToTab(5, "Architectural analysis - NOT exploit detection")
    logToTab(5, "No false claims about vulnerabilities")
    logToTab(5, "")
    
    logToTab(5, "<font color='#4ECDC4'>Risk Assessment Model:</font>")
    logToTab(5, "• 0-20: SAFE (Good architecture)")
    logToTab(5, "• 21-40: LOW (Minor issues)")
    logToTab(5, "• 41-70: MEDIUM (Concerns present)")
    logToTab(5, "• 71-100: HIGH (Serious concerns)")
    logToTab(5, "")
    
    logToTab(5, "<font color='#4ECDC4'>Risk Factors Analyzed:</font>")
    logToTab(5, "• Remotes in Workspace/PlayerGui")
    logToTab(5, "• Excessive Remote counts")
    logToTab(5, "• Disabled LocalScripts")
    logToTab(5, "• Suspicious module names")
    logToTab(5, "• Generic remote names")
    logToTab(5, "")
    
    logToTab(5, "<font color='#FFA500'>Important Limitations:</font>")
    logToTab(5, "• Cannot see server code")
    logToTab(5, "• Cannot verify server validation")
    logToTab(5, "• High risk ≠ exploitable")
    logToTab(5, "• Architecture risk ≠ vulnerability")
    logToTab(5, "")
    
    logToTab(5, "<font color='#90EE90'>Click 'Scan' to begin analysis</font>")
end

-- ============================================================================
-- ОСНОВНЫЕ ФУНКЦИИ
-- ============================================================================

-- Сброс данных
local function resetDiagnosticData()
    for _, category in pairs({"remotes", "scripts"}) do
        for _, subcategory in pairs(DiagnosticData[category]) do
            subcategory.count = 0
            subcategory.items = {}
        end
    end
    
    DiagnosticData.metadata.scanTime = 0
    DiagnosticData.metadata.relevantObjectsScanned = 0
    DiagnosticData.metadata.totalObjectsExamined = 0
    
    DiagnosticData.security = {
        riskScore = 0,
        riskLevel = "Not Scanned",
        riskColor = Color3.fromRGB(80, 90, 120),
        findings = {},
        summary = "No scan performed"
    }
end

-- Подсчёт объектов
local function countAllObjects()
    local total = 0
    for _, root in ipairs(SCAN_ROOTS) do
        if root then
            local success, count = pcall(function()
                return #root:GetDescendants()
            end)
            if success then
                total = total + count
            end
        end
    end
    return total
end

-- Сбор объектов (с защитой от фризов)
local function collectRelevantObjectsAsync()
    local collected = {}
    local totalExamined = 0
    local relevantCount = 0
    
    for _, root in ipairs(SCAN_ROOTS) do
        if not root then continue end
        
        local success, descendants = pcall(function()
            return root:GetDescendants()
        end)
        
        if not success then continue end
        
        -- Обработка батчами для избежания фриза
        local batchSize = 50
        for batchStart = 1, #descendants, batchSize do
            local batchEnd = math.min(batchStart + batchSize - 1, #descendants)
            
            for i = batchStart, batchEnd do
                local obj = descendants[i]
                totalExamined = totalExamined + 1
                
                if RELEVANT_CLASSES[obj.ClassName] then
                    table.insert(collected, obj)
                    relevantCount = relevantCount + 1
                end
            end
            
            -- Маленькая пауза между батчами
            if batchEnd % 200 == 0 then
                task.wait(0.01)
            end
        end
        
        task.wait(0.05)
    end
    
    return collected, totalExamined, relevantCount
end

-- Основной анализ
local isScanning = false

local function performAnalysis()
    if isScanning then 
        logToTab(currentTab, "Scan already in progress...")
        return
    end
    
    isScanning = true
    resetDiagnosticData()
    
    local startTime = os.clock()
    
    -- Обновляем UI
    riskBadge.Text = "Scanning"
    riskBadge.BackgroundColor3 = Color3.fromRGB(255, 150, 50)
    scanBtn.Text = "Scanning..."
    scanBtn.AutoButtonColor = false
    scanBtn.BackgroundColor3 = Color3.fromRGB(255, 150, 50)
    
    -- Очищаем буферы
    securityBuffer = {}
    overviewBuffer = {}
    remotesBuffer = {}
    scriptsBuffer = {}
    
    logToTab(1, "<font color='#FFD700'>=== SECURITY SCAN STARTED ===</font>")
    logToTab(1, "Game: " .. game.Name)
    logToTab(1, "Place ID: " .. game.PlaceId)
    logToTab(1, "Scan started at " .. os.date("%H:%M:%S"))
    logToTab(1, "Analyzing client architecture...")
    
    -- Собираем объекты
    local relevantObjects, totalExamined, relevantCount = collectRelevantObjectsAsync()
    DiagnosticData.metadata.relevantObjectsScanned = relevantCount
    DiagnosticData.metadata.totalObjectsExamined = totalExamined
    
    -- Анализируем объекты
    for _, obj in ipairs(relevantObjects) do
        local className = obj.ClassName
        
        if className == "RemoteEvent" then
            DiagnosticData.remotes.remoteEvents.count = DiagnosticData.remotes.remoteEvents.count + 1
            table.insert(DiagnosticData.remotes.remoteEvents.items, {
                name = obj.Name,
                path = obj:GetFullName(),
                location = classifyRemote(obj)
            })
        
        elseif className == "RemoteFunction" then
            DiagnosticData.remotes.remoteFunctions.count = DiagnosticData.remotes.remoteFunctions.count + 1
            table.insert(DiagnosticData.remotes.remoteFunctions.items, {
                name = obj.Name,
                path = obj:GetFullName(),
                location = classifyRemote(obj)
            })
        
        elseif className == "BindableEvent" then
            DiagnosticData.remotes.bindableEvents.count = DiagnosticData.remotes.bindableEvents.count + 1
            table.insert(DiagnosticData.remotes.bindableEvents.items, {
                name = obj.Name,
                path = obj:GetFullName(),
                location = classifyRemote(obj)
            })
        
        elseif className == "BindableFunction" then
            DiagnosticData.remotes.bindableFunctions.count = DiagnosticData.remotes.bindableFunctions.count + 1
            table.insert(DiagnosticData.remotes.bindableFunctions.items, {
                name = obj.Name,
                path = obj:GetFullName(),
                location = classifyRemote(obj)
            })
        
        elseif className == "LocalScript" then
            DiagnosticData.scripts.localScripts.count = DiagnosticData.scripts.localScripts.count + 1
            local scriptData = {
                name = obj.Name,
                path = obj:GetFullName(),
                enabled = obj.Enabled
            }
            table.insert(DiagnosticData.scripts.localScripts.items, scriptData)
            
            if not obj.Enabled then
                DiagnosticData.scripts.disabledScripts.count = DiagnosticData.scripts.disabledScripts.count + 1
                table.insert(DiagnosticData.scripts.disabledScripts.items, scriptData)
            end
        
        elseif className == "ModuleScript" then
            DiagnosticData.scripts.moduleScripts.count = DiagnosticData.scripts.moduleScripts.count + 1
            table.insert(DiagnosticData.scripts.moduleScripts.items, {
                name = obj.Name,
                path = obj:GetFullName()
            })
        end
    end
    
    DiagnosticData.metadata.scanTime = os.clock() - startTime
    
    -- Рассчитываем риск
    calculateSecurityRisk()
    
    -- Обновляем UI
    riskBadge.Text = DiagnosticData.security.riskLevel
    riskBadge.BackgroundColor3 = DiagnosticData.security.riskColor
    
    scanBtn.Text = "Scan"
    scanBtn.AutoButtonColor = true
    scanBtn.BackgroundColor3 = Color3.fromRGB(220, 80, 80)
    
    -- Показываем результаты
    showSecurity()
    showOverview()
    showRemotes()
    showScripts()
    
    -- ✅ ФИКС: Теперь switchTab определена выше, можно вызывать
    switchTab(1)  -- Автоматически переключаем на вкладку Security
    
    isScanning = false
    
    -- Финальное сообщение
    logToTab(1, "")
    logToTab(1, string.format("<font color='#90EE90'>Scan completed in %.2fs</font>", DiagnosticData.metadata.scanTime))
    logToTab(1, "Switch to other tabs for detailed analysis.")
end

-- Копирование отчета
local function copySecurityReport()
    if typeof(setclipboard) ~= "function" then
        logToTab(currentTab, "Clipboard not supported in this environment.")
        return
    end
    
    if DiagnosticData.metadata.scanTime == 0 then
        logToTab(currentTab, "No data to copy. Run scan first.")
        return
    end
    
    local report = "=== CLIENT SECURITY RISK REPORT ===\n"
    report = report .. "Game: " .. DiagnosticData.metadata.gameName .. "\n"
    report = report .. "Place ID: " .. DiagnosticData.metadata.placeId .. "\n"
    report = report .. "Scan Time: " .. string.format("%.2f", DiagnosticData.metadata.scanTime) .. "s\n"
    report = report .. "\n"
    report = report .. "SECURITY ASSESSMENT:\n"
    report = report .. "Risk Score: " .. DiagnosticData.security.riskScore .. "/100\n"
    report = report .. "Risk Level: " .. DiagnosticData.security.riskLevel .. "\n"
    report = report .. "\n"
    
    if #DiagnosticData.security.findings > 0 then
        report = report .. "RISK FACTORS DETECTED:\n"
        for _, finding in ipairs(DiagnosticData.security.findings) do
            report = report .. string.format("[+%d] %s\n", finding.risk, finding.text)
        end
        report = report .. "\n"
    end
    
    report = report .. "OBJECT COUNTS:\n"
    report = report .. "Remote Events: " .. DiagnosticData.remotes.remoteEvents.count .. "\n"
    report = report .. "Remote Functions: " .. DiagnosticData.remotes.remoteFunctions.count .. "\n"
    report = report .. "Local Scripts: " .. DiagnosticData.scripts.localScripts.count .. "\n"
    report = report .. "  • Disabled: " .. DiagnosticData.scripts.disabledScripts.count .. "\n"
    report = report .. "Module Scripts: " .. DiagnosticData.scripts.moduleScripts.count .. "\n"
    report = report .. "\n"
    report = report .. "IMPORTANT NOTES:\n"
    report = report .. "• Client-side analysis only\n"
    report = report .. "• Does NOT confirm vulnerabilities\n"
    report = report .. "• Server validation unknown\n"
    report = report .. "• High risk = architectural concerns\n"
    
    local success, err = pcall(function()
        setclipboard(report)
    end)
    
    if success then
        logToTab(currentTab, "Security report copied to clipboard!")
    else
        logToTab(currentTab, "Failed to copy: " .. tostring(err))
    end
end

-- ============================================================================
-- ОБРАБОТЧИКИ СОБЫТИЙ
-- ============================================================================

-- ✅ ФИКС: Убрана лишняя закрывающая скобка
scanBtn.MouseButton1Click:Connect(function()
    if isScanning then 
        logToTab(currentTab, "Scan already in progress...")
        return
    end
    
    task.spawn(function()
        performAnalysis()
    end)
end)

-- Кнопка Copy
copyBtn.MouseButton1Click:Connect(function()
    if DiagnosticData.metadata.scanTime > 0 then
        copySecurityReport()
    else
        logToTab(currentTab, "No scan data available.")
    end
end)

-- Кнопка Clear
clearBtn.MouseButton1Click:Connect(function()
    if currentTab == 1 then
        securityBuffer = {}
        securityLabel.Text = ""
    elseif currentTab == 2 then
        overviewBuffer = {}
        overviewLabel.Text = ""
    elseif currentTab == 3 then
        remotesBuffer = {}
        remotesLabel.Text = ""
    elseif currentTab == 4 then
        scriptsBuffer = {}
        scriptsLabel.Text = ""
    elseif currentTab == 5 then
        infoBuffer = {}
        infoLabel.Text = ""
    end
end)

-- Перетаскивание
titleBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or 
       input.UserInputType == Enum.UserInputType.Touch then
        local dragging = true
        local dragStart = input.Position
        local startPos = frame.Position
        
        local connection
        connection = input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
                connection:Disconnect()
            end
        end)
        
        local moveConnection
        moveConnection = UserInputService.InputChanged:Connect(function(moveInput)
            if dragging and (moveInput.UserInputType == Enum.UserInputType.MouseMovement or 
                             moveInput.UserInputType == Enum.UserInputType.Touch) then
                local delta = moveInput.Position - dragStart
                frame.Position = UDim2.new(
                    startPos.X.Scale,
                    startPos.X.Offset + delta.X,
                    startPos.Y.Scale,
                    startPos.Y.Offset + delta.Y
                )
            end
        end)
    end
end)

-- Назначение обработчиков вкладок
for i, btn in ipairs(tabButtons) do
    btn.MouseButton1Click:Connect(function()
        switchTab(i)
    end)
end

-- Адаптивность для мобильных
if UserInputService.TouchEnabled then
    title.TextSize = 16
    riskBadge.TextSize = 10
    for _, btn in ipairs(tabButtons) do
        btn.TextSize = 10
    end
    scanBtn.TextSize = 11
    copyBtn.TextSize = 11
    clearBtn.TextSize = 11
end

-- Стартовое сообщение
showInfo()

warn("Client Security Scanner v8.0 loaded")
print("Honest security assessment tool - NO false claims")
