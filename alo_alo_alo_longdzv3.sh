#!/system/bin/sh
dev=longdz
refresh_rate=$(dumpsys SurfaceFlinger | grep "refresh-rate" | awk '{printf("%d ", $3)}')
brand=$(getprop ro.product.system.brand)
hardware=$(getprop ro.hardware)
brand=$(getprop ro.product.brand)
kb_ram=$(cat /proc/meminfo | grep MemTotal | awk '{print $2}')
gb_ram=$(echo "scale=2; $kb_ram / 1048576" | bc)
sleep 0.5
echo " Đã Setup Cấu Hình Theo: ${refresh_rate}Hz"
echo "
___________                     __            
\__    ___/_  _  __ ____ _____  |  | __ ______
  |    |  \ \/ \/ // __ \__  \ |  |/ / /  ___/
  |    |   \     /\  ___/ / __ \|    <  \___ \ 
  |____|    \/\_/  \___  >____  /__|_ \/____  >
                       \/     \/     \/     \/ "
sleep 1
echo ""
echo "🛠️Project Name: V3"
echo " 🖥️Developer: $dev"
echo " 📄Status: No Root"
sleep 1
echo ""
echo " 🔥Device Information"
echo " ➤ Brand  : $dev "
echo " ➤ Status : $(if [ $(which su) ]; then echo 'Root'; else echo 'No Root'; fi) "
echo " ➤ Gpu    : $(getprop ro.hardware.egl) "
echo " ➤ Cpu    : $(getprop ro.hardware) "
echo " ➤ Hz     : $refresh_rate "
echo " Wait For Install🌪️‍ "

if [ "$refresh_rate" -eq 60 ]; then
setprop debug.sf.early.app.duration 20000000
setprop debug.sf.early.sf.duration 16666666
setprop debug.sf.earlyGl.app.duration 20000000
setprop debug.sf.earlyGl.sf.duration 16666666
setprop debug.sf.late.app.duration 16666666
setprop debug.sf.late.sf.duration  20000000
elif [ "$refresh_rate" -eq 90 ]; then
setprop debug.sf.early.app.duration 12500000
setprop debug.sf.early.sf.duration 11111111
setprop debug.sf.earlyGl.app.duration 12500000
setprop debug.sf.earlyGl.sf.duration 11111111 
setprop debug.sf.late.app.duration 11111111
setprop debug.sf.late.sf.duration  12500000
elif [ "$refresh_rate" -eq 120 ]; then
setprop debug.sf.early.app.duration 10500000
setprop debug.sf.early.sf.duration 8333333
setprop debug.sf.earlyGl.app.duration 10500000
setprop debug.sf.earlyGl.sf.duration 8333333
setprop debug.sf.late.app.duration 8333333
setprop debug.sf.late.sf.duration  10500000
else
    echo "Tần số quét không xác định hoặc khác 60/90/120"
