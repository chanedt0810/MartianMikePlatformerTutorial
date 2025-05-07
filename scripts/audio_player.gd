extends Node

var hurt = preload("res://assets/audio/hurt.wav")
var jump = preload("res://assets/audio/jump.wav")

func play_sfx(sfx_name: String) -> void:
    
    
    var stream = null
    match sfx_name:
        "hurt":
            stream = hurt
        "jump":
            stream = jump
        _:
            print("Sound effect not found: ", sfx_name)
            return

    var audio_stream_player = AudioStreamPlayer2D.new()
    audio_stream_player.stream = stream
    audio_stream_player.name = "SFX"

    add_child(audio_stream_player)
    audio_stream_player.play()

    await audio_stream_player.finished
    audio_stream_player.queue_free()
