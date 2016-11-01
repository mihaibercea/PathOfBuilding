-- Path of Building
--
-- Class: Calc Breakdown Control
-- Calculation breakdown control used in the Calcs tab
--
local launch, main = ...

local t_insert = table.insert
local m_max = math.max
local m_min = math.min
local band = bit.band

local CalcBreakdownClass = common.NewClass("CalcBreakdown", "Control", "ControlHost", function(self, calcsTab)
	self.Control()
	self.ControlHost()
	self.calcsTab = calcsTab
	self.shown = false
	self.nodeViewer = common.New("PassiveTreeView")
	self.controls.scrollBar = common.New("ScrollBarControl", {"RIGHT",self,"RIGHT"}, -2, 0, 18, 0, 80, "VERTICAL", true)
end)

function CalcBreakdownClass:IsMouseOver()
	if not self:IsShown() then
		return
	end
	if self:GetMouseOverControl() then
		return true
	end
	local x, y = self:GetPos()
	local width, height = self:GetSize()
	local cursorX, cursorY = GetCursorPos()
	return cursorX >= x and cursorY >= y and cursorX < x + width and cursorY < y + height
end

function CalcBreakdownClass:SetBreakdownData(displayData, pinned)
	self.pinned = pinned
	if displayData == self.sourceData then
		return
	end
	self.sourceData = displayData
	self.shown = false
	if not displayData then
		return
	end

	self.sectionList = wipeTable(self.sectionList)

	for _, sectionData in ipairs(displayData) do
		if sectionData.breakdown then
			self:AddBreakdownSection(sectionData)
		elseif sectionData.modName then
			self:AddModSection(sectionData)
		end
	end

	if #self.sectionList == 0 then
		self.calcsTab:ClearDisplayStat()
		return
	end
	self.shown = true

	self.contentWidth = 0
	local offset = 2
	for i, section in ipairs(self.sectionList) do
		if section.type == "TEXT" then
			section.width = 0
			for _, line in ipairs(section.lines) do
				section.width = m_max(section.width, DrawStringWidth(section.textSize, "VAR", line) + 8)
			end
			section.height = #section.lines * section.textSize + 4
		elseif section.type == "TABLE" then
			section.width = 4
			for _, col in pairs(section.colList) do
				for _, row in pairs(section.rowList) do
					if row[col.key] then
						col.width = m_max(col.width or 0, DrawStringWidth(16, "VAR", col.label) + 6, DrawStringWidth(12, "VAR", row[col.key]) + 6)
					end
				end
				if col.width then
					section.width = section.width + col.width
				end
			end
			section.height = #section.rowList * 14 + 20
			if section.label then
				section.height = section.height + 16
			end
		end
		self.contentWidth = m_max(self.contentWidth, section.width)
		section.offset = offset
		offset = offset + section.height + 8
	end
	self.contentHeight = offset - 6
end

function CalcBreakdownClass:AddBreakdownSection(sectionData)
	local breakdown = self.calcsTab.calcsEnv.breakdown[sectionData.breakdown]
	if not breakdown then
		return
	end
	if #breakdown > 0 then
		t_insert(self.sectionList, {
			type = "TEXT",
			lines = breakdown,
			textSize = 16
		})
	end
	if breakdown.damageComponents and #breakdown.damageComponents > 0 then
		local section = {
			type = "TABLE",
			rowList = breakdown.damageComponents,
			colList = { 
				{ label = "From", key = "source", right = true },
				{ label = "Base", key = "base" },
				{ label = "Inc/red", key = "inc" },
				{ label = "More/less", key = "more" },
				{ label = "Converted Damage", key = "convSrc" },
				{ label = "Total", key = "total" },
				{ label = "Conversion", key = "convDst" },
			}
		}
		t_insert(self.sectionList, section)
	end
	if breakdown.reservations and #breakdown.reservations > 0 then
		local section = {
			type = "TABLE",
			rowList = breakdown.reservations,
			colList = { 
				{ label = "Skill", key = "skillName" },
				{ label = "Base", key = "base" },
				{ label = "MCM", key = "mult" },
				{ label = "More/less", key = "more" },
				{ label = "Inc/red", key = "inc" },
				{ label = "Reservation", key = "total" },
			}
		}
		t_insert(self.sectionList, section)
	end
	if breakdown.slots and #breakdown.slots > 0 then
		local section = { 
			type = "TABLE",
			rowList = breakdown.slots,
			colList = { 
				{ label = "Base", key = "base", right = true },
				{ label = "Inc/red", key = "inc" },
				{ label = "More/less", key = "more" },
				{ label = "Total", key = "total", right = true },
				{ label = "Source", key = "source" },
				{ label = "Name", key = "sourceLabel" },
			},
		}
		t_insert(self.sectionList, section)
		for _, row in pairs(section.rowList) do
			if row.item then
				row.sourceLabel = data.colorCodes[row.item.rarity]..row.item.name
				row.sourceLabelTooltip = function()
					self.calcsTab.build.itemsTab:AddItemTooltip(row.item, row.source)
					return data.colorCodes[row.item.rarity], true
				end
			else
				row.sourceLabel = row.sourceName
			end
		end
	end
