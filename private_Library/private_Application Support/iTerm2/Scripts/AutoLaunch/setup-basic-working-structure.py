#!/usr/bin/env python3

import iterm2


async def main(connection):
    app = await iterm2.async_get_app(connection)
    window = app.current_terminal_window

    # create panes and resize them
    top = app.current_terminal_window.current_tab.current_session
    top.preferred_size = iterm2.util.Size(height=50, width=250)
    await app.current_terminal_window.current_tab.async_update_layout()

    bottom_left = await top.async_split_pane(vertical=False)
    bottom_left.preferred_size = iterm2.util.Size(height=5, width=250)
    await app.current_terminal_window.current_tab.async_update_layout()
    
    bottom_middle = await bottom_left.async_split_pane(vertical=True)
    await bottom_middle.async_split_pane(vertical=True)

    # run command(s)
    ## backup tool's configuration
    await top.async_send_text(
        "DATE=$(date +%Y-%m-%d__%H-%M-%S);" +
        "BASE_DIR=~/Library/Mobile\ Documents/com~apple~CloudDocs/Mackup;" +
        "rsync --archive ${BASE_DIR}/latest ${BASE_DIR}/${DATE};" +
        "mackup backup -f;" +
        "\n"
        )

    ## start WTF dashboard
    await top.async_send_text("wtfutil\n")

    ## Open VPN tunnel
    await bottom_left.async_send_text("print_connect_to_work_vpn_info\n")

    # new tab to work with
    await window.async_create_tab()

    # activate pane to directly allow typing in password
    await bottom_left.async_activate()

iterm2.run_until_complete(main)
