#!/system/bin/sh
refresh_rate=$(dumpsys SurfaceFlinger | grep "refresh-rate" | awk '{printf("%d ", $3)}')
brand=$(getprop ro.product.system.brand)
sleep 1
echo " FixBug: 3"
echo " NewVersion: 3"
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
echo "➤ 🛠️Project: Android Lite"
echo "➤ 📄Status: No Root"
echo "|------------------------------------|"
echo "| Status: $(if [ $(which su) ]; then echo 'Root'; else echo 'No Root'; fi) "
echo "| Brand: $brand"
echo "| Android SDK: $(getprop ro.build.version.sdk)"
echo "| Kernel: $(uname -r)"
echo "| BitCheck: $(uname -m)"
echo "|------------------------------------|"
log() {
    log=(
        "log.tag.AF::MmapTrack V"
        "log.tag.AF::OutputTrack V"
        "log.tag.AF::PatchRecord V"
        "log.tag.AF::PatchTrack V"
        "log.tag.AF::RecordHandle V"
        "log.tag.AF::RecordTrack V"
        "log.tag.AF::Track V"
        "log.tag.AF::TrackBase V"
        "log.tag.AF::TrackHandle V"
        "log.tag.APM-KpiMonitor V"
        "log.tag.APM-ServiceJ V"
        "log.tag.APM-SessionJ V"
        "log.tag.APM-SessionN V"
        "log.tag.APM-Subscriber V"
        "log.tag.APM::AudioCollections V"
        "log.tag.APM::AudioInputDescriptor V"
        "log.tag.APM::AudioOutputDescriptor V"
        "log.tag.APM::AudioPatch V"
        "log.tag.APM::AudioPolicyEngine V"
        "log.tag.APM::AudioPolicyEngine::Base V"
        "log.tag.APM::AudioPolicyEngine::Config V"
        "log.tag.APM::AudioPolicyEngine::ProductStrategy V"
        "log.tag.APM::AudioPolicyEngine::VolumeGroup V"
        "log.tag.APM::Devices V"
        "log.tag.APM::IOProfile V"
        "log.tag.APM::Serializer V"
        "log.tag.APM::VolumeCurve V"
        "log.tag.APM_AudioPolicyManager V"
        "log.tag.APM_ClientDescriptor V"
        "log.tag.AT V"
        "log.tag.AccountManager V"
        "log.tag.ActivityManager V"
        "log.tag.ActivityManagerService V"
        "log.tag.ActivityTaskManager V"
        "log.tag.ActivityTaskManagerService V"
        "log.tag.AdnRecord V"
        "log.tag.AdnRecordCache V"
        "log.tag.AdnRecordLoader V"
        "log.tag.AirplaneHandler V"
        "log.tag.AlarmManager V"
        "log.tag.AlarmManagerService V"
        "log.tag.AndroidRuntime V"
        "log.tag.AppOps V"
        "log.tag.AudioAttributes V"
        "log.tag.AudioEffect V"
        "log.tag.AudioFlinger V"
        "log.tag.AudioFlinger::DeviceEffectProxy V"
        "log.tag.AudioFlinger::DeviceEffectProxy::ProxyCallback V"
        "log.tag.AudioFlinger::EffectBase V"
        "log.tag.AudioFlinger::EffectChain V"
        "log.tag.AudioFlinger::EffectHandle V"
        "log.tag.AudioFlinger::EffectModule V"
        "log.tag.AudioFlinger_Threads V"
        "log.tag.AudioHwDevice V"
        "log.tag.AudioManager V"
        "log.tag.AudioPolicy V"
        "log.tag.AudioPolicyEffects V"
        "log.tag.AudioPolicyIntefaceImpl V"
        "log.tag.AudioPolicyManager V"
        "log.tag.AudioPolicyService V"
        "log.tag.AudioProductStrategy V"
        "log.tag.AudioRecord V"
        "log.tag.AudioService V"
        "log.tag.AudioSystem V"
        "log.tag.AudioTrack V"
        "log.tag.AudioTrackShared V"
        "log.tag.AudioVolumeGroup V"
        "log.tag.BackupManager V"
        "log.tag.BatteryManager V"
        "log.tag.BatteryStatsService V"
        "log.tag.BluetoothAdapter V"
        "log.tag.BluetoothDevice V"
        "log.tag.BluetoothGattService V"
        "log.tag.BluetoothHidService V"
        "log.tag.BluetoothManager V"
        "log.tag.BluetoothMapService V"
        "log.tag.BluetoothPanService V"
        "log.tag.BluetoothPbapService V"
        "log.tag.BluetoothSapService V"
        "log.tag.BluetoothService V"
        "log.tag.BluetoothSocket V"
        "log.tag.BufferQueueDump V"
        "log.tag.BufferQueueProducer V"
        "log.tag.C2K_AT V"
        "log.tag.C2K_ATConfig V"
        "log.tag.C2K_RILC V"
        "log.tag.CAM2PORT_ V"
        "log.tag.CapaSwitch V"
        "log.tag.CarrierExpressServiceImpl V"
        "log.tag.CarrierExpressServiceImplExt V"
    )
    for commands in "${log[@]}"; do
    IFS=' ' read -r name value <<< "$commands"
    setprop "$name" "$value"
done
}> /dev/null 2>&1
tweaks() {
setprop debug.adpf.use_report_actual_duration true
setprop debug.graphics.game_default_frame_rate.disabled true
setprop debug.sf.hw 1
setprop debug.egl.hw 1
setprop debug.hwui.renderer skiagl
cmd power set-adaptive-power-saver-enabled false
cmd power set-fixed-performance-mode-enabled true
cmd device_config put game_driver fps_limit 0
cmd device_config put game_driver default_enabled true
cmd thermalservice override-status 0
settings put system pointer_speed 7
settings put global low_power 0
settings put system touch.pressure.scale 0.001
settings put system touch_slop 8
systems put fps_limit 0
settings put thermal_limit_refresh_rate 1
setprop debug.hwui.fps_divisor 1
svc bluetooth disable
svc nfc disable
svc location disable
svc data disable
pm trim-caches 999M
am-kill all
}> /dev/null 2>&1
sleep 1
echo " Start Running Tweaks!!"
echo "[MAIN] $(date '+%H:%M:%S'): 1️⃣ Bắt đầu tối ưu hệ thống Android..."
echo "[MAIN] $(date '+%H:%M:%S'): • Bật dựng hình SkiaGL để tăng tốc render GPU."
echo "[MAIN] $(date '+%H:%M:%S'): • Ưu tiên xử lý đồ họa bằng phần cứng thay vì phần mềm."
echo "[MAIN] $(date '+%H:%M:%S'): • Kích hoạt chế độ hiệu năng cố định & tắt tiết kiệm pin."
echo "[MAIN] $(date '+%H:%M:%S'): • Bỏ giới hạn FPS để đạt tốc độ khung hình cao nhất."
echo "[MAIN] $(date '+%H:%M:%S'): • Tắt cơ chế giảm hiệu năng do nhiệt độ (thermal throttling)."
echo "[MAIN] $(date '+%H:%M:%S'): • Tối ưu độ nhạy cảm ứng và giảm độ trễ khi chạm."
echo "[MAIN] $(date '+%H:%M:%S'): • Tắt Bluetooth, NFC, GPS, và Dữ liệu nền để tiết kiệm RAM & pin."
echo "[MAIN] $(date '+%H:%M:%S'): • Dọn cache hệ thống và tắt ứng dụng nền để giải phóng RAM."
echo "[MAIN] $(date '+%H:%M:%S'): ✅ Tối ưu hệ thống hoàn tất!"
echo " Success !!"
tweaks
log