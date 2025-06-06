#!/system/bin/sh
dev=longdz
version=V5
refresh_rate=$(dumpsys SurfaceFlinger | grep "refresh-rate" | awk '{printf("%d ", $3)}')
brand=$(getprop ro.product.system.brand)
hardware=$(getprop ro.hardware)
brand=$(getprop ro.product.brand)
kb_ram=$(cat /proc/meminfo | grep MemTotal | awk '{print $2}')
gb_ram=$(echo "scale=2; $kb_ram / 1048576" | bc)
ram_info=$(cat /proc/meminfo | grep -E "MemTotal|MemAvailable" | \
awk 'NR==1{total=$2} NR==2{available=$2} END{printf "%.2f / %.2f GB", available/1024/1024, total/1024/1024}')
storage=$(df /data | awk 'NR==2 { total=($2+$3)/1024/1024; used=$3/1024/1024; printf "%.2f / %.0f GB", used, total }')
ping=$(ping -c 1 8.8.8.8 | grep 'time=' | awk -F'time=' '{print $2}' | cut -d' ' -f1)
sleep 0.5
echo "┌────────────────────────────────────────┐"
echo "│     ⚙️ SENSIXPATCHV5     │"
echo "├────────────────────────────────────────┤"
printf "│ 🕶️ Dev       : %-27s│\n" "$dev"
printf "│ 📦 Module   : %-27s│\n" "Demo Booster"
printf "│ 🔋 Status   : %-27s│\n" "No Root"
printf "│ 📱 Brand    : %-27s│\n" "$brand"
printf "│ 💿 Android  : %-27s│\n" "$android"
printf "│ 🔧 BitCheck : %-27s│\n" "$bit"
echo "├────────────────────────────────────────┤"
echo "│ [ GAMING MODE ]    [ CLEAN CACHE ]      │"
echo "│ [ GPU BOOST ]       [ FPS BOOST ]  │"
echo "├────────────────────────────────────────┤"
printf "│ 📊 CPU      : %-27s│\n" "$cores cores"
printf "│ 🧠 RAM       : %-27s│\n" "$ram_info"
printf "│ 💾 Storage  : %-27s│\n" "$storage"
printf "│ 🌐 Network  : %-27s│\n" "$ping ms"
printf "│ ⚡ Screen   : %-27s│\n" "$refresh_rate Hz"
echo "└────────────────────────────────────────┘"
echo " Wait For Install🌪️‍ "

if [ "$refresh_rate" -eq 60 ]; then
device_config put surfaceflinger max_frame_rate_override_fps 60
device_config put input touch_sampling_rate_hz 120
setprop debug.sf.scroll_boost_refreshrate 120
setprop debug.sf.touch_boost_refreshrate 120 
settings put system gamecube_frame_interpolation_for_rs 0:0:0:60:60 
elif [ "$refresh_rate" -eq 90 ]; then
device_config put surfaceflinger max_frame_rate_override_fps 90
device_config put input touch_sampling_rate_hz 180
setprop debug.sf.scroll_boost_refreshrate 180
setprop debug.sf.touch_boost_refreshrate 180
settings put system gamecube_frame_interpolation_for_rs 1:1:0:45:90
elif [ "$refresh_rate" -eq 120 ]; then
device_config put surfaceflinger max_frame_rate_override_fps 120
device_config put input touch_sampling_rate_hz 240
setprop debug.sf.scroll_boost_refreshrate 240
setprop debug.sf.touch_boost_refreshrate 240
settings put system gamecube_frame_interpolation_for_rs 1:1:0:60:120 
else
    echo "Tần số quét không xác định hoặc khác 60/90/120"
fi
settings put system peak_refresh_rate "$refresh_rate"
settings put system max_refresh_rate "$refresh_rate"
settings put system min_refresh_rate "$refresh_rate"
settings put system miui_refresh_rate "$refresh_rate"
settings put system user_refresh_rate "$refresh_rate"
device_config put surfaceflinger peak_refresh_rate "$refresh_rate"
device_config put surfaceflinger max_refresh_rate "$refresh_rate"
device_config put surfaceflinger min_refresh_rate "$refresh_rate"
device_config put surfaceflinger miui_refresh_rate "$refresh_rate"
device_config put surfaceflinger user_refresh_rate "$refresh_rate"
settings put system fps_limit "$refresh_rate"
settings put system thermal_limit_refresh_rate 1
settings put system game_default_frame_rate_override "$refresh_rate"
settings put system virtual_display_default_refresh_rate "$refresh_rate"
setprop debug.javafx.animation.framerate "$refresh_rate"
settings put system force_max_refresh_rate "$refresh_rate"
settings put system override_min_frame_rate "$refresh_rate"
settings put system default_refresh_rate "$refresh_rate"
settings put system gaming_mode_fps "$refresh_rate"
settings put system refresh_rate "$refresh_rate"
settings put system default_refresh_rate "$refresh_rate"
settings put system refresh_default_rate "$refresh_rate"
settings put system NV_FPSLIMIT "$refresh_rate"
settings put secure peak_refresh_rate "$refresh_rate"
settings put secure max_refresh_rate "$refresh_rate"
settings put secure min_refresh_rate "$refresh_rate"
settings put secure miui_refresh_rate "$refresh_rate"
settings put secure user_refresh_rate "$refresh_rate"
settings put secure fps_limit "$refresh_rate"
settings put secure thermal_limit_refresh_rate 1
settings put secure game_default_frame_rate_override "$refresh_rate"
settings put secure virtual_display_default_refresh_rate "$refresh_rate"
settings put secure force_max_refresh_rate "$refresh_rate"
settings put secure override_min_frame_rate "$refresh_rate"
settings put secure default_fps "$refresh_rate"
settings put secure gaming_mode_fps "$refresh_rate"
settings put secure refresh_rate "$refresh_rate"
settings put secure default_refresh_rate "$refresh_rate"
settings put secure refresh_default_rate "$refresh_rate"
settings put secure NV_FPSLIMIT "$refresh_rate"
settings put system display_refresh_rate "$refresh_rate"
setting put system max_refresh_rate_for_gaming "$refresh_rate"
setprop debug.fps.target "$refresh_rate"
setprop debug.egl.frame_rate "$refresh_rate"


