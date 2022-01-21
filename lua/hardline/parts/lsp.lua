-- local lsp = vim.lsp
local fmt = string.format

local function get_diagnostic(prefix, severity)
    local diagnostics = vim.diagnostic.get(0)
    local count = {0, 0, 0, 0}

    for _, diagnostic in ipairs(diagnostics) do
        count[diagnostic.severity] = count[diagnostic.severity] + 1
    end

    local c =0;
    if severity == 'Error' then
        c = count[vim.diagnostic.severity.ERROR];
    else
        c = count[vim.diagnostic.severity.WARN];
    end

    if c < 1 then
        return ''
    end
    return fmt('%s:%d', prefix, c)
end

local function get_error()
    return get_diagnostic('E', 'Error')
end

local function get_warning()
    return get_diagnostic('W', 'Warning')
end

return {
    get_error = get_error,
    get_warning = get_warning,
}
