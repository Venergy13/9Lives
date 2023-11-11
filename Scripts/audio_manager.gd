extends Node

func play(parent: Node, stream: AudioStream, volume_db: float = 0.0, pitch_scale: float = 1.0):
	var audio_stream_player = AudioStreamPlayer2D.new()
	parent.add_child(audio_stream_player)
	audio_stream_player.stream = stream
	audio_stream_player.volume_db = volume_db
	audio_stream_player.pitch_scale = pitch_scale
	audio_stream_player.play()
	audio_stream_player.connect("finished", audio_stream_player.queue_free)
	return audio_stream_player
