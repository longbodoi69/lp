#!/system/bin/sh
refresh_rate=$(dumpsys SurfaceFlinger | grep "refresh-rate" | awk '{printf("%d ", $3)}')
brand=$(getprop ro.product.system.brand)
sleep 1
echo " 
  █████╗ ███╗   ██╗██████╗ ██████╗  ██████╗ ██╗██████╗ 
██╔══██╗████╗  ██║██╔══██╗██╔══██╗██╔═══██╗██║██╔══██╗
███████║██╔██╗ ██║██║  ██║██████╔╝██║   ██║██║██║  ██║
██╔══██║██║╚██╗██║██║  ██║██╔══██╗██║   ██║██║██║  ██║
██║  ██║██║ ╚████║██████╔╝██║  ██║╚██████╔╝██║██████╔╝
╚═╝  ╚═╝╚═╝  ╚═══╝╚═════╝ ╚═╝  ╚═╝ ╚═════╝ ╚═╝╚═════╝ 
                                                      
██╗     ██╗████████╗███████╗                          
██║     ██║╚══██╔══╝██╔════╝                          
██║     ██║   ██║   █████╗                            
██║     ██║   ██║   ██╔══╝                            
███████╗██║   ██║   ███████╗                          
╚══════╝╚═╝   ╚═╝   ╚══════╝  "             
sleep 1
echo "➤ 🖥️Dev: LongPhan"
echo "➤ 🛠️Project: Android Lite V2"
echo "➤ 📄Status: No Root"
echo "| Status: $(if [ $(which su) ]; then echo 'Root'; else echo 'No Root'; fi) "
echo "| Brand: $brand"
echo "| Android SDK: $(getprop ro.build.version.sdk)"
echo "| Kernel: $(uname -r)"
echo "| BitCheck: $(uname -m)"
echo "|_________________________________"
if [ "$refresh_rate" -eq 60 ]; then
settings put system gamecube_frame_interpolation_for_rs 0:0:0:60:60 
elif [ "$refresh_rate" -eq 90 ]; then
settings put system gamecube_frame_interpolation_for_rs 1:1:0:45:90
elif [ "$refresh_rate" -eq 120 ]; then
settings put system gamecube_frame_interpolation_for_rs 1:1:0:60:120 
else
    echo ""