fi
settings put system peak_refresh_rate "$refresh_rate"
settings put system max_refresh_rate "$refresh_rate"
settings put system min_refresh_rate "$refresh_rate"
settings put system miui_refresh_rate "$refresh_rate"
settings put system user_refresh_rate "$refresh_rate"
settings put system fps_limit "$refresh_rate"
settings put system thermal_limit_refresh_rate "$refresh_rate"
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
settings put secure thermal_limit_refresh_rate "$refresh_rate"
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
        "log.tag.AF::MmapTrack S"
        "log.tag.AF::OutputTrack S"
        "log.tag.AF::PatchRecord S"
        "log.tag.AF::PatchTrack S"
        "log.tag.AF::RecordHandle S"
        "log.tag.AF::RecordTrack S"
        "log.tag.AF::Track S"
        "log.tag.AF::TrackBase S"
        "log.tag.AF::TrackHandle S"
        "log.tag.APM-KpiMonitor S"
        "log.tag.APM-ServiceJ S"
        "log.tag.APM-SessionJ S"
        "log.tag.APM-SessionN S"
        "log.tag.APM-Subscriber S"
        "log.tag.APM::AudioCollections S"
        "log.tag.APM::AudioInputDescriptor S"
        "log.tag.APM::AudioOutputDescriptor S"
        "log.tag.APM::AudioPatch S"
        "log.tag.APM::AudioPolicyEngine S"
        "log.tag.APM::AudioPolicyEngine::Base S"
        "log.tag.APM::AudioPolicyEngine::Config S"
        "log.tag.APM::AudioPolicyEngine::ProductStrategy S"
        "log.tag.APM::AudioPolicyEngine::VolumeGroup S"
        "log.tag.APM::Devices S"
        "log.tag.APM::IOProfile S"
        "log.tag.APM::Serializer S"
        "log.tag.APM::VolumeCurve S"
        "log.tag.APM_AudioPolicyManager S"
        "log.tag.APM_ClientDescriptor S"
        "log.tag.AT S"
        "log.tag.AccountManager S"
        "log.tag.ActivityManager S"
        "log.tag.ActivityManagerService S"
        "log.tag.ActivityTaskManager S"
        "log.tag.ActivityTaskManagerService S"
        "log.tag.AdnRecord S"
        "log.tag.AdnRecordCache S"
        "log.tag.AdnRecordLoader S"
        "log.tag.AirplaneHandler S"
        "log.tag.AlarmManager S"
        "log.tag.AlarmManagerService S"
        "log.tag.AndroidRuntime S"
        "log.tag.AppOps S"
        "log.tag.AudioAttributes S"
        "log.tag.AudioEffect S"
        "log.tag.AudioFlinger S"
        "log.tag.AudioFlinger::DeviceEffectProxy S"
        "log.tag.AudioFlinger::DeviceEffectProxy::ProxyCallback S"
        "log.tag.AudioFlinger::EffectBase S"
        "log.tag.AudioFlinger::EffectChain S"
        "log.tag.AudioFlinger::EffectHandle S"
        "log.tag.AudioFlinger::EffectModule S"
        "log.tag.AudioFlinger_Threads S"
        "log.tag.AudioHwDevice S"
        "log.tag.AudioManager S"
        "log.tag.AudioPolicy S"
        "log.tag.AudioPolicyEffects S"
        "log.tag.AudioPolicyIntefaceImpl S"
        "log.tag.AudioPolicyManager S"
        "log.tag.AudioPolicyService S"
        "log.tag.AudioProductStrategy S"
        "log.tag.AudioRecord S"
        "log.tag.AudioService S"
        "log.tag.AudioSystem S"
        "log.tag.AudioTrack S"
        "log.tag.AudioTrackShared S"
        "log.tag.AudioVolumeGroup S"
        "log.tag.BackupManager S"
        "log.tag.BatteryManager S"
        "log.tag.BatteryStatsService S"
        "log.tag.BluetoothAdapter S"
        "log.tag.BluetoothDevice S"
        "log.tag.BluetoothGattService S"
        "log.tag.BluetoothHidService S"
        "log.tag.BluetoothManager S"
        "log.tag.BluetoothMapService S"
        "log.tag.BluetoothPanService S"
        "log.tag.BluetoothPbapService S"
        "log.tag.BluetoothSapService S"
        "log.tag.BluetoothService S"
        "log.tag.BluetoothSocket S"
        "log.tag.BufferQueueDump S"
        "log.tag.BufferQueueProducer S"
        "log.tag.C2K_AT S"
        "log.tag.C2K_ATConfig S"
        "log.tag.C2K_RILC S"
        "log.tag.CAM2PORT_ S"
        "log.tag.CapaSwitch S"
        "log.tag.CarrierExpressServiceImpl S"
        "log.tag.CarrierExpressServiceImplExt S"
        "log.tag.ClipboardManager S"
        "log.tag.ConnectivityManager S"
        "log.tag.ConnectivityService S"
        "log.tag.ConsumerIrService S"
        "log.tag.ContentManager S"
        "log.tag.CountryDetector S"
        "log.tag.DMC-ApmService S"
        "log.tag.DMC-Core S"
        "log.tag.DMC-DmcService S"
        "log.tag.DMC-EventsSubscriber S"
        "log.tag.DMC-ReqQManager S"
        "log.tag.DMC-SessionManager S"
        "log.tag.DMC-TranslatorLoader S"
        "log.tag.DMC-TranslatorUtils S"
        "log.tag.DSSelector S"
        "log.tag.DSSelectorOP01 S"
        "log.tag.DSSelectorOP02 S"
        "log.tag.DSSelectorOP09 S"
        "log.tag.DSSelectorOP18 S"
        "log.tag.DSSelectorOm S"
        "log.tag.DSSelectorUtil S"
        "log.tag.DataDispatcher S"
        "log.tag.DeviceIdleController S"
        "log.tag.DevicePolicyManager S"
        "log.tag.DevicePolicyManagerService S"
        "log.tag.DisplayManager S"
        "log.tag.DisplayManagerService S"
        "log.tag.DockObserver S"
        "log.tag.DownloadManager S"
        "log.tag.ExternalSimMgr S"
        "log.tag.FastCapture S"
        "log.tag.FastMixer S"
        "log.tag.FastMixerState S"
        "log.tag.FastThread S"
        "log.tag.FragmentManager S"
        "log.tag.FuseDaemon S"
        "log.tag.GAv4 S"
        "log.tag.GraphicsStats S"
        "log.tag.GsmCallTkrHlpr S"
        "log.tag.GsmCdmaConn S"
        "log.tag.GsmCdmaPhone S"
        "log.tag.HardwarePropertiesManager S"
        "log.tag.HardwareService S"
        "log.tag.IAudioFlinger S"
        "log.tag.IMSRILRequest S"
        "log.tag.IMS_RILA S"
        "log.tag.IccCardProxy S"
        "log.tag.IccPhoneBookIM S"
        "log.tag.IccProvider S"
        "log.tag.ImsApp S"
        "log.tag.ImsBaseCommands S"
        "log.tag.ImsCall S"
        "log.tag.ImsCallProfile S"
        "log.tag.ImsCallSession S"
        "log.tag.ImsEcbm S"
        "log.tag.ImsEcbmProxy S"
        "log.tag.ImsManager S"
        "log.tag.ImsPhone S"
        "log.tag.ImsPhoneBase S"
        "log.tag.ImsPhoneCall S"
        "log.tag.ImsService S"
        "log.tag.ImsVTProvider S"
        "log.tag.InputDispatcher S"
        "log.tag.InputManager S"
        "log.tag.InputManagerService S"
        "log.tag.InputMethodManager S"
        "log.tag.InputMethodManagerService S"
        "log.tag.InterfaceManager S"
        "log.tag.IsimFileHandler S"
        "log.tag.IsimRecords S"
        "log.tag.JobScheduler S"
        "log.tag.KeyguardManager S"
        "log.tag.LCM-Subscriber S"
        "log.tag.LIBC2K_RIL S"
        "log.tag.LocationManager S"
        "log.tag.LocationManagerService S"
        "log.tag.LocationProvider S"
        "log.tag.MAPI-CommandProcessor S"
        "log.tag.MAPI-MdiRedirector S"
        "log.tag.MAPI-MdiRedirectorCtrl S"
        "log.tag.MAPI-NetworkSocketConnection S"
        "log.tag.MAPI-SocketConnection S"
        "log.tag.MAPI-SocketListener S"
        "log.tag.MAPI-TranslatorManager S"
        "log.tag.MDM-Subscriber S"
        "log.tag.MTKSST S"
        "log.tag.MTK_APPList S"
        "log.tag.MediaPlayer S"
        "log.tag.MediaPlayerService S"
        "log.tag.MediaRouter S"
        "log.tag.MediaSession S"
        "log.tag.MipcEventHandler S"
        "log.tag.MountService S"
        "log.tag.MtkAdnRecord S"
        "log.tag.MtkCsimFH S"
        "log.tag.MtkEmbmsAdaptor S"
        "log.tag.MtkFactory S"
        "log.tag.MtkGsmCdmaConn S"
        "log.tag.MtkIccCardProxy S"
        "log.tag.MtkIccPHBIM S"
        "log.tag.MtkIccProvider S"
        "log.tag.MtkIccSmsInterfaceManager S"
        "log.tag.MtkImsManager S"
        "log.tag.MtkImsService S"
        "log.tag.MtkIsimFH S"
        "log.tag.MtkPhoneNotifr S"
        "log.tag.MtkPhoneNumberUtils S"
        "log.tag.MtkPhoneSwitcher S"
        "log.tag.MtkRecordLoader S"
        "log.tag.MtkRuimFH S"
        "log.tag.MtkSIMFH S"
        "log.tag.MtkSIMRecords S"
        "log.tag.MtkSmsCbHeader S"
        "log.tag.MtkSmsManager S"
        "log.tag.MtkSmsMessage S"
        "log.tag.MtkSpnOverride S"
        "log.tag.MtkSubCtrl S"
        "log.tag.MtkTelephonyManagerEx S"
        "log.tag.MtkUiccCard S"
        "log.tag.MtkUiccCardApp S"
        "log.tag.MtkUiccCtrl S"
        "log.tag.MtkUsimFH S"
        "log.tag.MtkUsimPhoneBookManager S"
        "log.tag.MwiRIL S"
        "log.tag.NetAgentService S"
        "log.tag.NetAgent_IO S"
        "log.tag.NetLnkEventHdlr S"
        "log.tag.NetworkManagement S"
        "log.tag.NetworkManagementService S"
        "log.tag.NetworkPolicy S"
        "log.tag.NetworkPolicyManagerService S"
        "log.tag.NetworkStats S"
        "log.tag.NetworkTimeUpdateService S"
        "log.tag.NotificationManager S"
        "log.tag.NotificationManagerService S"
        "log.tag.OperatorUtils S"
        "log.tag.PKM-Lib S"
        "log.tag.PKM-MDM S"
        "log.tag.PKM-Monitor S"
        "log.tag.PKM-SA S"
        "log.tag.PKM-Service S"
        "log.tag.PQ_DS S"
        "log.tag.PackageInstaller S"
        "log.tag.PackageManager S"
        "log.tag.PersistentDataBlockManager S"
        "log.tag.Phone S"
        "log.tag.PhoneConfigurationSettings S"
        "log.tag.PhoneFactory S"
        "log.tag.PowerHalAddressUitls S"
        "log.tag.PowerHalMgrImpl S"
        "log.tag.PowerHalMgrServiceImpl S"
        "log.tag.PowerHalWifiMonitor S"
        "log.tag.PowerManager S"
        "log.tag.PowerManagerService S"
        "log.tag.PrintManager S"
        "log.tag.ProcessStats S"
        "log.tag.ProxyController S"
        "log.tag.RFX S"
        "log.tag.RIL S"
        "log.tag.RIL-Fusion S"
        "log.tag.RIL-Netlink S"
        "log.tag.RIL-Parcel S"
        "log.tag.RIL-SocListen S"
        "log.tag.RIL-Socket S"
        "log.tag.RILC S"
        "log.tag.RILC-OP S"
        "log.tag.RILD S"
        "log.tag.RILMD2-SS S"
        "log.tag.RIL_UIM_SOCKET S"
        "log.tag.RadioManager S"
        "log.tag.RfxAction S"
        "log.tag.RfxBaseHandler S"
        "log.tag.RfxChannelMgr S"
        "log.tag.RfxCloneMgr S"
        "log.tag.RfxContFactory S"
        "log.tag.RfxController S"
        "log.tag.RfxDebugInfo S"
        "log.tag.RfxDisThread S"
        "log.tag.RfxFragEnc S"
        "log.tag.RfxHandlerMgr S"
        "log.tag.RfxIdToMsgId S"
        "log.tag.RfxIdToStr S"
        "log.tag.RfxMainThread S"
        "log.tag.RfxMclDisThread S"
        "log.tag.RfxMclMessenger S"
        "log.tag.RfxMclStatusMgr S"
        "log.tag.RfxMessage S"
        "log.tag.RfxObject S"
        "log.tag.RfxOpUtils S"
        "log.tag.RfxRilAdapter S"
        "log.tag.RfxRilUtils S"
        "log.tag.RfxRoot S"
        "log.tag.RfxStatusMgr S"
        "log.tag.RfxTimer S"
        "log.tag.RilClient S"
        "log.tag.RilOemClient S"
        "log.tag.RilOpProxy S"
        "log.tag.RmmCapa S"
        "log.tag.RmmCommSimOpReq S"
        "log.tag.RmmDcEvent S"
        "log.tag.RmmDcPdnManager S"
        "log.tag.RmmDcUrcHandler S"
        "log.tag.RmmDcUtility S"
        "log.tag.RmmEccNumberReqHdlr S"
        "log.tag.RmmEccNumberUrcHandler S"
        "log.tag.RmmEmbmsReq S"
        "log.tag.RmmEmbmsUrc S"
        "log.tag.RmmImsCtlReqHdl S"
        "log.tag.RmmImsCtlUrcHdl S"
        "log.tag.RmmMwi S"
        "log.tag.RmmNwAsyncHdlr S"
        "log.tag.RmmNwHdlr S"
        "log.tag.RmmNwNrtReqHdlr S"
        "log.tag.RmmNwRTReqHdlr S"
        "log.tag.RmmNwRatSwHdlr S"
        "log.tag.RmmNwReqHdlr S"
        "log.tag.RmmNwUrcHdlr S"
        "log.tag.RmmOemHandler S"
        "log.tag.RmmOpRadioReq S"
        "log.tag.RmmPhbReq S"
        "log.tag.RmmPhbUrc S"
        "log.tag.RmmRadioReq S"
        "log.tag.RmmSimBaseHandler S"
        "log.tag.RmmSimCommReq S"
        "log.tag.RmmSimCommUrc S"
        "log.tag.RmmWp S"
        "log.tag.RtmCapa S"
        "log.tag.RtmCommSimCtrl S"
        "log.tag.RtmDC S"
        "log.tag.RtmEccNumberController S"
        "log.tag.RtmEmbmsAt S"
        "log.tag.RtmEmbmsUtil S"
        "log.tag.RtmIms S"
        "log.tag.RtmImsConference S"
        "log.tag.RtmImsConfigController S"
        "log.tag.RtmImsDialog S"
        "log.tag.RtmModeCont S"
        "log.tag.RtmMwi S"
        "log.tag.RtmNwCtrl S"
        "log.tag.RtmPhb S"
        "log.tag.RtmRadioConfig S"
        "log.tag.RtmRadioCont S"
        "log.tag.RtmWp S"
        "log.tag.SIMRecords S"
        "log.tag.SQLiteQueryBuilder S"
        "log.tag.SensorManager S"
        "log.tag.ServiceManager S"
        "log.tag.SimSwitchOP01 S"
        "log.tag.SimSwitchOP02 S"
        "log.tag.SimSwitchOP18 S"
        "log.tag.SlotQueueEntry S"
        "log.tag.SpnOverride S"
        "log.tag.StatusBarManagerService S"
        "log.tag.StorageManager S"
        "log.tag.SurfaceFlinger S"
        "log.tag.SystemServer S"
        "log.tag.Telecom S"
        "log.tag.TelephonyManager S"
        "log.tag.TelephonyRegistry S"
        "log.tag.ThermalManager S"
        "log.tag.ToneGenerator S"
        "log.tag.UiccCard S"
        "log.tag.UiccController S"
        "log.tag.UsbHostManager S"
        "log.tag.UsbManager S"
        "log.tag.UxUtility S"
        "log.tag.VT S"
        "log.tag.VibratorService S"
        "log.tag.VpnManager S"
        "log.tag.VsimAdaptor S"
        "log.tag.WORLDMODE S"
        "log.tag.WallpaperManager S"
        "log.tag.WfoApp S"
        "log.tag.WifiManager S"
        "log.tag.WindowManager S"
        "log.tag.WindowManagerService S"
        "log.tag.WpfaCcciDataHeaderEncoder S"
        "log.tag.WpfaCcciReader S"
        "log.tag.WpfaCcciSender S"
        "log.tag.WpfaControlMsgHandler S"
        "log.tag.WpfaDriver S"
        "log.tag.WpfaDriverAccept S"
        "log.tag.WpfaDriverAdapter S"
        "log.tag.WpfaDriverDeReg S"
        "log.tag.WpfaDriverMessage S"
        "log.tag.WpfaDriverRegFilter S"
        "log.tag.WpfaDriverULIpPkt S"
        "log.tag.WpfaDriverUtilis S"
        "log.tag.WpfaDriverVersion S"
        "log.tag.WpfaFilterRuleReqHandler S"
        "log.tag.WpfaParsing S"
        "log.tag.WpfaRingBuffer S"
        "log.tag.WpfaRuleContainer S"
        "log.tag.WpfaRuleRegister S"
        "log.tag.WpfaShmAccessController S"
        "log.tag.WpfaShmReadMsgHandler S"
        "log.tag.WpfaShmSynchronizer S"
        "log.tag.WpfaShmWriteMsgHandler S"
        "log.tag.brevent.event S"
        "log.tag.libPowerHal S"
        "log.tag.libfuse S"
        "log.tag.mipc_lib S"
        "log.tag.mtkpower@impl S"
        "log.tag.mtkpower_client S"
        "log.tag.trm_lib S"
        "log.tag.wpfa_iptable_android S"
        "log.tag.Networklogger S"
        "log.tag.AudioFlinger::DeviceEffectProxy S"
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
        "game-touchscreen-boost 1"
        "touch_boost 1"
        "ram_boost 1"
        "cpu_boost 1"
        "gpu_boost 1"
        "ui.hw 1"
        "touch_delay 0"
    )
    secure=(
        "long_press_timeout 500"
        "multi_press_timeout 500"
        "speed_mode 1"
        "speed_mode_enable 1"
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
    setprop=(
        "debug.sf.hw 1"
        "debug.als.logs 0"
        "debug.atrace.tags.enableflags 0"
        "debug.egl.profiler 0"
        "debug.enable.wl_log 0"
        "debug.sf.enable_hwc_vds 0"
        "debug.sf.ddms 0"
        "ro.kernel.android.checkjni 0"
        "debug.crash.logcat 0"
        "debug.renderengine.graphite true"
        "debug.sf.dump 0"
        "debug.fps.boost.enable true"
        "debug.hwui.skia_atrace_enabled 0"
        "debug.app.performance_restricted false"
        "debug.hwui_force_gpu_rendering 1"
        "debug.sf.multithreaded_present true"
        "debug.gpu.use_low_latency_mode true"
        "debug.gpu.memory_tracking false"
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
        "debug.sf.swapinterval 1"
        "debug.hwc.otf 0"
        "ro.config.nocheckin 1"
        "debug.hwc_dump_en 0"
        "debug.hwui.disable_vsync 0"
        "debug.egl.hw 1" 
        "debug.mdlogger.Running 0"
        "debug.egl.force_dmsaa 0"
        "debug.sf.showupdates 0"
        "debug.sf.showfps 0"
        "debug.sf.showcpu 0"
        "debug.hwui.overdraw false"
        "debug.sf.enable_adpf_cpu_hint true"        
        "debug.overlayui.enable 0"
        "debug.hwui.use_hint_manager 1"
        "debug.sf.showbackground 0"
        "debug.sf.shoupdates 0"
        "debug.composition.type gpu"
        "debug.egl.swapinterval 1"
        "debug.gpu.renderer skiagl"
        "debug.hwui.renderer skiagl"
        "debug.hwui.use_threaded_renderer true"
        "debug.hwc.logvsync 0"
        "debug.sf.gpuoverlay 0"
        "debug.sf.sa_enable 1"
        "debug.qc.hardware 1"
        "debug.sqlite.journalmode WAL"
        "debug.sf.sa_log 1"
        "debug.hwc.asyncdisp 1"
        "debug.power.loghint 0"
        "debug.force-opengl 1"
        "debug.hwui.fps_divisor 1"
        "debugtool.anrhistory 0"
        "debug.hwc.force_gpu_vsync 1"
        "debug.sf.gpu_comp_tiling 1"
        "windowsmgr.max_events_per_sec 90"
        "ro.min_pointer_dur 8"
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
        "debug_app 0"
    )
    optimal=(
        "dalvik.vm.dexopt-flags m=y,v=n,o=v,u=n"
        "dalvik.vm.checkjni 0"
        "dalvik.vm.dex2oat-minidebuginfo false"
        "dalvik.vm.minidebuginfo false"
    )
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

if [ "$brand" != "Xiaomi" ] && ( [ "$brand" = "Samsung" ] || [ "$brand" = "vivo" ] || [ "$brand" = "OPPO" ] ); then
setprop debug.sf.enable_advanced_sf_phase_offset 0
settings put global device_idle_constants inactive_to=25000,sensing_to=0,locating_to=0,location_accuracy=20.0,motion_inactive_to=0,idle_after_inactive_to=0,idle_pending_to=60000,max_idle_pending_to=120000,idle_pending_factor=2.0,idle_to=900000,max_idle_to=21600000,idle_factor=2.0,min_time_to_alarm=600000,max_temp_app_whitelist_duration=10000,mms_temp_app_whitelist_duration=10000,sms_temp_app_whitelist_duration=10000,light_after_inactive_to=5000,light_pre_idle_to=60000,light_idle_to=180000,light_idle_factor=2.0,light_max_idle_to=240000,light_idle_maintenance_min_budget=60000,light_idle_maintenance_max_budget=180000,min_light_maintenance_time=5000,min_deep_maintenance_time=30000,notification_whitelist_duration=30000
fi

device_config put game_overlay com.dts.freefireth mode=2,"$renderer"=true,fps="$refresh_rate",downscaleFactor=0.3,vsync=false
device_config put game_overlay com.dts.freefiremax mode=2,"$renderer"=true,fps="$refresh_rate",downscaleFactor=0.3,vsync=false
#gms doze disable
dumpsys deviceidle disable
#sf
setprop debug.hwui.renderer "$renderer"
setprop debug.renderengine.backend skiagputhreaded 
setprop debug.composition.7x27A.type gpu
setprop debug.composition.7x25A.type gpu
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
cmd game mode performace com.dts.freefireth
cmd game mode performace com.dts.freefiremax
#disable gos, game booster and joyose
pm uninstall --user 0 com.xiaomi.joyose
pm uninstall --user 0 com.samsung.android.game.gos
pm uninstall --user 0 com.samsung.android.game.gametools
pm uninstall --user 0 com.samsung.android.game.gamehome
#speed
pm trim-caches 9999GB
am kill-all
am compact system
#clean logcat 
logcat -c


}> /dev/null 2>&1

