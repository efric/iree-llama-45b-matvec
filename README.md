compile:  
`iree-compile matvec.mlir -o matvec.vmfb --iree-hal-target-device=hip --iree-hip-target=gfx942 --iree-opt-level=O3 --iree-hal-dump-executable-files-to=<dir>`  
`iree-compile <dir>/<benchmark>.mlir -o <output>.vmfb --mlir-print-ir-after-all 2><output>.mlir`  
  
benchmarking:  
`iree-benchmark-module --device=hip://7 --device_allocator=caching --hip_use_streams=true --module=<output>.vmfb`  
  
profiling:  
omniperf:  
`rocprof-compute profile -n <name> --no-roof -- same-as-above`  
`rocprof-compute analyze -p workloads/<name>/MI300X_A1/ --gui`  
	-> you can tunnel with `ssh -L 8050:localhost:8050  username@remote.host.com`  
  
tt  
`rocprofv3 -i att.json -d out-dir/up-to-you --same as above`  