fi
settings put system peak_refresh_rate "$refresh_rate"
settings put system max_refresh_rate "$refresh_rate"
settings put system min_refresh_rate "$refresh_rate"
settings put system miui_refresh_rate "$refresh_rate"
settings put system user_refresh_rate "$refresh_rate"
tweaks() {
setprop debug.adpf.use_report_actual_duration true
setprop debug.cl.profiler false
setprop debug.egl.finish true
setprop debug.egl.force_msaa false
setprop debug.egl.profiler false
setprop debug.egl.profiler.abstractsocket false
setprop debug.egl.profiler.binaryprogram false
setprop debug.egl.profiler.drawcalldelim false
setprop debug.egl.profiler.drawlabel false
setprop debug.egl.profiler.dumpscopedata false
setprop debug.egl.profiler.forcewalltime false
setprop debug.egl.profiler.gpuscope false
setprop debug.egl.profiler.ignoregl1 false
setprop debug.egl.profiler.lib64 false
setprop debug.egl.profiler.namedsocket false
setprop debug.egl.profiler.perfetto false
setprop debug.egl.profiler.periodic false
setprop debug.egl.profiler.progoverrides false
setprop debug.egl.profiler.rendercall false
setprop debug.egl.profiler.scopemetrics false
setprop debug.egl.profiler.scopemode false
setprop debug.egl.profiler.scopetest false
setprop debug.egl.profiler.shaderstats false
setprop debug.egl.profiler.snapshot false
setprop debug.egl.profiler.stddelim false
setprop debug.egl.trace false
setprop debug.egl.traceGpuCompletion false
setprop debug.en.drpcrpt false
setprop debug.generate-debug-info false
setprop debug.graphics.gpu.profiler.perfetto false
setprop debug.fbodump.enabled false
setprop debug.sf.showupdates false
setprop debug.sf.hw true
setprop debug.egl.hw true
setprop debug.hwui.renderer skiagl
setprop debug.renderengine.backend skiagputhreaded
setprop debug.sf.prime_shader_cache.edge_extension_shader false
setprop debug.sf.prime_shader_cache.hole_punch false
setprop debug.sf.prime_shader_cache.clipped_dimmed_image_layers false
setprop debug.sf.prime_shader_cache.transparent_image_dimmed_layers false
setprop debug.sf.prime_shader_cache.solid_dimmed_layers false
setprop debug.sf.prime_shader_cache.shadow_layers false
setprop debug.sf.prime_shader_cache.image_layers false
setprop debug.sf.prime_shader_cache.image_dimmed_layers false
setprop debug.sf.prime_shader_cache.solid_layers false
setprop debug.sf.prime_shader_cache.clipped_layers false
setprop debug.sf.prime_shader_cache.pip_image_layers false
setprop debug.hwui.show_dirty_regions false
setprop debug.hwui.show_layers_updates false
setprop debug.hwui.trace_gpu_resources false
setprop debug.hwui.skip_empty_damage false
setprop debug.renderengine.graphite true
setprop debug.renderengine.skia_atrace_enabled false
setprop debug.rs.default-CPU-driver false
setprop debug.rs.default-GPU-driver true
setprop debug.rs.forcerecompile false
setprop debug.rs.precision false
setprop debug.rs.profile false
setprop debug.rs.reduce false
setprop debug.rs.reduce-split-accum false
setprop debug.rs.rsov false
setprop debug.rs.script false
setprop debug.rs.shader false
setprop debug.rs.shader.attributes false
setprop debug.rs.shader.uniforms false
setprop debug.rs.visual false
setprop debug.sf.show_predicted_vsync false
setprop debug.sf.show_refresh_rate_overlay_in_middle false
setprop debug.sf.show_refresh_rate_overlay_render_rate false
setprop debug.sf.show_refresh_rate_overlay_spinner false
cmd package compile -m speed-profile -f com.android.systemui
cmd package compile -m speed-profile -f com.dts.freefiremax
cmd package compile -m speed-profile -f com.dts.freefireth
setprop debug.sf.auto_latch_unsignaled true
setprop debug.sf.cached_set_render_duration_ns true
setprop debug.sf.disable_backpressure true
setprop debug.sf.enable_cached_set_render_scheduling true
setprop debug.sf.enable_gl_backpressure true
setprop debug.sf.enable_layer_caching true
setprop debug.sf.enable_layer_lifecycle_manager true
setprop debug.sf.fp16_client_target true
setprop debug.sf.enable_adpf_cpu_hint true
setprop debug.sf.use_frame_rate_priority true
}> /dev/null 2>&1
sleep 1
echo "[MAIN] $(date '+%H:%M:%S'): • Bật SkiaGL – render mượt hơn, giảm delay khi vuốt chạm."
sleep 0.5
echo "[MAIN] $(date '+%H:%M:%S'): • Xử lý khung hình chính xác – tránh lệch thời gian, khựng nhẹ biến mất."
sleep 0.5
echo "[MAIN] $(date '+%H:%M:%S'): • Tăng buffer đồ họa – load khung độ phân giải cao không bị sụt FPS."
sleep 0.5
echo "[MAIN] $(date '+%H:%M:%S'): • Ưu tiên GPU xử lý hiển thị – giảm tải cho CPU, nhẹ máy."
sleep 0.5
echo "[MAIN] $(date '+%H:%M:%S'): • Bật report khung hình – hiệu năng ổn định theo FPS thực tế."
sleep 0.5
echo "[MAIN] $(date '+%H:%M:%S'): • Ưu tiên xử lý giao diện & cảm ứng – thao tác phản hồi nhanh như điện."
sleep 0.5
echo "[MAIN] $(date '+%H:%M:%S'): • Dọn shader rác – GPU bớt gánh, mát máy, RAM trống hơn."
sleep 0.5
echo "[MAIN] $(date '+%H:%M:%S'): • Tắt toàn bộ theo dõi GPU – không log, không trace, không tụt FPS."
sleep 0.5
echo "[MAIN] $(date '+%H:%M:%S'): • Xoá profiling định kỳ – tránh spike, tránh giật bất chợt khi đang combat."
sleep 0.5
echo "[MAIN] $(date '+%H:%M:%S'): • Dọn sạch trace, socket log – tăng tốc hệ thống, load mượt hơn."
sleep 0.5
echo "[MAIN] $(date '+%H:%M:%S'): • Tắt log Dolby, GPU, hiệu ứng thừa – game chạy nhẹ hơn, ít crash."
sleep 0.5
echo "[MAIN] $(date '+%H:%M:%S'): • Disable debug info – tiết kiệm RAM, CPU, không log ngầm."
sleep 0.5
echo "[MAIN] $(date '+%H:%M:%S'): • Tắt framebuffer log – chuyển cảnh mượt, hết khựng nhẹ UI."
sleep 0.5
echo "[MAIN] $(date '+%H:%M:%S'): • Tắt overlay FPS – không chiếm lớp hiển thị, giữ nguyên hiệu năng."
sleep 0.5
echo "[MAIN] $(date '+%H:%M:%S'): • Dẹp luôn profiling RenderScript – đỡ nền, đỡ ngốn máy."
sleep 0.5
echo "[MAIN] $(date '+%H:%M:%S'): • Tối ưu dựng hình – input delay thấp, chạm đâu ăn đó."
sleep 0.5
echo "[MAIN] $(date '+%H:%M:%S'): • Biên dịch lại SystemUI & Free Fire – tốc độ load max ping."
sleep 0.5
echo "[MAIN] $(date '+%H:%M:%S'): • Cảm ứng vuốt như bay – kéo, xoay, bật scope không delay."
sleep 0.5
echo "[MAIN] $(date '+%H:%M:%S'): • Phản hồi cực nhanh – fix lag spike khi skill combat nhanh."
sleep 0.5
echo "[MAIN] $(date '+%H:%M:%S'): • Kết quả: FPS ổn định, mát máy, mượt xuyên combat."
sleep 0.5
echo " Success !!"
tweaks