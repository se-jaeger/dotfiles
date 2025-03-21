require("full-border"):setup()
require("relative-motions"):setup({ show_numbers = "relative", show_motion = true, only_motions = true })
require("starship"):setup()
require("git"):setup()
require("augment-command"):setup({
	prompt = false,
	default_item_group_for_prompt = "hovered",
	smart_enter = true,
	smart_paste = false,
	enter_archives = true,
	must_have_hovered_item = true,
	skip_single_subdirectory_on_enter = true,
	skip_single_subdirectory_on_leave = true,
	wraparound_file_navigation = false,
})
