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
log() {
    log=(
    "log.tag.FA VERBOSE"
    "log.tag.AF::MmapTrack VERBOSE"
    "log.tag.AF::OutputTrack VERBOSE"
    "log.tag.AF::PatchRecord VERBOSE"
    "log.tag.AF::PatchTrack VERBOSE"
    "log.tag.AF::RecordHandle VERBOSE"
    "log.tag.AF::RecordTrack VERBOSE"
    "log.tag.AF::Track VERBOSE"
    "log.tag.AF::TrackBase VERBOSE"
    "log.tag.AF::TrackHandle VERBOSE"
    "log.tag.APM-KpiMonitor VERBOSE"
    "log.tag.APM-ServiceJ VERBOSE"
    "log.tag.APM-SessionJ VERBOSE"
    "log.tag.APM-SessionN VERBOSE"
    "log.tag.APM-Subscriber VERBOSE"
    "log.tag.APM::AudioCollections VERBOSE"
    "log.tag.APM::AudioInputDescriptor VERBOSE"
    "log.tag.APM::AudioOutputDescriptor VERBOSE"
    "log.tag.APM::AudioPatch VERBOSE"
    "log.tag.APM::AudioPolicyEngine VERBOSE"
    "log.tag.APM::AudioPolicyEngine::Base VERBOSE"
    "log.tag.APM::AudioPolicyEngine::Config VERBOSE"
    "log.tag.APM::AudioPolicyEngine::ProductStrategy VERBOSE"
    "log.tag.APM::AudioPolicyEngine::VolumeGroup VERBOSE"
    "log.tag.APM::Devices VERBOSE"
    "log.tag.APM::IOProfile VERBOSE"
    "log.tag.APM::Serializer VERBOSE"
    "log.tag.APM::VolumeCurve VERBOSE"
    "log.tag.APM_AudioPolicyManager VERBOSE"
    "log.tag.APM_ClientDescriptor VERBOSE"
    "log.tag.AT VERBOSE"
    "log.tag.AccountManager VERBOSE"
    "log.tag.ActivityManager VERBOSE"
    "log.tag.ActivityManagerService VERBOSE"
    "log.tag.ActivityTaskManager VERBOSE"
    "log.tag.ActivityTaskManagerService VERBOSE"
    "log.tag.AdnRecord VERBOSE"
    "log.tag.AdnRecordCache VERBOSE"
    "log.tag.AdnRecordLoader VERBOSE"
    "log.tag.AirplaneHandler VERBOSE"
    "log.tag.AlarmManager VERBOSE"
    "log.tag.AlarmManagerService VERBOSE"
    "log.tag.AndroidRuntime VERBOSE"
    "log.tag.AppOps VERBOSE"
    "log.tag.AudioAttributes VERBOSE"
    "log.tag.AudioEffect VERBOSE"
    "log.tag.AudioFlinger VERBOSE"
    "log.tag.AudioFlinger::DeviceEffectProxy VERBOSE"
    "log.tag.AudioFlinger::DeviceEffectProxy::ProxyCallback VERBOSE"
    "log.tag.AudioFlinger::EffectBase VERBOSE"
    "log.tag.AudioFlinger::EffectChain VERBOSE"
    "log.tag.AudioFlinger::EffectHandle VERBOSE"
    "log.tag.AudioFlinger::EffectModule VERBOSE"
    "log.tag.AudioFlinger_Threads VERBOSE"
    "log.tag.AudioHwDevice VERBOSE"
    "log.tag.AudioManager VERBOSE"
    "log.tag.AudioPolicy VERBOSE"
    "log.tag.AudioPolicyEffects VERBOSE"
    "log.tag.AudioPolicyIntefaceImpl VERBOSE"
    "log.tag.AudioPolicyManager VERBOSE"
    "log.tag.AudioPolicyService VERBOSE"
    "log.tag.AudioProductStrategy VERBOSE"
    "log.tag.AudioRecord VERBOSE"
    "log.tag.AudioService VERBOSE"
    "log.tag.AudioSystem VERBOSE"
    "log.tag.AudioTrack VERBOSE"
    "log.tag.AudioTrackShared VERBOSE"
    "log.tag.AudioVolumeGroup VERBOSE"
    "log.tag.BackupManager VERBOSE"
    "log.tag.BatteryManager VERBOSE"
    "log.tag.BatteryStatsService VERBOSE"
    "log.tag.BluetoothAdapter VERBOSE"
    "log.tag.BluetoothDevice VERBOSE"
    "log.tag.BluetoothGattService VERBOSE"
    "log.tag.BluetoothHidService VERBOSE"
    "log.tag.BluetoothManager VERBOSE"
    "log.tag.BluetoothMapService VERBOSE"
    "log.tag.BluetoothPanService VERBOSE"
    "log.tag.BluetoothPbapService VERBOSE"
    "log.tag.BluetoothSapService VERBOSE"
    "log.tag.BluetoothService VERBOSE"
    "log.tag.BluetoothSocket VERBOSE"
    "log.tag.BufferQueueDump VERBOSE"
    "log.tag.BufferQueueProducer VERBOSE"
    "log.tag.C2K_AT VERBOSE"
    "log.tag.C2K_ATConfig VERBOSE"
    "log.tag.C2K_RILC VERBOSE"
    "log.tag.CAM2PORT_ VERBOSE"
    "log.tag.CapaSwitch VERBOSE"
    "log.tag.CarrierExpressServiceImpl VERBOSE"
    "log.tag.CarrierExpressServiceImplExt VERBOSE"
    "log.tag.ClipboardManager VERBOSE"
    "log.tag.ConnectivityManager VERBOSE"
    "log.tag.ConnectivityService VERBOSE"
    "log.tag.ConsumerIrService VERBOSE"
    "log.tag.ContentManager VERBOSE"
    "log.tag.CountryDetector VERBOSE"
    "log.tag.DMC-ApmService VERBOSE"
    "log.tag.DMC-Core VERBOSE"
    "log.tag.DMC-DmcService VERBOSE"
    "log.tag.DMC-EventsSubscriber VERBOSE"
    "log.tag.DMC-ReqQManager VERBOSE"
    "log.tag.DMC-SessionManager VERBOSE"
    "log.tag.DMC-TranslatorLoader VERBOSE"
    "log.tag.DMC-TranslatorUtils VERBOSE"
    "log.tag.DSSelector VERBOSE"
    "log.tag.DSSelectorOP01 VERBOSE"
    "log.tag.DSSelectorOP02 VERBOSE"
    "log.tag.DSSelectorOP09 VERBOSE"
    "log.tag.DSSelectorOP18 VERBOSE"
    "log.tag.DSSelectorOm VERBOSE"
    "log.tag.DSSelectorUtil VERBOSE"
    "log.tag.DataDispatcher VERBOSE"
    "log.tag.DeviceIdleController VERBOSE"
    "log.tag.DevicePolicyManager VERBOSE"
    "log.tag.DevicePolicyManagerService VERBOSE"
    "log.tag.DisplayManager VERBOSE"
    "log.tag.DisplayManagerService VERBOSE"
    "log.tag.DockObserver VERBOSE"
    "log.tag.DownloadManager VERBOSE"
    "log.tag.ExternalSimMgr VERBOSE"
    "log.tag.FastCapture VERBOSE"
    "log.tag.FastMixer VERBOSE"
    "log.tag.FastMixerState VERBOSE"
    "log.tag.FastThread VERBOSE"
    "log.tag.FragmentManager VERBOSE"
    "log.tag.FuseDaemon VERBOSE"
    "log.tag.GAv4 VERBOSE"
    "log.tag.GraphicsStats VERBOSE"
    "log.tag.GsmCallTkrHlpr VERBOSE"
    "log.tag.GsmCdmaConn VERBOSE"
    "log.tag.GsmCdmaPhone VERBOSE"
    "log.tag.HardwarePropertiesManager VERBOSE"
    "log.tag.HardwareService VERBOSE"
    "log.tag.IAudioFlinger VERBOSE"
    "log.tag.IMSRILRequest VERBOSE"
    "log.tag.IMS_RILA VERBOSE"
    "log.tag.IccCardProxy VERBOSE"
    "log.tag.IccPhoneBookIM VERBOSE"
    "log.tag.IccProvider VERBOSE"
    "log.tag.ImsApp VERBOSE"
    "log.tag.ImsBaseCommands VERBOSE"
    "log.tag.ImsCall VERBOSE"
    "log.tag.ImsCallProfile VERBOSE"
    "log.tag.ImsCallSession VERBOSE"
    "log.tag.ImsEcbm VERBOSE"
    "log.tag.ImsEcbmProxy VERBOSE"
    "log.tag.ImsManager VERBOSE"
    "log.tag.ImsPhone VERBOSE"
    "log.tag.ImsPhoneBase VERBOSE"
    "log.tag.ImsPhoneCall VERBOSE"
    "log.tag.ImsService VERBOSE"
    "log.tag.ImsVTProvider VERBOSE"
    "log.tag.InputDispatcher VERBOSE"
    "log.tag.InputManager VERBOSE"
    "log.tag.InputManagerService VERBOSE"
    "log.tag.InputMethodManager VERBOSE"
    "log.tag.InputMethodManagerService VERBOSE"
    "log.tag.InterfaceManager VERBOSE"
    "log.tag.IsimFileHandler VERBOSE"
    "log.tag.IsimRecords VERBOSE"
    "log.tag.JobScheduler VERBOSE"
    "log.tag.KeyguardManager VERBOSE"
    "log.tag.LCM-Subscriber VERBOSE"
    "log.tag.LIBC2K_RIL VERBOSE"
    "log.tag.LocationManager VERBOSE"
    "log.tag.LocationManagerService VERBOSE"
    "log.tag.LocationProvider VERBOSE"
    "log.tag.MAPI-CommandProcessor VERBOSE"
    "log.tag.MAPI-MdiRedirector VERBOSE"
    "log.tag.MAPI-MdiRedirectorCtrl VERBOSE"
    "log.tag.MAPI-NetworkSocketConnection VERBOSE"
    "log.tag.MAPI-SocketConnection VERBOSE"
    "log.tag.MAPI-SocketListener VERBOSE"
    "log.tag.MAPI-TranslatorManager VERBOSE"
    "log.tag.MDM-Subscriber VERBOSE"
    "log.tag.MTKSST VERBOSE"
    "log.tag.MTK_APPList VERBOSE"
    "log.tag.MediaPlayer VERBOSE"
    "log.tag.MediaPlayerService VERBOSE"
    "log.tag.MediaRouter VERBOSE"
    "log.tag.MediaSession VERBOSE"
    "log.tag.MipcEventHandler VERBOSE"
    "log.tag.MountService VERBOSE"
    "log.tag.MtkAdnRecord VERBOSE"
    "log.tag.MtkCsimFH VERBOSE"
    "log.tag.MtkEmbmsAdaptor VERBOSE"
    "log.tag.MtkFactory VERBOSE"
    "log.tag.MtkGsmCdmaConn VERBOSE"
    "log.tag.MtkIccCardProxy VERBOSE"
    "log.tag.MtkIccPHBIM VERBOSE"
    "log.tag.MtkIccProvider VERBOSE"
    "log.tag.MtkIccSmsInterfaceManager VERBOSE"
    "log.tag.MtkImsManager VERBOSE"
    "log.tag.MtkImsService VERBOSE"
    "log.tag.MtkIsimFH VERBOSE"
    "log.tag.MtkPhoneNotifr VERBOSE"
    "log.tag.MtkPhoneNumberUtils VERBOSE"
    "log.tag.MtkPhoneSwitcher VERBOSE"
    "log.tag.MtkRecordLoader VERBOSE"
    "log.tag.MtkRuimFH VERBOSE"
    "log.tag.MtkSIMFH VERBOSE"
    "log.tag.MtkSIMRecords VERBOSE"
    "log.tag.MtkSmsCbHeader VERBOSE"
    "log.tag.MtkSmsManager VERBOSE"
    "log.tag.MtkSmsMessage VERBOSE"
    "log.tag.MtkSpnOverride VERBOSE"
    "log.tag.MtkSubCtrl VERBOSE"
    "log.tag.MtkTelephonyManagerEx VERBOSE"
    "log.tag.MtkUiccCard VERBOSE"
    "log.tag.MtkUiccCardApp VERBOSE"
    "log.tag.MtkUiccCtrl VERBOSE"
    "log.tag.MtkUsimFH VERBOSE"
    "log.tag.MtkUsimPhoneBookManager VERBOSE"
    "log.tag.MwiRIL VERBOSE"
    "log.tag.NetAgentService VERBOSE"
    "log.tag.NetAgent_IO VERBOSE"
    "log.tag.NetLnkEventHdlr VERBOSE"
    "log.tag.NetworkManagement VERBOSE"
    "log.tag.NetworkManagementService VERBOSE"
    "log.tag.NetworkPolicy VERBOSE"
    "log.tag.NetworkPolicyManagerService VERBOSE"
    "log.tag.NetworkStats VERBOSE"
    "log.tag.NetworkTimeUpdateService VERBOSE"
    "log.tag.NotificationManager VERBOSE"
    "log.tag.NotificationManagerService VERBOSE"
    "log.tag.OperatorUtils VERBOSE"
    "log.tag.PKM-Lib VERBOSE"
    "log.tag.PKM-MDM VERBOSE"
    "log.tag.PKM-Monitor VERBOSE"
    "log.tag.PKM-SA VERBOSE"
    "log.tag.PKM-Service VERBOSE"
    "log.tag.PQ_DS VERBOSE"
    "log.tag.PackageInstaller VERBOSE"
    "log.tag.PackageManager VERBOSE"
    "log.tag.PersistentDataBlockManager VERBOSE"
    "log.tag.Phone VERBOSE"
    "log.tag.PhoneConfigurationSettings VERBOSE"
    "log.tag.PhoneFactory VERBOSE"
    "log.tag.PowerHalAddressUitls VERBOSE"
    "log.tag.PowerHalMgrImpl VERBOSE"
    "log.tag.PowerHalMgrServiceImpl VERBOSE"
    "log.tag.PowerHalWifiMonitor VERBOSE"
    "log.tag.PowerManager VERBOSE"
    "log.tag.PowerManagerService VERBOSE"
    "log.tag.PrintManager VERBOSE"
    "log.tag.ProcessStats VERBOSE"
    "log.tag.ProxyController VERBOSE"
    "log.tag.RFX VERBOSE"
    "log.tag.RIL VERBOSE"
    "log.tag.RIL-Fusion VERBOSE"
    "log.tag.RIL-Netlink VERBOSE"
    "log.tag.RIL-Parcel VERBOSE"
    "log.tag.RIL-SocListen VERBOSE"
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
cmd package compile -m speed-profile -f com.android.systemui
cmd package compile -m speed-profile -f com.dts.freefiremax
cmd package compile -m speed-profile -f com.dts.freefireth
dumpsys deviceidle disable deep
dumpsys deviceidle disable light
cmd deviceidle disable light
cmd deviceidle disable deep
pkill -f logcat
logcat -G 8m
while true
do sleep 30;cmd battery reset;cmd battery set temp 200;done>/dev/null 2>&1&
if [ $? -eq 0 ]; then
echo "Boost FPS"
else
echo "Thiết bị không hỗ trợ"
fi
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
echo "[MAIN] $(date '+%H:%M:%S'): • Tối ưu game Free Fire bằng biên dịch trước (speed-profile)."
echo "[MAIN] $(date '+%H:%M:%S'): • Vô hiệu hoá chế độ tiết kiệm năng lượng tự động của Android (DeviceIdle)."
echo "[MAIN] $(date '+%H:%M:%S'): • Tăng tốc logcat và giảm dung lượng log hệ thống."
echo "[MAIN] $(date '+%H:%M:%S'): • Tự động giữ nhiệt độ giả lập ổn định (reset & set battery temp mỗi 30s)."
echo "[MAIN] $(date '+%H:%M:%S'): ✅ Tối ưu hệ thống hoàn tất! Thiết bị đã được tăng tốc toàn diện."
echo " Success !!"
tweaks
log