apply_properties() {
    local name="debug.composition.type"
    local value="gpu"
    setprop "$name" "$value"
}> /dev/null 2>&1
apply_tweaks() {
    local name="debug.sf.hw"
    local value="1"
    setprop "$name" "$value"
}> /dev/null 2>&1
apply_fps() {
    local name="debug.hwui.fps_divisor"
    local value="1"
    setprop "$name" "$value"
}> /dev/null 2>&1
apply_vsync1() {
    local name="debug.egl.swapinterval"
    local value="1"
    setprop "$name" "$value"
}> /dev/null 2>&1
apply_vsync2() {
    local name="debug.sf.swapinterval"
    local value="1"
    setprop "$name" "$value"
}> /dev/null 2>&1
apply_vsync3() {
    local name="debug.gr.swapinterval"
    local value="1"
    setprop "$name" "$value"
}> /dev/null 2>&1

log() {
    disable_log=(
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
        "log.tag.ClipboardManager V"
        "log.tag.ConnectivityManager V"
        "log.tag.ConnectivityService V"
        "log.tag.ConsumerIrService V"
        "log.tag.ContentManager V"
        "log.tag.CountryDetector V"
        "log.tag.DMC-ApmService V"
        "log.tag.DMC-Core V"
        "log.tag.DMC-DmcService V"
        "log.tag.DMC-EventsSubscriber V"
        "log.tag.DMC-ReqQManager V"
        "log.tag.DMC-SessionManager V"
        "log.tag.DMC-TranslatorLoader V"
        "log.tag.DMC-TranslatorUtils V"
        "log.tag.DSSelector V"
        "log.tag.DSSelectorOP01 V"
        "log.tag.DSSelectorOP02 V"
        "log.tag.DSSelectorOP09 V"
        "log.tag.DSSelectorOP18 V"
        "log.tag.DSSelectorOm V"
        "log.tag.DSSelectorUtil V"
        "log.tag.DataDispatcher V"
        "log.tag.DeviceIdleController V"
        "log.tag.DevicePolicyManager V"
        "log.tag.DevicePolicyManagerService V"
        "log.tag.DisplayManager V"
        "log.tag.DisplayManagerService V"
        "log.tag.DockObserver V"
        "log.tag.DownloadManager V"
        "log.tag.ExternalSimMgr V"
        "log.tag.FastCapture V"
        "log.tag.FastMixer V"
        "log.tag.FastMixerState V"
        "log.tag.FastThread V"
        "log.tag.FragmentManager V"
        "log.tag.FuseDaemon V"
        "log.tag.GAv4 V"
        "log.tag.GraphicsStats V"
        "log.tag.GsmCallTkrHlpr V"
        "log.tag.GsmCdmaConn V"
        "log.tag.GsmCdmaPhone V"
        "log.tag.HardwarePropertiesManager V"
        "log.tag.HardwareService V"
        "log.tag.IAudioFlinger V"
        "log.tag.IMSRILRequest V"
        "log.tag.IMS_RILA V"
        "log.tag.IccCardProxy V"
        "log.tag.IccPhoneBookIM V"
        "log.tag.IccProvider V"
        "log.tag.ImsApp V"
        "log.tag.ImsBaseCommands V"
        "log.tag.ImsCall V"
        "log.tag.ImsCallProfile V"
        "log.tag.ImsCallSession V"
        "log.tag.ImsEcbm V"
        "log.tag.ImsEcbmProxy V"
        "log.tag.ImsManager V"
        "log.tag.ImsPhone V"
        "log.tag.ImsPhoneBase V"
        "log.tag.ImsPhoneCall V"
        "log.tag.ImsService V"
        "log.tag.ImsVTProvider V"
        "log.tag.InputDispatcher V"
        "log.tag.InputManager V"
        "log.tag.InputManagerService V"
        "log.tag.InputMethodManager V"
        "log.tag.InputMethodManagerService V"
        "log.tag.InterfaceManager V"
        "log.tag.IsimFileHandler V"
        "log.tag.IsimRecords V"
        "log.tag.JobScheduler V"
        "log.tag.KeyguardManager V"
        "log.tag.LCM-Subscriber V"
        "log.tag.LIBC2K_RIL V"
        "log.tag.LocationManager V"
        "log.tag.LocationManagerService V"
        "log.tag.LocationProvider V"
        "log.tag.MAPI-CommandProcessor V"
        "log.tag.MAPI-MdiRedirector V"
        "log.tag.MAPI-MdiRedirectorCtrl V"
        "log.tag.MAPI-NetworkSocketConnection V"
        "log.tag.MAPI-SocketConnection V"
        "log.tag.MAPI-SocketListener V"
        "log.tag.MAPI-TranslatorManager V"
        "log.tag.MDM-Subscriber V"
        "log.tag.MTKSST V"
        "log.tag.MTK_APPList V"
        "log.tag.MediaPlayer V"
        "log.tag.MediaPlayerService V"
        "log.tag.MediaRouter V"
        "log.tag.MediaSession V"
        "log.tag.MipcEventHandler V"
        "log.tag.MountService V"
        "log.tag.MtkAdnRecord V"
        "log.tag.MtkCsimFH V"
        "log.tag.MtkEmbmsAdaptor V"
        "log.tag.MtkFactory V"
        "log.tag.MtkGsmCdmaConn V"
        "log.tag.MtkIccCardProxy V"
        "log.tag.MtkIccPHBIM V"
        "log.tag.MtkIccProvider V"
        "log.tag.MtkIccSmsInterfaceManager V"
        "log.tag.MtkImsManager V"
        "log.tag.MtkImsService V"
        "log.tag.MtkIsimFH V"
        "log.tag.MtkPhoneNotifr V"
        "log.tag.MtkPhoneNumberUtils V"
        "log.tag.MtkPhoneSwitcher V"
        "log.tag.MtkRecordLoader V"
        "log.tag.MtkRuimFH V"
        "log.tag.MtkSIMFH V"
        "log.tag.MtkSIMRecords V"
        "log.tag.MtkSmsCbHeader V"
        "log.tag.MtkSmsManager V"
        "log.tag.MtkSmsMessage V"
        "log.tag.MtkSpnOverride V"
        "log.tag.MtkSubCtrl V"
        "log.tag.MtkTelephonyManagerEx V"
        "log.tag.MtkUiccCard V"
        "log.tag.MtkUiccCardApp V"
        "log.tag.MtkUiccCtrl V"
        "log.tag.MtkUsimFH V"
        "log.tag.MtkUsimPhoneBookManager V"
        "log.tag.MwiRIL V"
        "log.tag.NetAgentService V"
        "log.tag.NetAgent_IO V"
        "log.tag.NetLnkEventHdlr V"
        "log.tag.NetworkManagement V"
        "log.tag.NetworkManagementService V"
        "log.tag.NetworkPolicy V"
        "log.tag.NetworkPolicyManagerService V"
        "log.tag.NetworkStats V"
        "log.tag.NetworkTimeUpdateService V"
        "log.tag.NotificationManager V"
        "log.tag.NotificationManagerService V"
        "log.tag.OperatorUtils V"
        "log.tag.PKM-Lib V"
        "log.tag.PKM-MDM V"
        "log.tag.PKM-Monitor V"
        "log.tag.PKM-SA V"
        "log.tag.PKM-Service V"
        "log.tag.PQ_DS V"
        "log.tag.PackageInstaller V"
        "log.tag.PackageManager V"
        "log.tag.PersistentDataBlockManager V"
        "log.tag.Phone V"
        "log.tag.PhoneConfigurationSettings V"
        "log.tag.PhoneFactory V"
        "log.tag.PowerHalAddressUitls V"
        "log.tag.PowerHalMgrImpl V"
        "log.tag.PowerHalMgrServiceImpl V"
        "log.tag.PowerHalWifiMonitor V"
        "log.tag.PowerManager V"
        "log.tag.PowerManagerService V"
        "log.tag.PrintManager V"
        "log.tag.ProcessStats V"
        "log.tag.ProxyController V"
        "log.tag.RFX V"
        "log.tag.RIL V"
        "log.tag.RIL-Fusion V"
        "log.tag.RIL-Netlink V"
        "log.tag.RIL-Parcel V"
        "log.tag.RIL-SocListen V"
        "log.tag.RIL-Socket V"
        "log.tag.RILC V"
        "log.tag.RILC-OP V"
        "log.tag.RILD V"
        "log.tag.RILMD2-SS V"
        "log.tag.RIL_UIM_SOCKET V"
        "log.tag.RadioManager V"
        "log.tag.RfxAction V"
        "log.tag.RfxBaseHandler V"
        "log.tag.RfxChannelMgr V"
        "log.tag.RfxCloneMgr V"
        "log.tag.RfxContFactory V"
        "log.tag.RfxController V"
        "log.tag.RfxDebugInfo V"
        "log.tag.RfxDisThread V"
        "log.tag.RfxFragEnc V"
        "log.tag.RfxHandlerMgr V"
        "log.tag.RfxIdToMsgId V"
        "log.tag.RfxIdToStr V"
        "log.tag.RfxMainThread V"
        "log.tag.RfxMclDisThread V"
        "log.tag.RfxMclMessenger V"
        "log.tag.RfxMclStatusMgr V"
        "log.tag.RfxMessage V"
        "log.tag.RfxObject V"
        "log.tag.RfxOpUtils V"
        "log.tag.RfxRilAdapter V"
        "log.tag.RfxRilUtils V"
        "log.tag.RfxRoot V"
        "log.tag.RfxStatusMgr V"
        "log.tag.RfxTimer V"
        "log.tag.RilClient V"
        "log.tag.RilOemClient V"
        "log.tag.RilOpProxy V"
        "log.tag.RmmCapa V"
        "log.tag.RmmCommSimOpReq V"
        "log.tag.RmmDcEvent V"
        "log.tag.RmmDcPdnManager V"
        "log.tag.RmmDcUrcHandler V"
        "log.tag.RmmDcUtility V"
        "log.tag.RmmEccNumberReqHdlr V"
        "log.tag.RmmEccNumberUrcHandler V"
        "log.tag.RmmEmbmsReq V"
        "log.tag.RmmEmbmsUrc V"
        "log.tag.RmmImsCtlReqHdl V"
        "log.tag.RmmImsCtlUrcHdl V"
        "log.tag.RmmMwi V"
        "log.tag.RmmNwAsyncHdlr V"
        "log.tag.RmmNwHdlr V"
        "log.tag.RmmNwNrtReqHdlr V"
        "log.tag.RmmNwRTReqHdlr V"
        "log.tag.RmmNwRatSwHdlr V"
        "log.tag.RmmNwReqHdlr V"
        "log.tag.RmmNwUrcHdlr V"
        "log.tag.RmmOemHandler V"
        "log.tag.RmmOpRadioReq V"
        "log.tag.RmmPhbReq V"
        "log.tag.RmmPhbUrc V"
        "log.tag.RmmRadioReq V"
        "log.tag.RmmSimBaseHandler V"
        "log.tag.RmmSimCommReq V"
        "log.tag.RmmSimCommUrc V"
        "log.tag.RmmWp V"
        "log.tag.RtmCapa V"
        "log.tag.RtmCommSimCtrl V"
        "log.tag.RtmDC V"
        "log.tag.RtmEccNumberController V"
        "log.tag.RtmEmbmsAt V"
        "log.tag.RtmEmbmsUtil V"
        "log.tag.RtmIms V"
        "log.tag.RtmImsConference V"
        "log.tag.RtmImsConfigController V"
        "log.tag.RtmImsDialog V"
        "log.tag.RtmModeCont V"
        "log.tag.RtmMwi V"
        "log.tag.RtmNwCtrl V"
        "log.tag.RtmPhb V"
        "log.tag.RtmRadioConfig V"
        "log.tag.RtmRadioCont V"
        "log.tag.RtmWp V"
        "log.tag.SIMRecords V"
        "log.tag.SQLiteQueryBuilder V"
        "log.tag.SensorManager V"
        "log.tag.ServiceManager V"
        "log.tag.SimSwitchOP01 V"
        "log.tag.SimSwitchOP02 V"
        "log.tag.SimSwitchOP18 V"
        "log.tag.SlotQueueEntry V"
        "log.tag.SpnOverride V"
        "log.tag.StatusBarManagerService V"
        "log.tag.StorageManager V"
        "log.tag.SurfaceFlinger V"
        "log.tag.SystemServer V"
        "log.tag.Telecom V"
        "log.tag.TelephonyManager V"
        "log.tag.TelephonyRegistry V"
        "log.tag.ThermalManager V"
        "log.tag.ToneGenerator V"
        "log.tag.UiccCard V"
        "log.tag.UiccController V"
        "log.tag.UsbHostManager V"
        "log.tag.UsbManager V"
        "log.tag.UxUtility V"
        "log.tag.VT V"
        "log.tag.VibratorService V"
        "log.tag.VpnManager V"
        "log.tag.VsimAdaptor V"
        "log.tag.WORLDMODE V"
        "log.tag.WallpaperManager V"
        "log.tag.WfoApp V"
        "log.tag.WifiManager V"
        "log.tag.WindowManager V"
        "log.tag.WindowManagerService V"
        "log.tag.WpfaCcciDataHeaderEncoder V"
        "log.tag.WpfaCcciReader V"
        "log.tag.WpfaCcciSender V"
        "log.tag.WpfaControlMsgHandler V"
        "log.tag.WpfaDriver V"
        "log.tag.WpfaDriverAccept V"
        "log.tag.WpfaDriverAdapter V"
        "log.tag.WpfaDriverDeReg V"
        "log.tag.WpfaDriverMessage V"
        "log.tag.WpfaDriverRegFilter V"
        "log.tag.WpfaDriverULIpPkt V"
        "log.tag.WpfaDriverUtilis V"
        "log.tag.WpfaDriverVersion V"
        "log.tag.WpfaFilterRuleReqHandler V"
        "log.tag.WpfaParsing V"
        "log.tag.WpfaRingBuffer V"
        "log.tag.WpfaRuleContainer V"
        "log.tag.WpfaRuleRegister V"
        "log.tag.WpfaShmAccessController V"
        "log.tag.WpfaShmReadMsgHandler V"
        "log.tag.WpfaShmSynchronizer V"
        "log.tag.WpfaShmWriteMsgHandler V"
        "log.tag.brevent.event V"
        "log.tag.libPowerHal V"
        "log.tag.libfuse V"
        "log.tag.mipc_lib V"
        "log.tag.mtkpower@impl V"
        "log.tag.mtkpower_client V"
        "log.tag.trm_lib V"
        "log.tag.wpfa_iptable_android V"
        "log.tag.Networklogger V"
        "log.tag.AudioFlinger::DeviceEffectProxy V"
    )
    for commands in "${disable_log[@]}"; do
    IFS=' ' read -r name value <<< "$commands"
    setprop "$name" "$value"
done
#service log off
device_config put app_compat hidden_api_access_log_sampling_rate 0
device_config put app_compat hidden_api_access_statslog_sampling_rate 0

}> /dev/null 2>&1

