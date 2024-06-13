# Build docker container
'''
docker build -t rvc_cli .
'''

# Run docker container
'''
docker run --gpus all -it --rm -v "C:\Users\j.hoellerer\Repos\RVC_CLI-1\portal:/app/portal" rvc_cli
'''

# Inside test inference:
Important: Index doesnt work currently so use 0.0
'''
python rvc.py infer --f0up_key 0 --filter_radius 3 --index_rate 0.0 --hop_length 128 --rms_mix_rate 1.0 --protect 0.3 --f0autotune False --f0method rmvpe --input_path /app/audio.mp3 --output_path /app/portal/audio_out.mp3 --pth_path /app/Jari2.pth --index_path /app/Jari2.index
'''