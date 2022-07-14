#!/usr/bin/env python3

import iterm2


async def main(connection):
    app = await iterm2.async_get_app(connection)
    window = app.current_terminal_window

    # create panes and resize them
    top = app.current_terminal_window.current_tab.current_session
    top.preferred_size = iterm2.util.Size(height=30, width=200)
    await app.current_terminal_window.current_tab.async_update_layout()

    bottom_left = await top.async_split_pane(vertical=False)
    bottom_left.preferred_size = iterm2.util.Size(height=3, width=200)
    await app.current_terminal_window.current_tab.async_update_layout()
    
    bottom_middle = await bottom_left.async_split_pane(vertical=True)
    bottom_right = await bottom_middle.async_split_pane(vertical=True)

    # run command(s)
    await top.async_send_text("wtfutil\n")
    await bottom_left.async_send_text("sshuttle_work\n")

    # new tab to work with
    await window.async_create_tab()

iterm2.run_until_complete(main)