apply_ram_plus() {
if [ "$(echo "$gb_ram <= 4" | bc)" -eq 1 ]; then
settings put global ram_expand_size 4096
elif [ "$(echo "$gb_ram >= 7" | bc)" -eq 1 ]; then
settings put global ram_expand_size 0
else
    echo ""
fi
}> /dev/null 2>&1

sensi() {
    system=(
        "speed_pointer 7"
        "game-touchscreen-boost 1"
        "touch.pressure.scale 0.001"
        "touch_slop 8"
        "touch_boost 1"
        "ram_boost 1"
        "cpu_boost 1"
        "gpu_boost 1"
        "ui.hw 1"
    )
    secure=(
        "long_press_timeout 500"
        "multi_press_timeout 500"
        "speed_mode 1"
        "speed_mode_enable 1"
        "game_auto_temperature 0"
        "game_dashboard_always_on 1"
    ) 
    for commands in "${system[@]}"; do
    IFS=' ' read -r name value <<< "$commands"
    settings put system "$name" "$value"
done
    for commands in "${secure[@]}"; do
    IFS=' ' read -r name value <<< "$commands"
    settings put secure "$name" "$value"
done

settings delete global updatable_driver_production_opt_in_apps
settings delete global game_driver_opt_in_apps
settings delete global updatable_driver_production_opt_out_apps
settings delete global updatable_driver_prerelease_opt_in_apps
settings delete global updatable_driver_all_apps
settings delete global updatable_driver_production_in_out_apps
settings put system game_driver_gpu_mode 1
settings put system game_driver_fps_limit "$refresh_rate"
}> /dev/null 2>&1

