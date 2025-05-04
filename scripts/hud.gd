extends Control

func set_time_label(value: int) -> void:
    # Set the time label text
    $TimeLabel.text = "TIME: " + str(value)