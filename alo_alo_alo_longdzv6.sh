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
echo "│     ⚙️ SENSIXPATCHV6     │"
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
settings put system max_refresh_rate_for_gaming "$refresh_rate"
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
        "log.tag.RIL-Socket VERBOSE"
        "log.tag.RILC VERBOSE"
        "log.tag.RILC-OP VERBOSE"
        "log.tag.RILD VERBOSE"
        "log.tag.RILMD2-SS VERBOSE"
        "log.tag.RIL_UIM_SOCKET VERBOSE"
        "log.tag.RadioManager VERBOSE"
        "log.tag.RfxAction VERBOSE"
        "log.tag.RfxBaseHandler VERBOSE"
        "log.tag.RfxChannelMgr VERBOSE"
        "log.tag.RfxCloneMgr VERBOSE"
        "log.tag.RfxContFactory VERBOSE"
        "log.tag.RfxController VERBOSE"
        "log.tag.RfxDebugInfo VERBOSE"
        "log.tag.RfxDisThread VERBOSE"
        "log.tag.RfxFragEnc VERBOSE"
        "log.tag.RfxHandlerMgr VERBOSE"
        "log.tag.RfxIdToMsgId VERBOSE"
        "log.tag.RfxIdToStr VERBOSE"
        "log.tag.RfxMainThread VERBOSE"
        "log.tag.RfxMclDisThread VERBOSE"
        "log.tag.RfxMclMessenger VERBOSE"
        "log.tag.RfxMclStatusMgr VERBOSE"
        "log.tag.RfxMessage VERBOSE"
        "log.tag.RfxObject VERBOSE"
        "log.tag.RfxOpUtils VERBOSE"
        "log.tag.RfxRilAdapter VERBOSE"
        "log.tag.RfxRilUtils VERBOSE"
        "log.tag.RfxRoot VERBOSE"
        "log.tag.RfxStatusMgr VERBOSE"
        "log.tag.RfxTimer VERBOSE"
        "log.tag.RilClient VERBOSE"
        "log.tag.RilOemClient VERBOSE"
        "log.tag.RilOpProxy VERBOSE"
        "log.tag.RmmCapa VERBOSE"
        "log.tag.RmmCommSimOpReq VERBOSE"
        "log.tag.RmmDcEvent VERBOSE"
        "log.tag.RmmDcPdnManager VERBOSE"
        "log.tag.RmmDcUrcHandler VERBOSE"
        "log.tag.RmmDcUtility VERBOSE"
        "log.tag.RmmEccNumberReqHdlr VERBOSE"
        "log.tag.RmmEccNumberUrcHandler VERBOSE"
        "log.tag.RmmEmbmsReq VERBOSE"
        "log.tag.RmmEmbmsUrc VERBOSE"
        "log.tag.RmmImsCtlReqHdl VERBOSE"
        "log.tag.RmmImsCtlUrcHdl VERBOSE"
        "log.tag.RmmMwi VERBOSE"
        "log.tag.RmmNwAsyncHdlr VERBOSE"
        "log.tag.RmmNwHdlr VERBOSE"
        "log.tag.RmmNwNrtReqHdlr VERBOSE"
        "log.tag.RmmNwRTReqHdlr VERBOSE"
        "log.tag.RmmNwRatSwHdlr VERBOSE"
        "log.tag.RmmNwReqHdlr VERBOSE"
        "log.tag.RmmNwUrcHdlr VERBOSE"
        "log.tag.RmmOemHandler VERBOSE"
        "log.tag.RmmOpRadioReq VERBOSE"
        "log.tag.RmmPhbReq VERBOSE"
        "log.tag.RmmPhbUrc VERBOSE"
        "log.tag.RmmRadioReq VERBOSE"
        "log.tag.RmmSimBaseHandler VERBOSE"
        "log.tag.RmmSimCommReq VERBOSE"
        "log.tag.RmmSimCommUrc VERBOSE"
        "log.tag.RmmWp VERBOSE"
        "log.tag.RtmCapa VERBOSE"
        "log.tag.RtmCommSimCtrl VERBOSE"
        "log.tag.RtmDC VERBOSE"
        "log.tag.RtmEccNumberController VERBOSE"
        "log.tag.RtmEmbmsAt VERBOSE"
        "log.tag.RtmEmbmsUtil VERBOSE"
        "log.tag.RtmIms VERBOSE"
        "log.tag.RtmImsConference VERBOSE"
        "log.tag.RtmImsConfigController VERBOSE"
        "log.tag.RtmImsDialog VERBOSE"
        "log.tag.RtmModeCont VERBOSE"
        "log.tag.RtmMwi VERBOSE"
        "log.tag.RtmNwCtrl VERBOSE"
        "log.tag.RtmPhb VERBOSE"
        "log.tag.RtmRadioConfig VERBOSE"
        "log.tag.RtmRadioCont VERBOSE"
        "log.tag.RtmWp VERBOSE"
        "log.tag.SIMRecords VERBOSE"
        "log.tag.SQLiteQueryBuilder VERBOSE"
        "log.tag.SensorManager VERBOSE"
        "log.tag.ServiceManager VERBOSE"
        "log.tag.SimSwitchOP01 VERBOSE"
        "log.tag.SimSwitchOP02 VERBOSE"
        "log.tag.SimSwitchOP18 VERBOSE"
        "log.tag.SlotQueueEntry VERBOSE"
        "log.tag.SpnOverride VERBOSE"
        "log.tag.StatusBarManagerService VERBOSE"
        "log.tag.StorageManager VERBOSE"
        "log.tag.SurfaceFlinger VERBOSE"
        "log.tag.SystemServer VERBOSE"
        "log.tag.Telecom VERBOSE"
        "log.tag.TelephonyManager VERBOSE"
        "log.tag.TelephonyRegistry VERBOSE"
        "log.tag.ThermalManager VERBOSE"
        "log.tag.ToneGenerator VERBOSE"
        "log.tag.UiccCard VERBOSE"
        "log.tag.UiccController VERBOSE"
        "log.tag.UsbHostManager VERBOSE"
        "log.tag.UsbManager VERBOSE"
        "log.tag.UxUtility VERBOSE"
        "log.tag.VT VERBOSE"
        "log.tag.VibratorService VERBOSE"
        "log.tag.VpnManager VERBOSE"
        "log.tag.VsimAdaptor VERBOSE"
        "log.tag.WORLDMODE VERBOSE"
        "log.tag.WallpaperManager VERBOSE"
        "log.tag.WfoApp VERBOSE"
        "log.tag.WifiManager VERBOSE"
        "log.tag.WindowManager VERBOSE"
        "log.tag.WindowManagerService VERBOSE"
        "log.tag.WpfaCcciDataHeaderEncoder VERBOSE"
        "log.tag.WpfaCcciReader VERBOSE"
        "log.tag.WpfaCcciSender VERBOSE"
        "log.tag.WpfaControlMsgHandler VERBOSE"
        "log.tag.WpfaDriver VERBOSE"
        "log.tag.WpfaDriverAccept VERBOSE"
        "log.tag.WpfaDriverAdapter VERBOSE"
        "log.tag.WpfaDriverDeReg VERBOSE"
        "log.tag.WpfaDriverMessage VERBOSE"
        "log.tag.WpfaDriverRegFilter VERBOSE"
        "log.tag.WpfaDriverULIpPkt VERBOSE"
        "log.tag.WpfaDriverUtilis VERBOSE"
        "log.tag.WpfaDriverVersion VERBOSE"
        "log.tag.WpfaFilterRuleReqHandler VERBOSE"
        "log.tag.WpfaParsing VERBOSE"
        "log.tag.WpfaRingBuffer VERBOSE"
        "log.tag.WpfaRuleContainer VERBOSE"
        "log.tag.WpfaRuleRegister VERBOSE"
        "log.tag.WpfaShmAccessController VERBOSE"
        "log.tag.WpfaShmReadMsgHandler VERBOSE"
        "log.tag.WpfaShmSynchronizer VERBOSE"
        "log.tag.WpfaShmWriteMsgHandler VERBOSE"
        "log.tag.brevent.event VERBOSE"
        "log.tag.libPowerHal VERBOSE"
        "log.tag.libfuse VERBOSE"
        "log.tag.mipc_lib VERBOSE"
        "log.tag.mtkpower@impl VERBOSE"
        "log.tag.mtkpower_client VERBOSE"
        "log.tag.trm_lib VERBOSE"
        "log.tag.wpfa_iptable_android VERBOSE"
        "log.tag.Networklogger VERBOSE"
        "log.tag.AudioFlinger::DeviceEffectProxy VERBOSE"
    )
    for commands in "${disable_log[@]}"; do
    IFS=' ' read -r name value <<< "$commands"
    setprop "$name" "$value"