tweaks() {
    setprop=(
        "debug.sf.hw 1"
        "debug.als.logs 0"
        "debug.atrace.tags.enableflags 0"
        "debug.egl.profiler 0"
        "debug.enable.wl_log 0"
        "debug.sf.show_predicted_vsync false"
        "debug.sf.enable_hwc_vds 0"
        "debug.sf.ddms 0"
        "ro.kernel.android.checkjni 0"
        "debug.crash.logcat 0"
        "debug.renderengine.graphite true"
        "debug.sf.dump 0"
        "debug.sf.enable_gl_backpressure false"
        "debug.fps.boost.enable true"
        "debug.hwui.skia_atrace_enabled 0"
        "debug.app.performance_restricted false"
        "debug.hwui_force_gpu_rendering 1"
        "debug.sf.multithreaded_present true"
        "debug.gpu.use_low_latency_mode true"
        "debug.gpu.memory_tracking false"
        "setprop debug.sf.enable_adpf_cpu_hint true"
        "debug.mdpcomp.logs 0"
        "debug.egl.force_msaa 0"
        "debug.hwui.force_fxaa 0" 
        "debug.hwui.force_smaa 0" 
        "debug.hwui.force_msaa 0" 
        "debug.hwui.force_txaa 0" 
        "debug.hwui.force_csaa 0" 
        "debug.hwui.force_dlss 0" 
        "debug.gr.swapinterval 1"
        "debug.graphics.game_default_frame_rate.disabled true"
        "debug.sf.luma_sampling 1"
        "debug.sf.swapinterval 1"
        "debug.hwc.otf 0"
        "ro.config.nocheckin 1"
        "debug.hwc_dump_en 0"
        "debug.hwui.disable_vsync 1"
        "debug.egl.hw 1" 
        "debug.mdlogger.Running 0"
        "debug.egl.force_dmsaa 0"
        "debug.sf.showupdates 0"
        "debug.sf.showfps 0"
        "debug.sf.showcpu 0"
        "debug.rs.use_fast_math 1"
        "debug.config.refresh_rate.boost true"
        "debug.sf.use_frame_rate_priority 1"
        "debug.hwui.overdraw false"
        "debug.sf.enable_adpf_cpu_hint true"        
        "debug.overlayui.enable 1"
        "debug.hwui.use_hint_manager 1"
        "debug.sf.showbackground 0"
        "debug.sf.shoupdates 0"
        "debug.composition.type gpu"
        "debug.egl.swapinterval 1"
        "debug.hwui.use_threaded_renderer true"
        "debug.hwc.logvsync 0"
        "debug.sf.gpuoverlay 0"
        "debug.sf.sa_enable 1"
        "debug.qc.hardware 1"
        "debug.sqlite.journalmode WAL"
        "debug.sf.sa_log 0"
        "debug.hwc.asyncdisp 1"
        "debug.power.loghint 0"
        "debug.hwui.fps_divisor 1"
        "debugtool.anrhistory 0"
        "debug.hwc.force_gpu_vsync 1"
        "debug.sf.gpu_comp_tiling 1"
        "profiler.hung.dumpdobugreport 0"
        "debug.javafx.animation.fullspeed true"
        "debug.systemuicompilerfilter speed-profile"
        "debug.performance.tuning 1"
        "debug.perf.tuning 1"
        "debug.enable-vr-mode 1"
        "debug.performance.profile 1"
        "debug.perf.profile 1"
        "debug.hwui.use_layer_renderer true"
        "pm.dexopt.bg-dexopt speed-profile"
        "pm.dexopt.ab-ota speed-profile"
        "debug.qualcomm.sns.daemon 0"
        "debug.qualcomm.sns.hal 0"
        "debug.qualcomm.sns.libsensor1 0"
        "debug.sqlite.syncmode 1"
        "debug.MB.running 0"
        "debug.MB.inner.running 0"
        "debug.MB.prepare 0"
    )
    cache=(
        "debug.hwui.texture_max_size 65536"
        "debug.hwui.texture_cache_size 65536"
        "debug.hwui.layer_cache_size 65536"
        "debug.hwui.path_cache_size 65536"
        "debug.hwui.gradient_cache_size 65536"
        "debug.hwui.drop_shadow_cache_size 65536"
        "debug.hwui.cache_size 65536"
        "debug.hwui.gradient_cache_size 65536"
        "debug.hwui.render_pipeline_cache_size 65536"
        "debug.hwui.cache_size 65536"
        "debug.hwui.resource_cache_size 65536"
        "debug.hwui.fbo_cache_size 65536"
        "debug.hwui.pipeline_cache_size 65536"
        "debug.hwui.buffer_cache_size 65536"
        "debug.hwui.layer_pool_size 65536"
        "debug.hwui.r_buffer_cache_size 65536"
        "debug.hwui.shadow.renderer monolithic"
        "debug.hwui.shape_cache_size 65536"
        "debug.hwui.disable_scissor_opt true"        
    )
    disable_animation=(
        "window_animation_scale 0"
        "transition_animation_scale 0"
        "animator_duration_scale 0"
    )
    global=(
        "gpu_debug_layers 0"
        "gpu_debug_app com.dts.freefiremax,com.dts.freefireth"
        "enable_gpu_debug_layers 0"
        "game_mode_enable 1"
        "perf_mode 1"
        "force_gpu_rendering 1"
        "angle_gl_driver_selection_pkgs com.dts.freefiremax,com.dts.freefireth"
        "angle_gl_driver_selection_values angle,angle"
        "angle_debug_package com.dts.freefiremax,com.dts.freefireth" 
        "GPUTUNER_SWITCH true"
        "CPUTUNER_SWITCH true"
        "DYNAMIC_PERFORMANCE_DEFAULT_STATUS 0"
        "DYNAMIC_PERFORMANCE_STATUS 1"
        "debug_app 0"
        "low_power 0"
    )
    optimal=(
        "dalvik.vm.dexopt-flags m=y,v=n,o=v,u=n"
        "dalvik.vm.checkjni 0"
        "dalvik.vm.dex2oat-minidebuginfo false"
        "dalvik.vm.minidebuginfo false"
    )
    touch_boost=( 
        "dev.pm.dyn_samplingrate 0"
        "debug.sf.layer_smoothness 0"
        "debug.tracing.block_touch_buffer 0"
    )
    cmd=(
        "set-adaptive-power-saver-enabled false"
        "set-fixed-performance-mode-enabled true"
    )
    touch_sensi=(
        "debug.min.fling_velocity 25000"
        "debug.max.fling_velocity 25000"
    )
    for commands in "${cmd[@]}"; do
    IFS=' ' read -r key value <<< "$commands"
    cmd power "$key" "$value"
done
    for commands in "${touch_sensi[@]}"; do
    IFS=' ' read -r key value <<< "$commands"
    setprop "$key" "$value"
done
    for commands in "${touch_boost@]}"; do
    IFS=' ' read -r key value <<< "$commands"
    setprop "$key" "$value"
done
    for commands in "${cache[@]}"; do
    IFS=' ' read -r name value <<< "$commands"
    setprop "$name" "$value"
done
    for commands in "${global[@]}"; do
    IFS=' ' read -r name value <<< "$commands"
    settings put global "$name" "$value"
done
    for commands in "${setprop@]}"; do
    IFS=' ' read -r name value <<< "$commands"
    setprop "$name" "$value"
done
    for commands in "${disable_animation[@]}"; do
    IFS=' ' read -r name value <<< "$commands"
    settings put global "$name" "$value"
done
    
if [ -n "$(getprop ro.hardware.vulkan)" ]; then
    renderer="skiavk" 
    setprop ro.hardware.vulkan adreno
elif [ -n "$(getprop ro.hardware.opengl)" ]; then
    renderer="skiagl"
else
    renderer="skiagl"
fi

if [ "$brand" != "Xiaomi" ] && ( [ "$brand" = "Samsung" ] || [ "$brand" = "realme" ] || [ "$brand" = "vivo" ] || [ "$brand" = "OPPO" ] ); then
setprop debug.sf.enable_advanced_sf_phase_offset 0
settings put global device_idle_constants inactive_to=25000,sensing_to=0,locating_to=0,location_accuracy=20.0,motion_inactive_to=0,idle_after_inactive_to=0,idle_pending_to=60000,max_idle_pending_to=120000,idle_pending_factor=2.0,idle_to=900000,max_idle_to=21600000,idle_factor=2.0,min_time_to_alarm=600000,max_temp_app_whitelist_duration=10000,mms_temp_app_whitelist_duration=10000,sms_temp_app_whitelist_duration=10000,light_after_inactive_to=5000,light_pre_idle_to=60000,light_idle_to=180000,light_idle_factor=2.0,light_max_idle_to=240000,light_idle_maintenance_min_budget=60000,light_idle_maintenance_max_budget=180000,min_light_maintenance_time=5000,min_deep_maintenance_time=30000,notification_whitelist_duration=30000
fi

device_config put game_overlay com.dts.freefireth mode=2,"$renderer"=true,fps="$refresh_rate",downscaleFactor=0.1,vsync=false,touchboost=1,gpuboost=3,gpuboost=3
device_config put game_overlay com.dts.freefiremax mode=2,"$renderer"=true,fps="$refresh_rate",downscaleFactor=0.1,vsync=false,touchboost=1,gpuboost=3,gpuboost=3
cmd power set-adaptive-power-saver-enabled false
cmd power set-fixed-performance-mode-enabled true
#sf
setprop debug.hwui.renderer "$renderer"
setprop debug.gpu.renderer "$renderer"
setprop debug.renderengine.backend skiagputhreaded 
setprop debug.composition.7x27A.type gpu
setprop debug.composition.7x25A.type gpu
device_config put game_manager gfx_quality low
device_config put game_manager gfx_api "$renderer"
settings put global gfx_quality low
settings put global render_quality low
settings put global shadow_quality disable
settings put global texture_quality low
settings put global effects_quality low
settings put global graphics_quality low
settings put global lights_quality low
settings put global shader_quality low
cmd package compile -m speed-profile -f com.android.systemui
cmd package compile -m speed-profile -f com.dts.freefiremax
cmd package compile -m speed-profile -f com.dts.freefireth
cmd package compile -m everything -f com.android.systemui
cmd package compile -m everything -f com.dts.freefiremax
cmd package compile -m everything -f com.dts.freefireth
cmd package compile -m speed-profile -f com.android.systemui
cmd package compile -m speed-profile -f com.dts.freefiremax
cmd package compile -m speed-profile -f com.dts.freefireth
cmd game mode performace com.dts.freefireth
cmd game mode performace com.dts.freefiremax
#disable gos, game booster and joyose
pm uninstall --user 0 com.xiaomi.joyose
pm uninstall --user 0 com.xiaomi.glgm
pm uninstall --user 0 com.samsung.android.game.gos
pm uninstall --user 0 com.samsung.android.game.gametools
pm uninstall --user 0 com.samsung.android.game.gamehome
#thermal 
cmd thermalservice override-status 0
#speed
pm trim-caches 9999GB
am kill-all
am compact system
dumpsys battery reset
#tracing
wm tracing size 0
#touch
device_config put interaction_jank_monitor sampling_interval 10
#disable logcat buffer
logcat -c
logcat -G 8m
#clean file
rm -rf /sdcard/DCIM/.thumbnails
rm -rf /sdcard/Pictures/.thumbnails
rm -rf /sdcard/Music/.thumbnails
rm -rf /sdcard/Movies/.thumbnails
rm -rf /sdcard/mtklog
rm -rf /sdcard/MIUI/Gallery
rm -rf /sdcard/MIUI/.debug_log
rm -rf /sdcard/MIUI/BugReportCache
rm -rf /sdcard/Android/data/.nomedia
rm -rf /sdcard/Android/obb/.nomedia
rm -rf /sdcard/Android/.Trash/com.sec.android.gallery3d
rm -rf /data/log_other_mode/*
rm -rf /dev/log/*
rm -rf /data/log_other_mode/*
rm -rf /data/log/*
rm -rf /sys/kernel/debug/*
rm -rf /dev/log/main/*
rm -rf /data/dalvik-cache/*
rm -rf /data/local/traces/*
#doze
dumpsys deviceidle disable deep
dumpsys deviceidle disable light
cmd deviceidle disable light
cmd deviceidle disable deep
}> /dev/null 2>&1
SurfaceFlinger() {
#fps_boost reup ttp
refresh_rate=$(dumpsys SurfaceFlinger | grep -i "refresh-rate" | awk '{print $3}')
frame_ns=$(echo "1000000000 / $refresh_rate" | bc)
early_app=$(echo "$frame_ns * 0.48" | bc)
early_sf=$(echo "$frame_ns * 0.26" | bc)
earlyGl_app=$(echo "$frame_ns * 0.42" | bc)
earlyGl_sf=$(echo "$frame_ns * 0.22" | bc)
late_app=$(echo "$frame_ns * 0.08" | bc)
late_sf=$(echo "$frame_ns * 0.06" | bc)
min_hwc=$(echo "$frame_ns * 0.05" | bc)
early_app_phase=$(echo "-$early_app" | bc)
early_sf_phase=$(echo "-$early_sf" | bc)
earlyGl_app_phase=$(echo "-$earlyGl_app" | bc)
earlyGl_phase=$(echo "-$earlyGl_sf" | bc)
late_app_phase=$(echo "-$late_app" | bc)
late_sf_phase=$(echo "-$late_sf" | bc)
setprop debug.sf.early.app.duration "$early_app"
setprop debug.sf.early.sf.duration "$early_sf"
setprop debug.sf.earlyGl.app.duration "$earlyGl_app"
setprop debug.sf.earlyGl.sf.duration "$earlyGl_sf"
setprop debug.sf.late.app.duration "$late_app"
setprop debug.sf.late.sf.duration "$late_sf"
setprop debug.sf.early_app_phase_offset_ns "$early_app_phase"
setprop debug.sf.early_phase_offset_ns "$early_sf_phase"
setprop debug.sf.early_gl_app_phase_offset_ns "$earlyGl_app_phase"
setprop debug.sf.early_gl_phase_offset_ns "$earlyGl_phase"
setprop debug.sf.late_app_phase_offset_ns "$late_app_phase"
setprop debug.sf.late_sf_phase_offset_ns "$late_sf_phase"
setprop debug.sf.high_fps.early.app.duration "$early_app"
setprop debug.sf.high_fps.early.sf.duration "$early_sf"
setprop debug.sf.high_fps.earlyGl.app.duration "$earlyGl_app"
setprop debug.sf.high_fps.earlyGl.sf.duration "$earlyGl_sf"
setprop debug.sf.high_fps.late.app.duration "$late_app"
setprop debug.sf.high_fps.late.sf.duration "$late_sf"
setprop debug.sf.high_fps.hwc.min.duration "$min_hwc"
setprop debug.sf.high_fps_early_app_phase_offset_ns "$early_app_phase"
setprop debug.sf.high_fps_early_phase_offset_ns "$early_sf_phase"
setprop debug.sf.high_fps_early_gl_app_phase_offset_ns "$earlyGl_app_phase"
setprop debug.sf.high_fps_early_gl_phase_offset_ns "$earlyGl_phase"
setprop debug.sf.high_fps_late_app_phase_offset_ns "$late_app_phase"
setprop debug.sf.high_fps_late_sf_phase_offset_ns "$late_sf_phase"
setprop debug.sf.predict_hwc_composition_strategy true
setprop debug.sf.use_phase_offsets_as_durations true
setprop debug.sf.set_idle_timer_ms 0
} >/dev/null 2>&1
echo "[MAIN] $(date '+%H:%M:%S'): Ép tần số quét làm tươi tối đa tự động"
sleep 1
echo "[MAIN] $(date '+%H:%M:%S'): Tối ưu cảm ứng và độ trễ thao tác, giảm delay chạm trong game"
sleep 1
echo "[MAIN] $(date '+%H:%M:%S'): Vô hiệu hóa throttle nhiệt độ, đảm bảo hiệu suất ổn định"
sleep 1
echo "[MAIN] $(date '+%H:%M:%S'): Tắt animation, Doze Mode, logcat để giải phóng CPU/I/O"
sleep 1
echo "[MAIN] $(date '+%H:%M:%S'): Tăng hiệu xuất, tối ưu"
sleep 1
echo "[MAIN] $(date '+%H:%M:%S'): Bật tăng tốc GPU, ép render phần cứng, hỗ trợ chuẩn Vulkan/OpenGL"
sleep 1
echo "[MAIN] $(date '+%H:%M:%S'): Kích hoạt RAM Plus thông minh cho thiết bị RAM thấp"
sleep 1
echo "[MAIN] $(date '+%H:%M:%S'): Làm sạch file rác MIUI, thumbnails, log hệ thống – tiết kiệm bộ nhớ"
sleep 1
echo "[MAIN] $(date '+%H:%M:%S'): Áp dụng SurfaceFlinger Tweaks để giảm drop FPS & cải thiện độ mượt"
sleep 1
echo "[MAIN] $(date '+%H:%M:%S'): Tối ưu riêng cho Free Fire / Free Fire MAX – ép compile, bật performance mode"

log
sensi
tweaks
apply_properties
apply_tweaks
apply_fps
apply_vsync1
apply_vsync2
apply_vsync3
apply_ram_plus
SurfaceFlinger
echo "[WARNING] $(date '+%H:%M:%S'): All Tweaks Success"
echo " Tác dụng thực tế game: đầm Tâm, giảm rung, nhẹ tâm, tối ưu, giảm lag, tăng mượt, tăng phản hồi, cải thiện giật lag"
echo "[WARNING] $(date '+%H:%M:%S'): Vui lòng khởi động lại để có tác dụng"
cmd notification post -S bigtext -t 'SENSIXPATCHV5' 'Tag' 'DONE✅'
am start -a android.intent.action.VIEW -d https://linkbio.co/70225139W67gF >/dev/null 2>&1 &
>/dev/null 2>&1
#Powered By Long Phan!!
#Protect By Long Phan!!
#Copyright By Long Phan!!
#No Reup, Please!!
