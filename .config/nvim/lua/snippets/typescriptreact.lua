local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node

-- Function to get filename without extension and convert to PascalCase
local function get_component_name()
	local filename = vim.fn.expand("%:t:r") -- Get filename without extension
	-- Convert to PascalCase (assuming filename is in kebab-case or snake_case)
	local pascal_case = filename:gsub("[%-_](%w)", function(c)
		return c:upper()
	end)
	pascal_case = pascal_case:gsub("^%l", string.upper)
	return pascal_case
end

return {
	s("rfc", {
		t({ "interface Props {", "  " }),
		i(1, "// props"),
		t({ "", "}", "", "const " }),
		f(function()
			return get_component_name()
		end, {}),
		t({ " = (props: Props) => {", "  return (", "    " }),
		i(3, "<div>"),
		t({ "", "      " }),
		i(4, ""),
		t({ "", "    " }),
		i(5, "</div>"),
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
		t({ "] = useState<" }),
		i(3, "type"),
		t({ ">(" }),
		i(4, "initialState"),
		t({ ")" }),
	}),

	s("ue", {
		t({ "useEffect(() => {", "  " }),
		i(1, ""),
		t({ "", "}, [" }),
		i(2, ""),
		t({ "])" }),
	}),

	s("onc", {
		t({ "const " }),
		i(1, "handleClick"),
		t({ " = (event: React.MouseEvent<" }),
		i(2, "HTMLButtonElement"),
		t({ ", MouseEvent>) => {", "  " }),
		i(3, ""),
		t({ "", "}" }),
	}),
}
