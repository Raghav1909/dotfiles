-- In your Lua configuration file (or custom snippets file)
local ls = require("luasnip") -- Import LuaSnip
local s = ls.snippet -- Shorthand for creating snippets
local t = ls.text_node -- Text node for plain text
local i = ls.insert_node -- Insert node for placeholders

-- Define the React functional component snippet
ls.add_snippets("typescriptreact", {
	s("rfc", { -- 'rfc' will be the trigger for this snippet
		t("const "),
		i(1, "ComponentName"),
		t(" = () => {"),
		t({ "", "  return (" }),
		t({ "", "    <div>" }),
		i(2, "ComponentName"),
		t("</div>"),
		t({ "", "  )" }),
		t({ "", "}" }),
		t({ "", "", "export default " }),
		i(1, "ComponentName"),
		t(";"),
	}),
})