echo "[INFO] $(date '+%H:%M:%S'): Sensitivity VIP"
sleep 1
echo "[INFO] $(date '+%H:%M:%S'): Fix Delay VIP "
sleep 1
echo "[INFO] $(date '+%H:%M:%S'): ON Fix Lag "
sleep 1
echo "[INFO] $(date '+%H:%M:%S'): Optimized Touch "
sleep 1
echo "[INFO] $(date '+%H:%M:%S'): Disable LOG "
sleep 1
echo "[INFO] $(date '+%H:%M:%S'): Disable Vsync VIP "
sleep 1
echo "[INFO] $(date '+%H:%M:%S'): OFF Animation "
sleep 1
echo "[INFO] $(date '+%H:%M:%S'): Force Stop Anti-aliasing  "
sleep 1
echo "[INFO] $(date '+%H:%M:%S'): Hight Performance VIP "
sleep 1
echo "[INFO] $(date '+%H:%M:%S'): Boost CPU/GPU VIP  "
sleep 1
echo "[INFO] $(date '+%H:%M:%S'): Smooth VIP "
sleep 1
echo "[INFO] $(date '+%H:%M:%S'): Speed Up System and games "
sleep 1
echo "[INFO] $(date '+%H:%M:%S'): Reduce Resolution VIP "
sleep 1
echo "[INFO] $(date '+%H:%M:%S'): ON Gamming Mode "
sleep 1
echo "[INFO] $(date '+%H:%M:%S'): Clean Files VIP "
sleep 1
echo "[INFO] $(date '+%H:%M:%S'): ON Doze Mode VIP  "
sleep 1
echo "[INFO] $(date '+%H:%M:%S'): High Fps VIP "
sleep 1
echo "[INFO] $(date '+%H:%M:%S'): Increase Fps "
sleep 1
echo "[INFO] $(date '+%H:%M:%S'): Disable Lock FPS"
sleep 1
echo "[INFO] $(date '+%H:%M:%S'): OFF Logcat VIP "
sleep 1
echo "[INFO] $(date '+%H:%M:%S'): ON RENDER if sp "
sleep 1
echo "[INFO] $(date '+%H:%M:%S'): Fix Drop Fps "
sleep 1
echo "[INFO] $(date '+%H:%M:%S'): RAM VIP FOR 2/3/4GB"
sleep 1
echo "[INFO] $(date '+%H:%M:%S'): Opengl Lite "
sleep 1
echo "[INFO] $(date '+%H:%M:%S'): GMS Doze Disable "

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

echo "[WARNING] $(date '+%H:%M:%S'): All Tweaks Success"
echo "[WARNING] $(date '+%H:%M:%S'): Vui lòng khởi động lại để có tác dụng"
echo "[WARNING] $(date '+%H:%M:%S'): Modules V3 Đã Chạy Thành Công" >> /sdcard/log.txt
cmd notification post -S bigtext -t '[WARNNING]: Vui lòng khởi động lại để có tác dụng ' 'Tag' 'Thanks'
