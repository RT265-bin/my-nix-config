return {
    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        dependencies = {"nvim-tree/nvim-web-devicons"},
        config = function()
            require("nvim-tree").setup ({
	sort_by = "case_sensitive",
	git = {
		enable = true,
	      },
        view = {
	side = "left",
	number = true,
	relativenumber = true,
	signcolumn = "yes",
	width = 30,
               },
        renderer = {
        group_empty = true,
 	},
            })
        end
    }
}