end

function CalcBreakdownClass:AddModSection(sectionData)
	local env = self.calcsTab.calcsEnv
	local build = self.calcsTab.build
	local cfg = (sectionData.cfg and copyTable(env.mainSkill[sectionData.cfg.."Cfg"])) or { }
	cfg.source = sectionData.modSource
	cfg.tabulate = true
	local rowList
	local modDB = sectionData.enemy and env.enemyDB or env.modDB
	if type(sectionData.modName) == "table" then
		rowList = modDB:Sum(sectionData.modType, cfg, unpack(sectionData.modName))
	else
		rowList = modDB:Sum(sectionData.modType, cfg, sectionData.modName)
	end
	if #rowList == 0 then
		return
	end
	local section = {
		type = "TABLE",
		label = sectionData.label,
		rowList = rowList,
		colList = { 
			{ label = "Value", key = "value" },
			{ label = "Stat", key = "name" },
			{ label = "Skill types", key = "flags" },
			{ label = "Notes", key = "tags" },
			{ label = "Source", key = "source" },
			{ label = "Source Name", key = "sourceName" },
		},
	}
	t_insert(self.sectionList, section)
	if not sectionData.modType then
		for i, row in pairs(rowList) do
			row.index = i
		end
		table.sort(rowList, function(a, b)
			if a.mod.type == b.mod.type then
				return a.index < b.index
			else
				return a.mod.type < b.mod.type
			end
		end)
	end
	local sourceTotals = { }
	if not sectionData.modSource then
		local types = { }
		local typeList = { }
		for i, row in pairs(rowList) do
			if not types[row.mod.type] then
				types[row.mod.type] = true
				t_insert(typeList, row.mod.type)
			end
			local sourceType = row.mod.source:match("[^:]+")
			if not sourceTotals[sourceType] then
				sourceTotals[sourceType] = { }
			end	
		end
		cfg.tabulate = false
		for sourceType, lines in pairs(sourceTotals) do
			cfg.source = sourceType
			for _, modType in ipairs(typeList) do
				if type(sectionData.modName) == "table" then
					for _, modName in ipairs(sectionData.modName) do
						local total = modDB:Sum(modType, cfg, modName)
						if modType == "MORE" then
							total = round((total - 1) * 100)
						end
						if total ~= 0 then
							t_insert(lines, self:FormatModValue(total, modType) .. " " .. modName:gsub("(%l)(%u)","%1 %2"))
						end
					end
				else
					local total = modDB:Sum(modType, cfg, sectionData.modName)
					if modType == "MORE" then
						total = round((total - 1) * 100)
					end
					if total ~= 0 then
						t_insert(lines, self:FormatModValue(total, modType))
					end
				end
			end
		end
	end
	for _, row in pairs(rowList) do
		if not sectionData.modType then
			row.value = self:FormatModValue(row.value, row.mod.type)
		else
			section.colList[1].right = true
			row.value = formatRound(row.value, 2)
		end
		if type(sectionData.modName) == "table" then
			row.name = self:FormatModName(row.mod.name)
		end
		local sourceType = row.mod.source:match("[^:]+")
		if not sectionData.modSource then
			row.source = sourceType
			row.sourceTooltip = function()
				main:AddTooltipLine(16, "Total from "..sourceType..":")
				for _, line in ipairs(sourceTotals[sourceType]) do
					main:AddTooltipLine(14, line)
				end
				return nil, false
			end
		end
		if sourceType == "Item" then
			local itemId = row.mod.source:match("Item:(%d+):.+")
			local item = build.itemsTab.list[tonumber(itemId)]
			row.sourceName = data.colorCodes[item.rarity]..item.name
			row.sourceNameTooltip = function()
				build.itemsTab:AddItemTooltip(item, row.mod.sourceSlot)
				return data.colorCodes[item.rarity], true
			end
		elseif sourceType == "Tree" then
			local nodeId = row.mod.source:match("Tree:(%d+)")
			if nodeId then
				local node = build.spec.nodes[tonumber(nodeId)]
				row.sourceName = node.dn
				row.sourceNameNode = node
			elseif row.mod.source == "Tree:Jewel" then
				row.sourceName = "Jewel conversion"
			end
		elseif sourceType == "Skill" then
			row.sourceName = row.mod.source:match("Skill:(.+)")
		end
		if row.mod.flags ~= 0 or row.mod.keywordFlags ~= 0 then
			local flagNames = { }
			for flags, src in pairs({[row.mod.flags] = ModFlag, [row.mod.keywordFlags] = KeywordFlag}) do
				for name, val in pairs(src) do
					if band(flags, val) == val then
						t_insert(flagNames, name)
					end
				end
			end
			table.sort(flagNames)
			for _, name in ipairs(flagNames) do
				row.flags = (row.flags and row.flags .. ", " or "") .. name
			end
		end
		if row.mod.tagList[1] then
			local baseVal = (row.mod.type == "BASE" and string.format("%+g", math.abs(row.mod.value)) or math.abs(row.mod.value).."%")
			for _, tag in ipairs(row.mod.tagList) do
				local desc
				if tag.type == "Condition" then
					desc = "Condition: "..self:FormatModName(tag.var)
				elseif tag.type == "Multiplier" then
					if tag.base then
						desc = (row.mod.type == "BASE" and string.format("%+g", tag.base) or tag.base.."%").." + "..math.abs(row.mod.value).." per "..self:FormatModName(tag.var)
					else
						desc = baseVal.." per "..self:FormatModName(tag.var)
					end
				elseif tag.type == "PerStat" then
					if tag.base then
						desc = (row.mod.type == "BASE" and string.format("%+g", tag.base) or tag.base.."%").." + "..math.abs(row.mod.value).." per "..tag.div.." "..self:FormatModName(tag.var)
					else
						desc = baseVal.." per "..tag.div.." "..self:FormatModName(tag.stat)
					end
				elseif tag.type == "SkillName" then
					desc = "Skill: "..tag.skillName
				elseif tag.type == "SlotNumber" then
					desc = "When in slot #"..tag.num
				elseif tag.type == "GlobalEffect" then
					desc = tag.effectType
				else
					desc = self:FormatModName(tag.type)
				end
				if desc then
					row.tags = (row.tags and row.tags .. ", " or "") .. desc
				end
			end
		end
	end