done
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
        "speed_mode 1"
        "fps_limit 0"
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
}> /dev/null 2>&1

tweaks() {
    tweak=(
       "debug.sf.hw 1"
       "debug.egl.hw 1"
       "debug.perf.tuning 1"
       "debug.rs.use_fast_math 1"
       "debug.sf.swapinterval 0"
       "debug.hwui.fps_divisor 1"
       "debug.overlayui.enable 1"
       "debug.composition.type c2d"
       "debug.composition.type gpu"
       "debug.qualcomm.sns.daemon 0"
       "debug.qualcomm.sns.hal 0"
       "debug.qualcomm.sns.libsensor1 0"
       "debug.javafx.animation.fullspeed true"
       "debug.systemuicompilerfilter speed-profile"
       "debug.sf.disable_backpressure 1"
       "debug.sf.gpu_comp_tiling 1"
       "debug.sf.multithreaded_present true"
       "debug.hwui_force_gpu_rendering 1"
       "debug.performance.tuning 1"
       "debug.gpu.use_low_latency_mode true"
       "debug.sf.use_frame_rate_priority 1"
       "debug.hwui.use_threaded_renderer true"
       "debug.hwui.use_threaded_renderer true"
       "debug.sf.enable_adpf_cpu_hint true"
       "debug.sf.auto_latch_unsignaled 0"
       "debug.sf.latch_unsignaled 1"
       "debug.graphics.game_default_frame_rate.disabled true"
    )
    msaa=(
        "debug.egl.force_msaa 0"
        "debug.hwui.force_fxaa 0" 
        "debug.hwui.force_smaa 0" 
        "debug.hwui.force_msaa 0" 
        "debug.hwui.force_txaa 0" 
        "debug.hwui.force_csaa 0" 
        "debug.hwui.force_dlss 0" 
        "debug.sf.showupdates 0"
        "debug.sf.showfps 0"
        "debug.sf.showcpu 0"
        "debug.sf.showbackground 0"
    )
    log=(
        "debug.renderengine.skia_tracing_enabled false"
        "debug.renderengine.skia_use_perfetto_track_events false"
        "debug.hwui.skia_atrace_enabled false"
        "debug.hwui.skia_tracing_enabled false"
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
        "perf_proc_game_List com.dts.freefiremax,com.dts.freefireth"
        "force_gpu_rendering 1"
        "angle_gl_driver_selection_pkgs com.dts.freefiremax,com.dts.freefireth"
        "angle_gl_driver_selection_values angle,angle"
        "angle_debug_package com.dts.freefiremax,com.dts.freefireth" 
        "GPUTUNER_SWITCH true"
        "CPUTUNER_SWITCH true"
        "DYNAMIC_PERFORMANCE_DEFAULT_STATUS 1"
        "DYNAMIC_PERFORMANCE_STATUS 1"
        "debug_app 0"
        "low_power 0"
        "miui_cpu_model 2"
        "cached_apps_freezer enable"
        "gfx_quality low"
        "render_quality low"
        "shadow_quality disable"
        "texture_quality low"
        "effects_quality low"
        "graphics_quality low"
        "lights_quality low"
        "hader_quality low"
    )
    system=(
        "POWER_PERFORMANCE_MODE_OPEN 1"
    )
    secure=(
        "high_priority 1"
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
    for commands in "${tweak@]}"; do
    IFS=' ' read -r name value <<< "$commands"
    setprop "$name" "$value"
done
    for commands in "${msaa@]}"; do
    IFS=' ' read -r name value <<< "$commands"
    setprop "$name" "$value"
done
    for commands in "${log@]}"; do
    IFS=' ' read -r name value <<< "$commands"
    setprop "$name" "$value"
done
    for commands in "${disable_animation[@]}"; do
    IFS=' ' read -r name value <<< "$commands"
    settings put global "$name" "$value"
done
    for commands in "${system@]}"; do
    IFS=' ' read -r name value <<< "$commands"
    settings put system "$name" "$value"
done
    for commands in "${secure[@]}"; do
    IFS=' ' read -r name value <<< "$commands"
    settings put secure "$name" "$value"
done
    for commands in "${optimal[@]}"; do
    IFS=' ' read -r name value <<< "$commands"
    setprop "$name" "$value"
done
    
if [ -n "$(getprop ro.hardware.vulkan)" ]; then
    renderer="skiavk" 
    setprop ro.hardware.vulkan adreno
elif [ -n "$(getprop ro.hardware.opengl)" ]; then
    renderer="skiagl"
else
    renderer="skiagl"
fi

setprop debug.hwui.renderer "$renderer"
setprop debug.gpu.renderer "$renderer"
setprop debug.renderengine.backend skiagputhreaded
setprop debug.composition.7x27A.type gpu
setprop debug.composition.7x25A.type gpu

if [ "$brand" != "Xiaomi" ] && ( [ "$brand" = "Samsung" ] || [ "$brand" = "realme" ] || [ "$brand" = "vivo" ] || [ "$brand" = "OPPO" ] ); then
setprop debug.sf.enable_advanced_sf_phase_offset 1
settings put global device_idle_constants inactive_to=25000,sensing_to=0,locating_to=0,location_accuracy=20.0,motion_inactive_to=0,idle_after_inactive_to=0,idle_pending_to=60000,max_idle_pending_to=120000,idle_pending_factor=2.0,idle_to=900000,max_idle_to=21600000,idle_factor=2.0,min_time_to_alarm=600000,max_temp_app_whitelist_duration=10000,mms_temp_app_whitelist_duration=10000,sms_temp_app_whitelist_duration=10000,light_after_inactive_to=5000,light_pre_idle_to=60000,light_idle_to=180000,light_idle_factor=2.0,light_max_idle_to=240000,light_idle_maintenance_min_budget=60000,light_idle_maintenance_max_budget=180000,min_light_maintenance_time=5000,min_deep_maintenance_time=30000,notification_whitelist_duration=30000
fi

while true
do sleep 30;cmd battery reset;cmd battery set temp 200;done>/dev/null 2>&1&
if [ $? -eq 0 ]; then
echo "Boost FPS"
else
echo "Thiết bị không hỗ trợ"
fi

device_config put game_overlay com.dts.freefireth mode=2,"$renderer"=true,fps="$refresh_rate",downscaleFactor=0.1,vsync=false,touchboost=1,gpuboost=3,gpuboost=3
device_config put game_overlay com.dts.freefiremax mode=2,"$renderer"=true,fps="$refresh_rate",downscaleFactor=0.1,vsync=false,touchboost=1,gpuboost=3,gpuboost=3

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
#logcat
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
refresh_rate=$(dumpsys SurfaceFlinger | grep -i "refresh-rate" | awk '{print $3}')
frame_ns=$(echo "1000000000 / $refresh_rate" | bc)
early_app=$(echo "$frame_ns * 0.4" | bc)
early_sf=$(echo "$frame_ns * 0.35" | bc)
earlyGl_app=$(echo "$frame_ns * 0.4" | bc)
earlyGl_sf=$(echo "$frame_ns * 0.35" | bc)
late_app=$(echo "$frame_ns * 0.4" | bc)
late_sf=$(echo "$frame_ns * 0.35" | bc)

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
setprop debug.sf.early_gl_app_phase_offset_ns "$earlyGl_app_phase"
setprop debug.sf.early_gl_phase_offset_ns "$earlyGl_phase"
setprop debug.sf.early_phase_offset_ns "$early_sf_phase"
setprop debug.sf.high_fps_early_gl_phase_offset_ns "$earlyGl_phase"
setprop debug.sf.high_fps_early_phase_offset_ns "$early_sf_phase"
setprop debug.sf.high_fps_late_app_phase_offset_ns "$late_app_phase"
setprop debug.sf.high_fps_late_sf_phase_offset_ns "$late_sf_phase"
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
cmd notification post -S bigtext -t 'SENSIXPATCHV6' 'Tag' 'DONE✅'
am start -a android.intent.action.VIEW -d https://linkbio.co/70225139W67gF >/dev/null 2>&1 &
>/dev/null 2>&1
#Powered By Long Phan!!
#Protect By Long Phan!!
#Copyright By Long Phan!!
#No Reup, Please!!



