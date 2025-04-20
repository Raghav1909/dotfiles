local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node

local function get_component_name()
	local filename = vim.fn.expand("%:t:r")
	local pascal_case = filename:gsub("[%-_](%w)", function(c)
		return c:upper()
	end)
	pascal_case = pascal_case:gsub("^%l", string.upper)
	return pascal_case
end

return {
	s("rfc", {
		t({ "const " }),
		f(function()
			return get_component_name()
		end, {}),
		t({ " = () => {", "  return (", "    " }),
		i(2, "<div>"),
		t({ "", "    " }),
		i(3, ""),
		t({ "", "    " }),
		i(4, "</div>"),
		t({ "", "  )", "}", "", "export default " }),
		f(function()
			return get_component_name()
		end, {}),
	}),

	s("us", {
		t({ "const [" }),
		i(1, "state"),
		t({ ", set" }),
		i(2, "State"),
		t({ "] = useState(" }),
		i(3, "initialState"),
		t({ ")" }),
	}),

	s("ue", {
		t({ "useEffect(() => {", "  " }),
		i(1, ""),
		t({ "", "}, [" }),
		i(2, ""),
		t({ "])" }),
	}),
}