end

function CalcBreakdownClass:FormatModName(modName)
	return modName:gsub("([%l%d])(%u)","%1 %2"):gsub("(%l)(%d)","%1 %2")
end

function CalcBreakdownClass:FormatModValue(value, modType)
	if modType == "BASE" then
		return string.format("%+g base", value)
	elseif modType == "INC" then
		if value >= 0 then
			return value.."% increased"
		else
			return -value.."% decreased"
		end
	elseif modType == "MORE" then
		if value >= 0 then
			return value.."% more"
		else
			return -value.."% less"
		end
	else
		return value		
	end
end

function CalcBreakdownClass:DrawBreakdownTable(viewPort, x, y, section)
	local cursorX, cursorY = GetCursorPos()
	local colX = x + 4
	if section.label then
		DrawString(x + 2, y, "LEFT", 16, "VAR", "^7"..section.label..":")
		y = y + 16
	end
	for index, col in ipairs(section.colList) do
		if col.width then
			col.x = colX
			if index > 1 then
				SetDrawColor(0.5, 0.5, 0.5)
				DrawImage(nil, colX - 2, y, 1, section.label and section.height - 16 or section.height)
			end
			SetDrawColor(1, 1, 1)
			DrawString(colX, y + 2, "LEFT", 16, "VAR", col.label)
			colX = colX + col.width
		end
	end
	local rowY = y + 20
	for _, row in ipairs(section.rowList) do
		SetDrawColor(0.5, 0.5, 0.5)
		DrawImage(nil, x + 2, rowY - 1, section.width - 4, 1)
		for _, col in ipairs(section.colList) do
			if col.x and row[col.key] then
				if col.right then
					DrawString(col.x + col.width - 4, rowY + 1, "RIGHT_X", 12, "VAR", "^7"..row[col.key])
				else
					DrawString(col.x, rowY + 1, "LEFT", 12, "VAR", "^7"..row[col.key])
				end
				local ttFunc = row[col.key.."Tooltip"]
				local ttNode = row[col.key.."Node"]
				if (ttFunc or ttNode) and cursorY >= viewPort.y + 2 and cursorY < viewPort.y + viewPort.height - 2 and cursorX >= col.x and cursorY >= rowY and cursorX < col.x + col.width and cursorY < rowY + 14 then
					SetDrawLayer(nil, 15)
					SetDrawColor(0, 1, 0)
					DrawImage(nil, col.x - 2, rowY - 1, col.width, 1)
					DrawImage(nil, col.x - 2, rowY + 13, col.width, 1)
					if ttFunc then
						local color, center = ttFunc()
						main:DrawTooltip(col.x, rowY, col.width, 12, viewPort, color, center)
					elseif ttNode then
						local viewerX = col.x + col.width + 5
						if viewPort.x + viewPort.width < viewerX + 304 then
							viewerX = col.x - 309
						end
						local viewerY = m_min(rowY, viewPort.y + viewPort.height - 304)
						SetDrawColor(1, 1, 1)
						DrawImage(nil, viewerX, viewerY, 304, 304)
						local viewer = self.nodeViewer
						viewer.zoom = 5
						viewer.zoomX = -ttNode.x / 11.85
						viewer.zoomY = -ttNode.y / 11.85
						SetViewport(viewerX + 2, viewerY + 2, 300, 300)
						viewer:Draw(self.calcsTab.build, { x = 0, y = 0, width = 300, height = 300 }, { })
						SetDrawColor(1, 0, 0)
						DrawImage(viewer.highlightRing, 135, 135, 30, 30)
						SetViewport()
					end
					SetDrawLayer(nil, 10)
				end
			end
		end
		rowY = rowY + 14
	end
