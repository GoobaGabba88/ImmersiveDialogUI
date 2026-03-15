function ScrollFrameTemplate_OnMouseWheel(self, value, scrollBar)
    scrollBar = scrollBar or getglobal(self:GetName() .. "ScrollBar");
    if (value > 0) then
        scrollBar:SetValue(scrollBar:GetValue() - (scrollBar:GetHeight() / 2));
    else
        scrollBar:SetValue(scrollBar:GetValue() + (scrollBar:GetHeight() / 2));
    end
end

-- Scrollframe functions
function ScrollFrame_OnLoad(self)
    getglobal(self:GetName() .. "ScrollBarScrollDownButton"):Disable();
    getglobal(self:GetName() .. "ScrollBarScrollUpButton"):Disable();

    local scrollbar = getglobal(self:GetName() .. "ScrollBar");
    scrollbar:SetMinMaxValues(0, 0);
    scrollbar:SetValue(0);
    self.offset = 0;
	
end

function ScrollFrame_OnScrollRangeChanged(self, xrange, yrange)
    local scrollbar = getglobal(self:GetName() .. "ScrollBar");
    local scrollrange = yrange or self:GetVerticalScrollRange();
    
    local value = scrollbar:GetValue();
    if (value > scrollrange) then
        value = scrollrange;
    end
    scrollbar:SetMinMaxValues(0, scrollrange);
    scrollbar:SetValue(value);
    if (floor(scrollrange) == 0) then
        if (self.scrollBarHideable) then
            getglobal(self:GetName() .. "ScrollBar"):Hide();
            getglobal(scrollbar:GetName() .. "ScrollDownButton"):Hide();
            getglobal(scrollbar:GetName() .. "ScrollUpButton"):Hide();
        else
            getglobal(scrollbar:GetName() .. "ScrollDownButton"):Disable();
            getglobal(scrollbar:GetName() .. "ScrollUpButton"):Disable();
            getglobal(scrollbar:GetName() .. "ScrollDownButton"):Show();
            getglobal(scrollbar:GetName() .. "ScrollUpButton"):Show();
        end
        getglobal(scrollbar:GetName() .. "ThumbTexture"):Hide();
    else
        getglobal(scrollbar:GetName() .. "ScrollDownButton"):Show();
        getglobal(scrollbar:GetName() .. "ScrollUpButton"):Show();
        getglobal(self:GetName() .. "ScrollBar"):Show();
        getglobal(scrollbar:GetName() .. "ScrollDownButton"):Enable();
        getglobal(scrollbar:GetName() .. "ThumbTexture"):Show();
    end

    -- Hide/show scrollframe borders
    local top = getglobal(self:GetName() .. "Top");
    local bottom = getglobal(self:GetName() .. "Bottom");
    local middle = getglobal(self:GetName() .. "Middle");
    if (top and bottom and self.scrollBarHideable) then
        if (self:GetVerticalScrollRange() == 0) then
            top:Hide();
            bottom:Hide();
        else
            top:Show();
            bottom:Show();
        end
    end
    if (middle and self.scrollBarHideable) then
        if (self:GetVerticalScrollRange() == 0) then
            middle:Hide();
        else
            middle:Show();
        end
    end
end

function ScrollingEdit_OnTextChanged(self, scrollFrame)
    if (not scrollFrame) then
        scrollFrame = self:GetParent();
    end
end

function ScrollingEdit_OnCursorChanged(self, x, y, w, h)
    self.cursorOffset = y;
    self.cursorHeight = h;
end
