extends CanvasLayer

func show_win_screen(flag: bool) -> void:
    # Show or hide the win screen based on the flag
    $WinScreen.visible = flag