end

function CalcBreakdownClass:Draw(viewPort)
	local sourceData = self.sourceData
	local scrollBar = self.controls.scrollBar
	local width = self.contentWidth
	local height = self.contentHeight
	if self.contentHeight > viewPort.height then
		width = self.contentWidth + scrollBar.width
		height = viewPort.height
		scrollBar.height = height - 4
		scrollBar:SetContentDimension(self.contentHeight - 4, viewPort.height - 4)
	else
		scrollBar:SetContentDimension(0, 0)
	end
	self.width = width
	self.height = height
	local x = sourceData.x + sourceData.width + 5
	local y = m_min(sourceData.y, viewPort.y + viewPort.height - height)
	if x + width > viewPort.x + viewPort.width then
		x = m_max(viewPort.x, sourceData.x - 5 - width)
	end
	self.x = x
	self.y = y
	SetDrawLayer(nil, 10)
	SetDrawColor(0, 0, 0, 0.9)
	DrawImage(nil, x + 2, y + 2, width - 4, height - 4)
	SetDrawLayer(nil, 11)
	if self.pinned then
		SetDrawColor(0.25, 1, 0.25)
	else
		SetDrawColor(0.33, 0.66, 0.33)
	end
	DrawImage(nil, x, y, width, 2)
	DrawImage(nil, x, y + height - 2, width, 2)
	DrawImage(nil, x, y, 2, height)
	DrawImage(nil, x + width - 2, y, 2, height)
	SetDrawLayer(nil, 10)
	self:DrawControls(viewPort)
	y = y - scrollBar.offset
	for i, section in ipairs(self.sectionList) do
		local sectionY = y + section.offset
		if section.type == "TEXT" then
			local lineY = sectionY + 2
			for i, line in ipairs(section.lines) do
				SetDrawColor(1, 1, 1)
				DrawString(x + 4, lineY, "LEFT", section.textSize, "VAR", line)
				lineY = lineY + section.textSize
			end
		elseif section.type == "TABLE" then
			self:DrawBreakdownTable(viewPort, x, sectionY, section)
		end
	end
	SetDrawLayer(nil, 0)
end

function CalcBreakdownClass:OnKeyDown(key, doubleClick)
	if not self:IsShown() or not self:IsEnabled() then
		return
	end
	local mOverControl = self:GetMouseOverControl()
	if mOverControl and mOverControl.OnKeyDown then
		return mOverControl:OnKeyDown(key)
	end
	local mOver = self:IsMouseOver()
	if key:match("BUTTON") then
		if not mOver then
			self.calcsTab:ClearDisplayStat()
			self.shown = false
			return
		end
	end
	return self
end

function CalcBreakdownClass:OnKeyUp(key)
	if not self:IsShown() or not self:IsEnabled() then
		return
	end
	if key == "WHEELDOWN" then
		self.controls.scrollBar:Scroll(1)
	elseif key == "WHEELUP" then
		self.controls.scrollBar:Scroll(-1)
	end
	return self
end