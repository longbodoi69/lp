#!/system/bin/sh

dev=longdz
refresh_rate=$(dumpsys SurfaceFlinger | grep "refresh-rate" | awk '{print $3}' | tr -d ' ')
brand=$(getprop ro.product.system.brand)
hardware=$(getprop ro.hardware)
brand=$(getprop ro.product.brand)
kb_ram=$(cat /proc/meminfo | grep MemTotal | awk '{print $2}')
gb_ram=$(echo "scale=2; $kb_ram / 1048576" | bc)
sleep 0.5
echo "___________                      __            
\__    ___/_  _  __ ____ _____  |  | __  ______
  |    |  \ \/ \/ // __ \\__  \ |  |/ / /  ___/
  |    |   \     /\  ___/ / __ \|    <  \___ \ 
  |____|    \/\_/  \___  >____  /__|_ \/____  >
                       \/     \/     \/     \/ "
sleep 1
echo ""
echo "🛠️Project Name: V2"
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

settings put system peak_refresh_rate "$refresh_rate"
settings put system max_refresh_rate "$refresh_rate"
settings put system min_refresh_rate "$refresh_rate"
settings put system miui_refresh_rate "$refresh_rate"
settings put system user_refresh_rate "$refresh_rate"
settings put system fps_limit "$refresh_rate"
settings put system thermal_limit_refresh_rate "$refresh_rate"
setprop debug.javafx.animation.framerate "$refresh_rate"

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
    local value="0"
    setprop "$name" "$value"
}> /dev/null 2>&1
apply_vsync2() {
    local name="debug.sf.swapinterval"
    local value="0"
    setprop "$name" "$value"
}> /dev/null 2>&1
apply_vsync3() {
    local name="debug.gr.swapinterval"
    local value="0"
    setprop "$name" "$value"
}> /dev/null 2>&1

log() {
    disable_log=(
        "log.tag.AF::MmapTrack SUPPRESS"
        "log.tag.AF::OutputTrack SUPPRESS"
        "log.tag.AF::PatchRecord SUPPRESS"
        "log.tag.AF::PatchTrack SUPPRESS"
        "log.tag.AF::RecordHandle SUPPRESS"
        "log.tag.AF::RecordTrack SUPPRESS"
        "log.tag.AF::Track SUPPRESS"
        "log.tag.AF::TrackBase SUPPRESS"
        "log.tag.AF::TrackHandle SUPPRESS"
        "log.tag.APM-KpiMonitor SUPPRESS"
        "log.tag.APM-ServiceJ SUPPRESS"
        "log.tag.APM-SessionJ SUPPRESS"
        "log.tag.APM-SessionN SUPPRESS"
        "log.tag.APM-Subscriber SUPPRESS"
        "log.tag.APM::AudioCollections SUPPRESS"
        "log.tag.APM::AudioInputDescriptor SUPPRESS"
        "log.tag.APM::AudioOutputDescriptor SUPPRESS"
        "log.tag.APM::AudioPatch SUPPRESS"
        "log.tag.APM::AudioPolicyEngine SUPPRESS"
        "log.tag.APM::AudioPolicyEngine::Base SUPPRESS"
        "log.tag.APM::AudioPolicyEngine::Config SUPPRESS"
        "log.tag.APM::AudioPolicyEngine::ProductStrategy SUPPRESS"
        "log.tag.APM::AudioPolicyEngine::VolumeGroup SUPPRESS"
        "log.tag.APM::Devices SUPPRESS"
        "log.tag.APM::IOProfile SUPPRESS"
        "log.tag.APM::Serializer SUPPRESS"
        "log.tag.APM::VolumeCurve SUPPRESS"
        "log.tag.APM_AudioPolicyManager SUPPRESS"
        "log.tag.APM_ClientDescriptor SUPPRESS"
        "log.tag.AT SUPPRESS"
        "log.tag.AccountManager SUPPRESS"
        "log.tag.ActivityManager SUPPRESS"
        "log.tag.ActivityManagerService SUPPRESS"
        "log.tag.ActivityTaskManager SUPPRESS"
        "log.tag.ActivityTaskManagerService SUPPRESS"
        "log.tag.AdnRecord SUPPRESS"
        "log.tag.AdnRecordCache SUPPRESS"
        "log.tag.AdnRecordLoader SUPPRESS"
        "log.tag.AirplaneHandler SUPPRESS"
        "log.tag.AlarmManager SUPPRESS"
        "log.tag.AlarmManagerService SUPPRESS"
        "log.tag.AndroidRuntime SUPPRESS"
        "log.tag.AppOps SUPPRESS"
        "log.tag.AudioAttributes SUPPRESS"
        "log.tag.AudioEffect SUPPRESS"
        "log.tag.AudioFlinger SUPPRESS"
        "log.tag.AudioFlinger::DeviceEffectProxy SUPPRESS"
        "log.tag.AudioFlinger::DeviceEffectProxy::ProxyCallback SUPPRESS"
        "log.tag.AudioFlinger::EffectBase SUPPRESS"
        "log.tag.AudioFlinger::EffectChain SUPPRESS"
        "log.tag.AudioFlinger::EffectHandle SUPPRESS"
        "log.tag.AudioFlinger::EffectModule SUPPRESS"
        "log.tag.AudioFlinger_Threads SUPPRESS"
        "log.tag.AudioHwDevice SUPPRESS"
        "log.tag.AudioManager SUPPRESS"
        "log.tag.AudioPolicy SUPPRESS"
        "log.tag.AudioPolicyEffects SUPPRESS"
        "log.tag.AudioPolicyIntefaceImpl SUPPRESS"
        "log.tag.AudioPolicyManager SUPPRESS"
        "log.tag.AudioPolicyService SUPPRESS"
        "log.tag.AudioProductStrategy SUPPRESS"
        "log.tag.AudioRecord SUPPRESS"
        "log.tag.AudioService SUPPRESS"
        "log.tag.AudioSystem SUPPRESS"
        "log.tag.AudioTrack SUPPRESS"
        "log.tag.AudioTrackShared SUPPRESS"
        "log.tag.AudioVolumeGroup SUPPRESS"
        "log.tag.BackupManager SUPPRESS"
        "log.tag.BatteryManager SUPPRESS"
        "log.tag.BatteryStatsService SUPPRESS"
        "log.tag.BluetoothAdapter SUPPRESS"
        "log.tag.BluetoothDevice SUPPRESS"
        "log.tag.BluetoothGattService SUPPRESS"
        "log.tag.BluetoothHidService SUPPRESS"
        "log.tag.BluetoothManager SUPPRESS"
        "log.tag.BluetoothMapService SUPPRESS"
        "log.tag.BluetoothPanService SUPPRESS"
        "log.tag.BluetoothPbapService SUPPRESS"
        "log.tag.BluetoothSapService SUPPRESS"
        "log.tag.BluetoothService SUPPRESS"
        "log.tag.BluetoothSocket SUPPRESS"
        "log.tag.BufferQueueDump SUPPRESS"
        "log.tag.BufferQueueProducer SUPPRESS"
        "log.tag.C2K_AT SUPPRESS"
        "log.tag.C2K_ATConfig SUPPRESS"
        "log.tag.C2K_RILC SUPPRESS"
        "log.tag.CAM2PORT_ SUPPRESS"
        "log.tag.CapaSwitch SUPPRESS"
        "log.tag.CarrierExpressServiceImpl SUPPRESS"
        "log.tag.CarrierExpressServiceImplExt SUPPRESS"
        "log.tag.ClipboardManager SUPPRESS"
        "log.tag.ConnectivityManager SUPPRESS"
        "log.tag.ConnectivityService SUPPRESS"
        "log.tag.ConsumerIrService SUPPRESS"
        "log.tag.ContentManager SUPPRESS"
        "log.tag.CountryDetector SUPPRESS"
        "log.tag.DMC-ApmService SUPPRESS"
        "log.tag.DMC-Core SUPPRESS"
        "log.tag.DMC-DmcService SUPPRESS"
        "log.tag.DMC-EventsSubscriber SUPPRESS"
        "log.tag.DMC-ReqQManager SUPPRESS"
        "log.tag.DMC-SessionManager SUPPRESS"
        "log.tag.DMC-TranslatorLoader SUPPRESS"
        "log.tag.DMC-TranslatorUtils SUPPRESS"
        "log.tag.DSSelector SUPPRESS"
        "log.tag.DSSelectorOP01 SUPPRESS"
        "log.tag.DSSelectorOP02 SUPPRESS"
        "log.tag.DSSelectorOP09 SUPPRESS"
        "log.tag.DSSelectorOP18 SUPPRESS"
        "log.tag.DSSelectorOm SUPPRESS"
        "log.tag.DSSelectorUtil SUPPRESS"
        "log.tag.DataDispatcher SUPPRESS"
        "log.tag.DeviceIdleController SUPPRESS"
        "log.tag.DevicePolicyManager SUPPRESS"
        "log.tag.DevicePolicyManagerService SUPPRESS"
        "log.tag.DisplayManager SUPPRESS"
        "log.tag.DisplayManagerService SUPPRESS"
        "log.tag.DockObserver SUPPRESS"
        "log.tag.DownloadManager SUPPRESS"
        "log.tag.ExternalSimMgr SUPPRESS"
        "log.tag.FastCapture SUPPRESS"
        "log.tag.FastMixer SUPPRESS"
        "log.tag.FastMixerState SUPPRESS"
        "log.tag.FastThread SUPPRESS"
        "log.tag.FragmentManager SUPPRESS"
        "log.tag.FuseDaemon SUPPRESS"
        "log.tag.GAv4 SUPPRESS"
        "log.tag.GraphicsStats SUPPRESS"
        "log.tag.GsmCallTkrHlpr SUPPRESS"
        "log.tag.GsmCdmaConn SUPPRESS"
        "log.tag.GsmCdmaPhone SUPPRESS"
        "log.tag.HardwarePropertiesManager SUPPRESS"
        "log.tag.HardwareService SUPPRESS"
        "log.tag.IAudioFlinger SUPPRESS"
        "log.tag.IMSRILRequest SUPPRESS"
        "log.tag.IMS_RILA SUPPRESS"
        "log.tag.IccCardProxy SUPPRESS"
        "log.tag.IccPhoneBookIM SUPPRESS"
        "log.tag.IccProvider SUPPRESS"
        "log.tag.ImsApp SUPPRESS"
        "log.tag.ImsBaseCommands SUPPRESS"
        "log.tag.ImsCall SUPPRESS"
        "log.tag.ImsCallProfile SUPPRESS"
        "log.tag.ImsCallSession SUPPRESS"
        "log.tag.ImsEcbm SUPPRESS"
        "log.tag.ImsEcbmProxy SUPPRESS"
        "log.tag.ImsManager SUPPRESS"
        "log.tag.ImsPhone SUPPRESS"
        "log.tag.ImsPhoneBase SUPPRESS"
        "log.tag.ImsPhoneCall SUPPRESS"
        "log.tag.ImsService SUPPRESS"
        "log.tag.ImsVTProvider SUPPRESS"
        "log.tag.InputDispatcher SUPPRESS"
        "log.tag.InputManager SUPPRESS"
        "log.tag.InputManagerService SUPPRESS"
        "log.tag.InputMethodManager SUPPRESS"
        "log.tag.InputMethodManagerService SUPPRESS"
        "log.tag.InterfaceManager SUPPRESS"
        "log.tag.IsimFileHandler SUPPRESS"
        "log.tag.IsimRecords SUPPRESS"
        "log.tag.JobScheduler SUPPRESS"
        "log.tag.KeyguardManager SUPPRESS"
        "log.tag.LCM-Subscriber SUPPRESS"
        "log.tag.LIBC2K_RIL SUPPRESS"
        "log.tag.LocationManager SUPPRESS"
        "log.tag.LocationManagerService SUPPRESS"
        "log.tag.LocationProvider SUPPRESS"
        "log.tag.MAPI-CommandProcessor SUPPRESS"
        "log.tag.MAPI-MdiRedirector SUPPRESS"
        "log.tag.MAPI-MdiRedirectorCtrl SUPPRESS"
        "log.tag.MAPI-NetworkSocketConnection SUPPRESS"
        "log.tag.MAPI-SocketConnection SUPPRESS"
        "log.tag.MAPI-SocketListener SUPPRESS"
        "log.tag.MAPI-TranslatorManager SUPPRESS"
        "log.tag.MDM-Subscriber SUPPRESS"
        "log.tag.MTKSST SUPPRESS"
        "log.tag.MTK_APPList SUPPRESS"
        "log.tag.MediaPlayer SUPPRESS"
        "log.tag.MediaPlayerService SUPPRESS"
        "log.tag.MediaRouter SUPPRESS"
        "log.tag.MediaSession SUPPRESS"
        "log.tag.MipcEventHandler SUPPRESS"
        "log.tag.MountService SUPPRESS"
        "log.tag.MtkAdnRecord SUPPRESS"
        "log.tag.MtkCsimFH SUPPRESS"
        "log.tag.MtkEmbmsAdaptor SUPPRESS"
        "log.tag.MtkFactory SUPPRESS"
        "log.tag.MtkGsmCdmaConn SUPPRESS"
        "log.tag.MtkIccCardProxy SUPPRESS"
        "log.tag.MtkIccPHBIM SUPPRESS"
        "log.tag.MtkIccProvider SUPPRESS"
        "log.tag.MtkIccSmsInterfaceManager SUPPRESS"
        "log.tag.MtkImsManager SUPPRESS"
        "log.tag.MtkImsService SUPPRESS"
        "log.tag.MtkIsimFH SUPPRESS"
        "log.tag.MtkPhoneNotifr SUPPRESS"
        "log.tag.MtkPhoneNumberUtils SUPPRESS"
        "log.tag.MtkPhoneSwitcher SUPPRESS"
        "log.tag.MtkRecordLoader SUPPRESS"
        "log.tag.MtkRuimFH SUPPRESS"
        "log.tag.MtkSIMFH SUPPRESS"
        "log.tag.MtkSIMRecords SUPPRESS"
        "log.tag.MtkSmsCbHeader SUPPRESS"
        "log.tag.MtkSmsManager SUPPRESS"
        "log.tag.MtkSmsMessage SUPPRESS"
        "log.tag.MtkSpnOverride SUPPRESS"
        "log.tag.MtkSubCtrl SUPPRESS"
        "log.tag.MtkTelephonyManagerEx SUPPRESS"
        "log.tag.MtkUiccCard SUPPRESS"
        "log.tag.MtkUiccCardApp SUPPRESS"
        "log.tag.MtkUiccCtrl SUPPRESS"
        "log.tag.MtkUsimFH SUPPRESS"
        "log.tag.MtkUsimPhoneBookManager SUPPRESS"
        "log.tag.MwiRIL SUPPRESS"
        "log.tag.NetAgentService SUPPRESS"
        "log.tag.NetAgent_IO SUPPRESS"
        "log.tag.NetLnkEventHdlr SUPPRESS"
        "log.tag.NetworkManagement SUPPRESS"
        "log.tag.NetworkManagementService SUPPRESS"
        "log.tag.NetworkPolicy SUPPRESS"
        "log.tag.NetworkPolicyManagerService SUPPRESS"
        "log.tag.NetworkStats SUPPRESS"
        "log.tag.NetworkTimeUpdateService SUPPRESS"
        "log.tag.NotificationManager SUPPRESS"
        "log.tag.NotificationManagerService SUPPRESS"
        "log.tag.OperatorUtils SUPPRESS"
        "log.tag.PKM-Lib SUPPRESS"
        "log.tag.PKM-MDM SUPPRESS"
        "log.tag.PKM-Monitor SUPPRESS"
        "log.tag.PKM-SA SUPPRESS"
        "log.tag.PKM-Service SUPPRESS"
        "log.tag.PQ_DS SUPPRESS"
        "log.tag.PackageInstaller SUPPRESS"
        "log.tag.PackageManager SUPPRESS"
        "log.tag.PersistentDataBlockManager SUPPRESS"
        "log.tag.Phone SUPPRESS"
        "log.tag.PhoneConfigurationSettings SUPPRESS"
        "log.tag.PhoneFactory SUPPRESS"
        "log.tag.PowerHalAddressUitls SUPPRESS"
        "log.tag.PowerHalMgrImpl SUPPRESS"
        "log.tag.PowerHalMgrServiceImpl SUPPRESS"
        "log.tag.PowerHalWifiMonitor SUPPRESS"
        "log.tag.PowerManager SUPPRESS"
        "log.tag.PowerManagerService SUPPRESS"
        "log.tag.PrintManager SUPPRESS"
        "log.tag.ProcessStats SUPPRESS"
        "log.tag.ProxyController SUPPRESS"
        "log.tag.RFX SUPPRESS"
        "log.tag.RIL SUPPRESS"
        "log.tag.RIL-Fusion SUPPRESS"
        "log.tag.RIL-Netlink SUPPRESS"
        "log.tag.RIL-Parcel SUPPRESS"
        "log.tag.RIL-SocListen SUPPRESS"
        "log.tag.RIL-Socket SUPPRESS"
        "log.tag.RILC SUPPRESS"
        "log.tag.RILC-OP SUPPRESS"
        "log.tag.RILD SUPPRESS"
        "log.tag.RILMD2-SS SUPPRESS"
        "log.tag.RIL_UIM_SOCKET SUPPRESS"
        "log.tag.RadioManager SUPPRESS"
        "log.tag.RfxAction SUPPRESS"
        "log.tag.RfxBaseHandler SUPPRESS"
        "log.tag.RfxChannelMgr SUPPRESS"
        "log.tag.RfxCloneMgr SUPPRESS"
        "log.tag.RfxContFactory SUPPRESS"
        "log.tag.RfxController SUPPRESS"
        "log.tag.RfxDebugInfo SUPPRESS"
        "log.tag.RfxDisThread SUPPRESS"
        "log.tag.RfxFragEnc SUPPRESS"
        "log.tag.RfxHandlerMgr SUPPRESS"
        "log.tag.RfxIdToMsgId SUPPRESS"
        "log.tag.RfxIdToStr SUPPRESS"
        "log.tag.RfxMainThread SUPPRESS"
        "log.tag.RfxMclDisThread SUPPRESS"
        "log.tag.RfxMclMessenger SUPPRESS"
        "log.tag.RfxMclStatusMgr SUPPRESS"
        "log.tag.RfxMessage SUPPRESS"
        "log.tag.RfxObject SUPPRESS"
        "log.tag.RfxOpUtils SUPPRESS"
        "log.tag.RfxRilAdapter SUPPRESS"
        "log.tag.RfxRilUtils SUPPRESS"
        "log.tag.RfxRoot SUPPRESS"
        "log.tag.RfxStatusMgr SUPPRESS"
        "log.tag.RfxTimer SUPPRESS"
        "log.tag.RilClient SUPPRESS"
        "log.tag.RilOemClient SUPPRESS"
        "log.tag.RilOpProxy SUPPRESS"
        "log.tag.RmmCapa SUPPRESS"
        "log.tag.RmmCommSimOpReq SUPPRESS"
        "log.tag.RmmDcEvent SUPPRESS"
        "log.tag.RmmDcPdnManager SUPPRESS"
        "log.tag.RmmDcUrcHandler SUPPRESS"
        "log.tag.RmmDcUtility SUPPRESS"
        "log.tag.RmmEccNumberReqHdlr SUPPRESS"
        "log.tag.RmmEccNumberUrcHandler SUPPRESS"
        "log.tag.RmmEmbmsReq SUPPRESS"
        "log.tag.RmmEmbmsUrc SUPPRESS"
        "log.tag.RmmImsCtlReqHdl SUPPRESS"
        "log.tag.RmmImsCtlUrcHdl SUPPRESS"
        "log.tag.RmmMwi SUPPRESS"
        "log.tag.RmmNwAsyncHdlr SUPPRESS"
        "log.tag.RmmNwHdlr SUPPRESS"
        "log.tag.RmmNwNrtReqHdlr SUPPRESS"
        "log.tag.RmmNwRTReqHdlr SUPPRESS"
        "log.tag.RmmNwRatSwHdlr SUPPRESS"
        "log.tag.RmmNwReqHdlr SUPPRESS"
        "log.tag.RmmNwUrcHdlr SUPPRESS"
        "log.tag.RmmOemHandler SUPPRESS"
        "log.tag.RmmOpRadioReq SUPPRESS"
        "log.tag.RmmPhbReq SUPPRESS"
        "log.tag.RmmPhbUrc SUPPRESS"
        "log.tag.RmmRadioReq SUPPRESS"
        "log.tag.RmmSimBaseHandler SUPPRESS"
        "log.tag.RmmSimCommReq SUPPRESS"
        "log.tag.RmmSimCommUrc SUPPRESS"
        "log.tag.RmmWp SUPPRESS"
        "log.tag.RtmCapa SUPPRESS"
        "log.tag.RtmCommSimCtrl SUPPRESS"
        "log.tag.RtmDC SUPPRESS"
        "log.tag.RtmEccNumberController SUPPRESS"
        "log.tag.RtmEmbmsAt SUPPRESS"
        "log.tag.RtmEmbmsUtil SUPPRESS"
        "log.tag.RtmIms SUPPRESS"
        "log.tag.RtmImsConference SUPPRESS"
        "log.tag.RtmImsConfigController SUPPRESS"
        "log.tag.RtmImsDialog SUPPRESS"
        "log.tag.RtmModeCont SUPPRESS"
        "log.tag.RtmMwi SUPPRESS"
        "log.tag.RtmNwCtrl SUPPRESS"
        "log.tag.RtmPhb SUPPRESS"
        "log.tag.RtmRadioConfig SUPPRESS"
        "log.tag.RtmRadioCont SUPPRESS"
        "log.tag.RtmWp SUPPRESS"
        "log.tag.SIMRecords SUPPRESS"
        "log.tag.SQLiteQueryBuilder SUPPRESS"
        "log.tag.SensorManager SUPPRESS"
        "log.tag.ServiceManager SUPPRESS"
        "log.tag.SimSwitchOP01 SUPPRESS"
        "log.tag.SimSwitchOP02 SUPPRESS"
        "log.tag.SimSwitchOP18 SUPPRESS"
        "log.tag.SlotQueueEntry SUPPRESS"
        "log.tag.SpnOverride SUPPRESS"
        "log.tag.StatusBarManagerService SUPPRESS"
        "log.tag.StorageManager SUPPRESS"
        "log.tag.SurfaceFlinger SUPPRESS"
        "log.tag.SystemServer SUPPRESS"
        "log.tag.Telecom SUPPRESS"
        "log.tag.TelephonyManager SUPPRESS"
        "log.tag.TelephonyRegistry SUPPRESS"
        "log.tag.ThermalManager SUPPRESS"
        "log.tag.ToneGenerator SUPPRESS"
        "log.tag.UiccCard SUPPRESS"
        "log.tag.UiccController SUPPRESS"
        "log.tag.UsbHostManager SUPPRESS"
        "log.tag.UsbManager SUPPRESS"
        "log.tag.UxUtility SUPPRESS"
        "log.tag.VT SUPPRESS"
        "log.tag.VibratorService SUPPRESS"xe
        "log.tag.VpnManager SUPPRESS"
        "log.tag.VsimAdaptor SUPPRESS"
        "log.tag.WORLDMODE SUPPRESS"
        "log.tag.WallpaperManager SUPPRESS"
        "log.tag.WfoApp SUPPRESS"
        "log.tag.WifiManager SUPPRESS"
        "log.tag.WindowManager SUPPRESS"
        "log.tag.WindowManagerService SUPPRESS"
        "log.tag.WpfaCcciDataHeaderEncoder SUPPRESS"
        "log.tag.WpfaCcciReader SUPPRESS"
        "log.tag.WpfaCcciSender SUPPRESS"
        "log.tag.WpfaControlMsgHandler SUPPRESS"
        "log.tag.WpfaDriver SUPPRESS"
        "log.tag.WpfaDriverAccept SUPPRESS"
        "log.tag.WpfaDriverAdapter SUPPRESS"
        "log.tag.WpfaDriverDeReg SUPPRESS"
        "log.tag.WpfaDriverMessage SUPPRESS"
        "log.tag.WpfaDriverRegFilter SUPPRESS"
        "log.tag.WpfaDriverULIpPkt SUPPRESS"
        "log.tag.WpfaDriverUtilis SUPPRESS"
        "log.tag.WpfaDriverVersion SUPPRESS"
        "log.tag.WpfaFilterRuleReqHandler SUPPRESS"
        "log.tag.WpfaParsing SUPPRESS"
        "log.tag.WpfaRingBuffer SUPPRESS"
        "log.tag.WpfaRuleContainer SUPPRESS"
        "log.tag.WpfaRuleRegister SUPPRESS"
        "log.tag.WpfaShmAccessController SUPPRESS"
        "log.tag.WpfaShmReadMsgHandler SUPPRESS"
        "log.tag.WpfaShmSynchronizer SUPPRESS"
        "log.tag.WpfaShmWriteMsgHandler SUPPRESS"
        "log.tag.brevent.event SUPPRESS"
        "log.tag.libPowerHal SUPPRESS"
        "log.tag.libfuse SUPPRESS"
        "log.tag.mipc_lib SUPPRESS"
        "log.tag.mtkpower@impl SUPPRESS"
        "log.tag.mtkpower_client SUPPRESS"
        "log.tag.trm_lib SUPPRESS"
        "log.tag.wpfa_iptable_android SUPPRESS"
        "log.tag.Networklogger SUPPRESS"
        "log.tag.AudioFlinger::DeviceEffectProxy SUPPRESS"
    )
    for commands in "${disable_log[@]}"; do
    IFS=' ' read -r name value <<< "$commands"
    setprop "$name" "$value"
done
}> /dev/null 2>&1

apply_ram_plus() {
if [ "$(echo "$gb_ram <= 4" | bc)" -eq 1 ]; then
    settings put global ram_expand_size 4096
elif [ "$(echo "$gb_ram >= 8" | bc)" -eq 1 ]; then
    settings put global ram_expand_size 0
else
    echo ""
fi
}> /dev/null 2>&1

sensi() {
    system=(
        "ro.min.fling_velocity 25000"
        "ro.max.fling_velocity 25000"
        "speed_pointer 7"
        "game-touchscreen-boost 1"
        "touch.pressure.scale 0.001"
        "touch_boost 1"
        "ram_boost 1"
        "cpu_boost 1"
        "gpu_boost 1"
        "zram_enable 1"
        "ui.hw 1"
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
        "hwui.render_dirty_regions 0"
        "debug.sf.hw 1"
        "debug.als.logs 0"
        "debug.atrace.tags.enableflags 0"
        "debug.egl.profiler 0"
        "debug.enable.wl_log 0"
        "debug.sf.enable_hwc_vds 0"
        "debug.sf.ddms 0"
        "ro.kernel.android.checkjni 0"
        "debug.crash.logcat 0"
        "debug.sf.dump 0"
        "debug.hwui.skia_atrace_enabled 0"
        "debug.app.performance_restricted false"
        "debug.mdpcomp.logs 0"
        "debug.egl.force_msaa 0"
        "debug.hwui.force_fxaa 0" 
        "debug.hwui.force_smaa 0" 
        "debug.hwui.force_msaa 0" 
        "debug.hwui.force_txaa 0" 
        "debug.hwui.force_csaa 0" 
        "debug.hwui.force_dlss 0" 
        "debug.gr.swapinterval 0"
        "debug.sf.swapinterval 0"
        "debug.hwc.otf 0"
        "ro.config.nocheckin 1"
        "debug.hwc_dump_en 0"
        "debug.egl.hw 1" 
        "debug.mdlogger.Running 0"
        "debug.egl.force_dmsaa 0"
        "debug.sf.showupdates 0"
        "debug.sf.showfps 0"
        "debug.sf.showcpu 0"
        "debug.hwui.overdraw false"
        "debug.overlayui.enable 0"
        "debug.hwui.use_hint_manager 1"
        "debug.sf.showbackground 0"
        "debug.sf.shoupdates 0"
        "debug.composition.type gpu"
        "debug.egl.swapinterval 0"
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
        "debug.cpuprio 7"
        "debug.gpuprio 7"
        "debug.ioprio 7"
        "debug.hwui.fps_divisor 1"
        "debugtool.anrhistory 0"
        "debug.hwc.force_gpu_vsync 1"
        "debug.sf.gpu_comp_tiling 1"
        "windowsmgr.max_events_per_sec 90"
        "ro.min_pointer_dur 8"
        "profiler.hung.dumpdobugreport 0"
        "debug.javafx.animation.fullspeed true"
        "debug.systemuicompilerfilter speed-profile"
        "debug.cpurend.vsync false"
        "debug.gpurend.vsync false"
        "debug.performance.tuning 1"
        "debug.perf.tuning 1"
        "debug.enable-vr-mode 1"
        "debug.performance.profile 1"
        "debug.perf.profile 1"
        "debug.hwui.use_layer_renderer true"
        "debug.hwui.target_cpu_time_percent 200"
        "debug.hwui.target_gpu_time_percent 200"
        "pm.dexopt.bg-dexopt speed-profile"
        "pm.dexopt.ab-ota speed-profile"
        "debug.qualcomm.sns.daemon 0"
        "debug.qualcomm.sns.hal 0"
        "debug.qualcomm.sns.libsensor1 0"
        "debug.sqlite.syncmode 1"
        "persist.debug.trace 0"
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
    fps=(
        "debug.sf.early_app_phase_offset_ns 10500000"
        "debug.sf.early_gl_app_phase_offset_ns 13666666"
        "debug.sf.early_gl_phase_offset_ns 10500000"
        "debug.sf.early_phase_offset_ns 13666666"
        "debug.sf.high_fps_early_gl_phase_offset_ns 10500000"
        "debug.sf.high_fps_late_app_phase_offset_ns 13666666"
        "debug.sf.high_fps_late_sf_phase_offset_ns 10500000"
        "debug.sf.early.app.duration 13666666"
        "debug.sf.early.sf.duration 10500000"
        "debug.sf.earlyGl.app.duration 13666666"
        "debug.sf.earlyGl.sf.duration 10500000"
        "debug.sf.late.app.duration 13666666"
        "debug.sf.late.sf.duration 10500000"
        "debug.sf.region_sampling_period_ns 200000000"
        "debug.sf.region_sampling_timer_timeout_ns 200000000"
    )
    disable_animation=(
        "window_animation_scale 0"
        "transition_animation_scale 0"
        "animator_duration_scale 0"
    )
    global=(
        "gpu_debug_layers 0"
        "enable_gpu_debug_layers 0"
        "game_mode_enable 1"
        "perf_mode 1"
        "angle_gl_driver_selection_pkgs com.dts.freefiremax,com.dts.freefireth"
        "angle_gl_driver_selection_values angle,angle"
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
    for commands in "${fps[@]}"; do
    IFS=' ' read -r name value <<< "$commands"
    setprop "$name" "$value"
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

if [ "$brand" != "Xiaomi" ] && ( [ "$brand" = "Samsung" ] || [ "$brand" = "vivo" ] || [ "$brand" = "OPPO" ] ); then
    setprop debug.sf.enable_advanced_sf_phase_offset 0
    settings put global device_idle_constants inactive_to=25000,sensing_to=0,locating_to=0,location_accuracy=20.0,motion_inactive_to=0,idle_after_inactive_to=0,idle_pending_to=60000,max_idle_pending_to=120000,idle_pending_factor=2.0,idle_to=900000,max_idle_to=21600000,idle_factor=2.0,min_time_to_alarm=600000,max_temp_app_whitelist_duration=10000,mms_temp_app_whitelist_duration=10000,sms_temp_app_whitelist_duration=10000,light_after_inactive_to=5000,light_pre_idle_to=60000,light_idle_to=180000,light_idle_factor=2.0,light_max_idle_to=240000,light_idle_maintenance_min_budget=60000,light_idle_maintenance_max_budget=180000,min_light_maintenance_time=5000,min_deep_maintenance_time=30000,notification_whitelist_duration=30000
fi
device_config put game_overlay com.dts.freefireth mode=2,"$renderer"=true,fps="$refresh_rate",downscaleFactor=0.3,vsync=false
device_config put game_overlay com.dts.freefiremax mode=2,"$renderer"=true,fps="$refresh_rate",downscaleFactor=0.3,vsync=false,
setprop debug.hwui.renderer "$renderer"
setprop debug.renderengine.backend "$renderer"threaded
setprop debug.composition.7x27A.type mdp
setprop debug.composition.7x25A.type mdp
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
pm disable-user --user 0 com.xiaomi.joyose
pm disable-user --user 0 com.samsung.android.game.gos
pm disable-user --user 0 com.samsung.android.game.gametools
pm disable-user --user 0 com.samsung.android.game.gamehome
#disable logcat buffer
logcat -G 0K
logger_buffer_size 0
settings out global logcat_buffer_size 0
settings out global buffer_size 0

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
settings put system perf_proc_game_List com.dts.freefireth,com.dts.freefiremax
setprop log.tag.AF::MmapTrack SUPPRESS
setprop log.tag.AF::OutputTrack SUPPRESS
setprop log.tag.AF::PatchRecord SUPPRESS
setprop log.tag.AF::PatchTrack SUPPRESS
setprop log.tag.AF::RecordHandle SUPPRESS
setprop log.tag.AF::RecordTrack SUPPRESS
setprop log.tag.AF::Track SUPPRESS
setprop log.tag.AF::TrackBase SUPPRESS
setprop log.tag.AF::TrackHandle SUPPRESS
setprop log.tag.APM-KpiMonitor SUPPRESS
setprop log.tag.APM-ServiceJ SUPPRESS
setprop log.tag.APM-SessionJ SUPPRESS
setprop log.tag.APM-SessionN SUPPRESS
setprop log.tag.APM-Subscriber SUPPRESS
setprop log.tag.APM::AudioCollections SUPPRESS
setprop log.tag.APM::AudioInputDescriptor SUPPRESS
setprop log.tag.APM::AudioOutputDescriptor SUPPRESS
setprop log.tag.APM::AudioPatch SUPPRESS
setprop log.tag.APM::AudioPolicyEngine SUPPRESS
setprop log.tag.APM::AudioPolicyEngine::Base SUPPRESS
setprop log.tag.APM::AudioPolicyEngine::Config SUPPRESS
setprop log.tag.APM::AudioPolicyEngine::ProductStrategy SUPPRESS
setprop log.tag.APM::AudioPolicyEngine::VolumeGroup SUPPRESS
setprop log.tag.APM::Devices SUPPRESS
setprop log.tag.APM::IOProfile SUPPRESS
setprop log.tag.APM::Serializer SUPPRESS
setprop log.tag.APM::VolumeCurve SUPPRESS
setprop log.tag.APM_AudioPolicyManager SUPPRESS
setprop log.tag.APM_ClientDescriptor SUPPRESS
setprop log.tag.AT SUPPRESS
setprop log.tag.AccountManager SUPPRESS
setprop log.tag.ActivityManager SUPPRESS
setprop log.tag.ActivityManagerService SUPPRESS
setprop log.tag.ActivityTaskManager SUPPRESS
setprop log.tag.ActivityTaskManagerService SUPPRESS
setprop log.tag.AdnRecord SUPPRESS
setprop log.tag.AdnRecordCache SUPPRESS
setprop log.tag.AdnRecordLoader SUPPRESS
setprop log.tag.AirplaneHandler SUPPRESS
setprop log.tag.AlarmManager SUPPRESS
setprop log.tag.AlarmManagerService SUPPRESS
setprop log.tag.AndroidRuntime SUPPRESS
setprop log.tag.AppOps SUPPRESS
setprop log.tag.AudioAttributes SUPPRESS
setprop log.tag.AudioEffect SUPPRESS
setprop log.tag.AudioFlinger SUPPRESS
setprop log.tag.AudioFlinger::DeviceEffectProxy SUPPRESS
setprop log.tag.AudioFlinger::DeviceEffectProxy::ProxyCallback SUPPRESS
setprop log.tag.AudioFlinger::EffectBase SUPPRESS
setprop log.tag.AudioFlinger::EffectChain SUPPRESS
setprop log.tag.AudioFlinger::EffectHandle SUPPRESS
setprop log.tag.AudioFlinger::EffectModule SUPPRESS
setprop log.tag.AudioFlinger_Threads SUPPRESS
setprop log.tag.AudioHwDevice SUPPRESS
setprop log.tag.AudioManager SUPPRESS
setprop log.tag.AudioPolicy SUPPRESS
setprop log.tag.AudioPolicyEffects SUPPRESS
setprop log.tag.AudioPolicyIntefaceImpl SUPPRESS
setprop log.tag.AudioPolicyManager SUPPRESS
setprop log.tag.AudioPolicyService SUPPRESS
setprop log.tag.AudioProductStrategy SUPPRESS
setprop log.tag.AudioRecord SUPPRESS
setprop log.tag.AudioService SUPPRESS
setprop log.tag.AudioSystem SUPPRESS
setprop log.tag.AudioTrack SUPPRESS
setprop log.tag.AudioTrackShared SUPPRESS
setprop log.tag.AudioVolumeGroup SUPPRESS
setprop log.tag.BackupManager SUPPRESS
setprop log.tag.BatteryManager SUPPRESS
setprop log.tag.BatteryStatsService SUPPRESS
setprop log.tag.BluetoothAdapter SUPPRESS
setprop log.tag.BluetoothDevice SUPPRESS
setprop log.tag.BluetoothGattService SUPPRESS
setprop log.tag.BluetoothHidService SUPPRESS
setprop log.tag.BluetoothManager SUPPRESS
setprop log.tag.BluetoothMapService SUPPRESS
setprop log.tag.BluetoothPanService SUPPRESS
setprop log.tag.BluetoothPbapService SUPPRESS
setprop log.tag.BluetoothSapService SUPPRESS
setprop log.tag.BluetoothService SUPPRESS
setprop log.tag.BluetoothSocket SUPPRESS
setprop log.tag.BufferQueueDump SUPPRESS
setprop log.tag.BufferQueueProducer SUPPRESS
setprop log.tag.C2K_AT SUPPRESS
setprop log.tag.C2K_ATConfig SUPPRESS
setprop log.tag.C2K_RILC SUPPRESS
setprop log.tag.CAM2PORT_ SUPPRESS
setprop log.tag.CapaSwitch SUPPRESS
setprop log.tag.CarrierExpressServiceImpl SUPPRESS
setprop log.tag.CarrierExpressServiceImplExt SUPPRESS
setprop log.tag.ClipboardManager SUPPRESS
setprop log.tag.ConnectivityManager SUPPRESS
setprop log.tag.ConnectivityService SUPPRESS
setprop log.tag.ConsumerIrService SUPPRESS
setprop log.tag.ContentManager SUPPRESS
setprop log.tag.CountryDetector SUPPRESS
setprop log.tag.DMC-ApmService SUPPRESS
setprop log.tag.DMC-Core SUPPRESS
setprop log.tag.DMC-DmcService SUPPRESS
setprop log.tag.DMC-EventsSubscriber SUPPRESS
setprop log.tag.DMC-ReqQManager SUPPRESS
setprop log.tag.DMC-SessionManager SUPPRESS
setprop log.tag.DMC-TranslatorLoader SUPPRESS
setprop log.tag.DMC-TranslatorUtils SUPPRESS
setprop log.tag.DSSelector SUPPRESS
setprop log.tag.DSSelectorOP01 SUPPRESS
setprop log.tag.DSSelectorOP02 SUPPRESS
setprop log.tag.DSSelectorOP09 SUPPRESS
setprop log.tag.DSSelectorOP18 SUPPRESS
setprop log.tag.DSSelectorOm SUPPRESS
setprop log.tag.DSSelectorUtil SUPPRESS
setprop log.tag.DataDispatcher SUPPRESS
setprop log.tag.DeviceIdleController SUPPRESS
setprop log.tag.DevicePolicyManager SUPPRESS
setprop log.tag.DevicePolicyManagerService SUPPRESS
setprop log.tag.DisplayManager SUPPRESS
setprop log.tag.DisplayManagerService SUPPRESS
setprop log.tag.DockObserver SUPPRESS
setprop log.tag.DownloadManager SUPPRESS
setprop log.tag.ExternalSimMgr SUPPRESS
setprop log.tag.FastCapture SUPPRESS
setprop log.tag.FastMixer SUPPRESS
setprop log.tag.FastMixerState SUPPRESS
setprop log.tag.FastThread SUPPRESS
setprop log.tag.FragmentManager SUPPRESS
setprop log.tag.FuseDaemon SUPPRESS
setprop log.tag.GAv4 SUPPRESS
setprop log.tag.GraphicsStats SUPPRESS
setprop log.tag.GsmCallTkrHlpr SUPPRESS
setprop log.tag.GsmCdmaConn SUPPRESS
setprop log.tag.GsmCdmaPhone SUPPRESS
setprop log.tag.HardwarePropertiesManager SUPPRESS
setprop log.tag.HardwareService SUPPRESS
setprop log.tag.IAudioFlinger SUPPRESS
setprop log.tag.IMSRILRequest SUPPRESS
setprop log.tag.IMS_RILA SUPPRESS
setprop log.tag.IccCardProxy SUPPRESS
setprop log.tag.IccPhoneBookIM SUPPRESS
setprop log.tag.IccProvider SUPPRESS
setprop log.tag.ImsApp SUPPRESS
setprop log.tag.ImsBaseCommands SUPPRESS
setprop log.tag.ImsCall SUPPRESS
setprop log.tag.ImsCallProfile SUPPRESS
setprop log.tag.ImsCallSession SUPPRESS
setprop log.tag.ImsEcbm SUPPRESS
setprop log.tag.ImsEcbmProxy SUPPRESS
setprop log.tag.ImsManager SUPPRESS
setprop log.tag.ImsPhone SUPPRESS
setprop log.tag.ImsPhoneBase SUPPRESS
setprop log.tag.ImsPhoneCall SUPPRESS
setprop log.tag.ImsService SUPPRESS
setprop log.tag.ImsVTProvider SUPPRESS
setprop log.tag.InputDispatcher SUPPRESS
setprop log.tag.InputManager SUPPRESS
setprop log.tag.InputManagerService SUPPRESS
setprop log.tag.InputMethodManager SUPPRESS
setprop log.tag.InputMethodManagerService SUPPRESS
setprop log.tag.InterfaceManager SUPPRESS
setprop log.tag.IsimFileHandler SUPPRESS
setprop log.tag.IsimRecords SUPPRESS
setprop log.tag.JobScheduler SUPPRESS
setprop log.tag.KeyguardManager SUPPRESS
setprop log.tag.LCM-Subscriber SUPPRESS
setprop log.tag.LIBC2K_RIL SUPPRESS
setprop log.tag.LocationManager SUPPRESS
setprop log.tag.LocationManagerService SUPPRESS
setprop log.tag.LocationProvider SUPPRESS
setprop log.tag.MAPI-CommandProcessor SUPPRESS
setprop log.tag.MAPI-MdiRedirector SUPPRESS
setprop log.tag.MAPI-MdiRedirectorCtrl SUPPRESS
setprop log.tag.MAPI-NetworkSocketConnection SUPPRESS
setprop log.tag.MAPI-SocketConnection SUPPRESS
setprop log.tag.MAPI-SocketListener SUPPRESS
setprop log.tag.MAPI-TranslatorManager SUPPRESS
setprop log.tag.MDM-Subscriber SUPPRESS
setprop log.tag.MTKSST SUPPRESS
setprop log.tag.MTK_APPList SUPPRESS
setprop log.tag.MediaPlayer SUPPRESS
setprop log.tag.MediaPlayerService SUPPRESS
setprop log.tag.MediaRouter SUPPRESS
setprop log.tag.MediaSession SUPPRESS
setprop log.tag.MipcEventHandler SUPPRESS
setprop log.tag.MountService SUPPRESS
setprop log.tag.MtkAdnRecord SUPPRESS
setprop log.tag.MtkCsimFH SUPPRESS
setprop log.tag.MtkEmbmsAdaptor SUPPRESS
setprop log.tag.MtkFactory SUPPRESS
setprop log.tag.MtkGsmCdmaConn SUPPRESS
setprop log.tag.MtkIccCardProxy SUPPRESS
setprop log.tag.MtkIccPHBIM SUPPRESS
setprop log.tag.MtkIccProvider SUPPRESS
setprop log.tag.MtkIccSmsInterfaceManager SUPPRESS
setprop log.tag.MtkImsManager SUPPRESS
setprop log.tag.MtkImsService SUPPRESS
setprop log.tag.MtkIsimFH SUPPRESS
setprop log.tag.MtkPhoneNotifr SUPPRESS
setprop log.tag.MtkPhoneNumberUtils SUPPRESS
setprop log.tag.MtkPhoneSwitcher SUPPRESS
setprop log.tag.MtkRecordLoader SUPPRESS
setprop log.tag.MtkRuimFH SUPPRESS
setprop log.tag.MtkSIMFH SUPPRESS
setprop log.tag.MtkSIMRecords SUPPRESS
setprop log.tag.MtkSmsCbHeader SUPPRESS
setprop log.tag.MtkSmsManager SUPPRESS
setprop log.tag.MtkSmsMessage SUPPRESS
setprop log.tag.MtkSpnOverride SUPPRESS
setprop log.tag.MtkSubCtrl SUPPRESS
setprop log.tag.MtkTelephonyManagerEx SUPPRESS
setprop log.tag.MtkUiccCard SUPPRESS
setprop log.tag.MtkUiccCardApp SUPPRESS
setprop log.tag.MtkUiccCtrl SUPPRESS
setprop log.tag.MtkUsimFH SUPPRESS
setprop log.tag.MtkUsimPhoneBookManager SUPPRESS
setprop log.tag.MwiRIL SUPPRESS
setprop log.tag.NetAgentService SUPPRESS
setprop log.tag.NetAgent_IO SUPPRESS
setprop log.tag.NetLnkEventHdlr SUPPRESS
setprop log.tag.NetworkManagement SUPPRESS
setprop log.tag.NetworkManagementService SUPPRESS
setprop log.tag.NetworkPolicy SUPPRESS
setprop log.tag.NetworkPolicyManagerService SUPPRESS
setprop log.tag.NetworkStats SUPPRESS
setprop log.tag.NetworkTimeUpdateService SUPPRESS
setprop log.tag.NotificationManager SUPPRESS
setprop log.tag.NotificationManagerService SUPPRESS
setprop log.tag.OperatorUtils SUPPRESS
setprop log.tag.PKM-Lib SUPPRESS
setprop log.tag.PKM-MDM SUPPRESS
setprop log.tag.PKM-Monitor SUPPRESS
setprop log.tag.PKM-SA SUPPRESS
setprop log.tag.PKM-Service SUPPRESS
setprop log.tag.PQ_DS SUPPRESS
setprop log.tag.PackageInstaller SUPPRESS
setprop log.tag.PackageManager SUPPRESS
setprop log.tag.PersistentDataBlockManager SUPPRESS
setprop log.tag.Phone SUPPRESS
setprop log.tag.PhoneConfigurationSettings SUPPRESS
setprop log.tag.PhoneFactory SUPPRESS
setprop log.tag.PowerHalAddressUitls SUPPRESS
setprop log.tag.PowerHalMgrImpl SUPPRESS
setprop log.tag.PowerHalMgrServiceImpl SUPPRESS
setprop log.tag.PowerHalWifiMonitor SUPPRESS
setprop log.tag.PowerManager SUPPRESS
setprop log.tag.PowerManagerService SUPPRESS
setprop log.tag.PrintManager SUPPRESS
setprop log.tag.ProcessStats SUPPRESS
setprop log.tag.ProxyController SUPPRESS
setprop log.tag.RFX SUPPRESS
setprop log.tag.RIL SUPPRESS
setprop log.tag.RIL-Fusion SUPPRESS
setprop log.tag.RIL-Netlink SUPPRESS
setprop log.tag.RIL-Parcel SUPPRESS
setprop log.tag.RIL-SocListen SUPPRESS
setprop log.tag.RIL-Socket SUPPRESS
setprop log.tag.RILC SUPPRESS
setprop log.tag.RILC-OP SUPPRESS
setprop log.tag.RILD SUPPRESS
setprop log.tag.RILMD2-SS SUPPRESS
setprop log.tag.RIL_UIM_SOCKET SUPPRESS
setprop log.tag.RadioManager SUPPRESS
setprop log.tag.RfxAction SUPPRESS
setprop log.tag.RfxBaseHandler SUPPRESS
setprop log.tag.RfxChannelMgr SUPPRESS
setprop log.tag.RfxCloneMgr SUPPRESS
setprop log.tag.RfxContFactory SUPPRESS
setprop log.tag.RfxController SUPPRESS
setprop log.tag.RfxDebugInfo SUPPRESS
setprop log.tag.RfxDisThread SUPPRESS
setprop log.tag.RfxFragEnc SUPPRESS
setprop log.tag.RfxHandlerMgr SUPPRESS
setprop log.tag.RfxIdToMsgId SUPPRESS
setprop log.tag.RfxIdToStr SUPPRESS
setprop log.tag.RfxMainThread SUPPRESS
setprop log.tag.RfxMclDisThread SUPPRESS
setprop log.tag.RfxMclMessenger SUPPRESS
setprop log.tag.RfxMclStatusMgr SUPPRESS
setprop log.tag.RfxMessage SUPPRESS
setprop log.tag.RfxObject SUPPRESS
setprop log.tag.RfxOpUtils SUPPRESS
setprop log.tag.RfxRilAdapter SUPPRESS
setprop log.tag.RfxRilUtils SUPPRESS
setprop log.tag.RfxRoot SUPPRESS
setprop log.tag.RfxStatusMgr SUPPRESS
setprop log.tag.RfxTimer SUPPRESS
setprop log.tag.RilClient SUPPRESS
setprop log.tag.RilOemClient SUPPRESS
setprop log.tag.RilOpProxy SUPPRESS
setprop log.tag.RmmCapa SUPPRESS
setprop log.tag.RmmCommSimOpReq SUPPRESS
setprop log.tag.RmmDcEvent SUPPRESS
setprop log.tag.RmmDcPdnManager SUPPRESS
setprop log.tag.RmmDcUrcHandler SUPPRESS
setprop log.tag.RmmDcUtility SUPPRESS
setprop log.tag.RmmEccNumberReqHdlr SUPPRESS
setprop log.tag.RmmEccNumberUrcHandler SUPPRESS
setprop log.tag.RmmEmbmsReq SUPPRESS
setprop log.tag.RmmEmbmsUrc SUPPRESS
setprop log.tag.RmmImsCtlReqHdl SUPPRESS
setprop log.tag.RmmImsCtlUrcHdl SUPPRESS
setprop log.tag.RmmMwi SUPPRESS
setprop log.tag.RmmNwAsyncHdlr SUPPRESS
setprop log.tag.RmmNwHdlr SUPPRESS
setprop log.tag.RmmNwNrtReqHdlr SUPPRESS
setprop log.tag.RmmNwRTReqHdlr SUPPRESS
setprop log.tag.RmmNwRatSwHdlr SUPPRESS
setprop log.tag.RmmNwReqHdlr SUPPRESS
setprop log.tag.RmmNwUrcHdlr SUPPRESS
setprop log.tag.RmmOemHandler SUPPRESS
setprop log.tag.RmmOpRadioReq SUPPRESS
setprop log.tag.RmmPhbReq SUPPRESS
setprop log.tag.RmmPhbUrc SUPPRESS
setprop log.tag.RmmRadioReq SUPPRESS
setprop log.tag.RmmSimBaseHandler SUPPRESS
setprop log.tag.RmmSimCommReq SUPPRESS
setprop log.tag.RmmSimCommUrc SUPPRESS
setprop log.tag.RmmWp SUPPRESS
setprop log.tag.RtmCapa SUPPRESS
setprop log.tag.RtmCommSimCtrl SUPPRESS
setprop log.tag.RtmDC SUPPRESS
setprop log.tag.RtmEccNumberController SUPPRESS
setprop log.tag.RtmEmbmsAt SUPPRESS
setprop log.tag.RtmEmbmsUtil SUPPRESS
setprop log.tag.RtmIms SUPPRESS
setprop log.tag.RtmImsConference SUPPRESS
setprop log.tag.RtmImsConfigController SUPPRESS
setprop log.tag.RtmImsDialog SUPPRESS
setprop log.tag.RtmModeCont SUPPRESS
setprop log.tag.RtmMwi SUPPRESS
setprop log.tag.RtmNwCtrl SUPPRESS
setprop log.tag.RtmPhb SUPPRESS
setprop log.tag.RtmRadioConfig SUPPRESS
setprop log.tag.RtmRadioCont SUPPRESS
setprop log.tag.RtmWp SUPPRESS
setprop log.tag.SIMRecords SUPPRESS
setprop log.tag.SQLiteQueryBuilder SUPPRESS
setprop log.tag.SensorManager SUPPRESS
setprop log.tag.ServiceManager SUPPRESS
setprop log.tag.SimSwitchOP01 SUPPRESS
setprop log.tag.SimSwitchOP02 SUPPRESS
setprop log.tag.SimSwitchOP18 SUPPRESS
setprop log.tag.SlotQueueEntry SUPPRESS
setprop log.tag.SpnOverride SUPPRESS
setprop log.tag.StatusBarManagerService SUPPRESS
setprop log.tag.StorageManager SUPPRESS
setprop log.tag.SurfaceFlinger SUPPRESS
setprop log.tag.SystemServer SUPPRESS
setprop log.tag.Telecom SUPPRESS
setprop log.tag.TelephonyManager SUPPRESS
setprop log.tag.TelephonyRegistry SUPPRESS
setprop log.tag.ThermalManager SUPPRESS
setprop log.tag.ToneGenerator SUPPRESS
setprop log.tag.UiccCard SUPPRESS
setprop log.tag.UiccController SUPPRESS
setprop log.tag.UsbHostManager SUPPRESS
setprop log.tag.UsbManager SUPPRESS
setprop log.tag.UxUtility SUPPRESS
setprop log.tag.VT SUPPRESS
setprop log.tag.VibratorService SUPPRESS
setprop log.tag.VpnManager SUPPRESS
setprop log.tag.VsimAdaptor SUPPRESS
setprop log.tag.WORLDMODE SUPPRESS
setprop log.tag.WallpaperManager SUPPRESS
setprop log.tag.WfoApp SUPPRESS
setprop log.tag.WifiManager SUPPRESS
setprop log.tag.WindowManager SUPPRESS
setprop log.tag.WindowManagerService SUPPRESS
setprop log.tag.WpfaCcciDataHeaderEncoder SUPPRESS
setprop log.tag.WpfaCcciReader SUPPRESS
setprop log.tag.WpfaCcciSender SUPPRESS
setprop log.tag.WpfaControlMsgHandler SUPPRESS
setprop log.tag.WpfaDriver SUPPRESS
setprop log.tag.WpfaDriverAccept SUPPRESS
setprop log.tag.WpfaDriverAdapter SUPPRESS
setprop log.tag.WpfaDriverDeReg SUPPRESS
setprop log.tag.WpfaDriverMessage SUPPRESS
setprop log.tag.WpfaDriverRegFilter SUPPRESS
setprop log.tag.WpfaDriverULIpPkt SUPPRESS
setprop log.tag.WpfaDriverUtilis SUPPRESS
setprop log.tag.WpfaDriverVersion SUPPRESS
setprop log.tag.WpfaFilterRuleReqHandler SUPPRESS
setprop log.tag.WpfaParsing SUPPRESS
setprop log.tag.WpfaRingBuffer SUPPRESS
setprop log.tag.WpfaRuleContainer SUPPRESS
setprop log.tag.WpfaRuleRegister SUPPRESS
setprop log.tag.WpfaShmAccessController SUPPRESS
setprop log.tag.WpfaShmReadMsgHandler SUPPRESS
setprop log.tag.WpfaShmSynchronizer SUPPRESS
setprop log.tag.WpfaShmWriteMsgHandler SUPPRESS
setprop log.tag.brevent.event SUPPRESS
setprop log.tag.libPowerHal SUPPRESS
setprop log.tag.libfuse SUPPRESS
setprop log.tag.mipc_lib SUPPRESS
setprop log.tag.mtkpower@impl SUPPRESS
setprop log.tag.mtkpower_client SUPPRESS
setprop log.tag.trm_lib SUPPRESS
setprop log.tag.wpfa_iptable_android SUPPRESS
setprop log.tag.Networklogger SUPPRESS
setprop log.tag.AudioFlinger::DeviceEffectProxy SUPPRESS
settings put system ro.min.fling_velocity 25000
settings put system ro.max.fling_velocity 25000
settings put system speed_pointer 7
settings put system game-touchscreen-boost 1
settings put system touch.pressure.scale 0.001
settings put system touch_boost 1
settings put system ram_boost 1
settings put system cpu_boost 1
settings put system gpu_boost 1
settings put system zram_enable 1
settings put system ui.hw 1
settings put secure long_press_timeout 500
settings put secure multi_press_timeout 500
settings put secure speed_mode 1
settings put secure speed_mode_enable 1
setprop hwui.render_dirty_regions 0
setprop debug.sf.hw 1
setprop debug.als.logs 0
setprop debug.atrace.tags.enableflags 0
setprop debug.egl.profiler 0
setprop debug.enable.wl_log 0
setprop debug.sf.enable_hwc_vds 0
setprop debug.sf.ddms 0
ro.kernel.android.checkjni 0
setprop debug.crash.logcat 0
setprop debug.sf.dump 0
setprop debug.hwui.skia_atrace_enabled 0
setprop debug.app.performance_restricted false
setprop debug.mdpcomp.logs 0
setprop debug.egl.force_msaa 0
setprop debug.hwui.force_fxaa 0 
setprop debug.hwui.force_smaa 0 
setprop debug.hwui.force_msaa 0 
setprop debug.hwui.force_txaa 0 
setprop debug.hwui.force_csaa 0 
setprop debug.hwui.force_dlss 0 
setprop debug.gr.swapinterval 0
setprop debug.sf.swapinterval 0
setprop debug.hwc.otf 0
setprop debug.hwc_dump_en 0
setprop debug.egl.hw 1 
setprop debug.mdlogger.Running 0
setprop debug.egl.force_dmsaa 0
setprop debug.sf.showupdates 0
setprop debug.sf.showfps 0
setprop debug.sf.showcpu 0
setprop debug.hwui.overdraw false
setprop debug.overlayui.enable 0
setprop debug.hwui.use_hint_manager 1
setprop debug.sf.showbackground 0
setprop debug.sf.shoupdates 0
setprop debug.composition.type gpu
setprop debug.egl.swapinterval 0
setprop debug.gpu.renderer skiagl
setprop debug.hwui.renderer skiagl
setprop debug.hwui.use_threaded_renderer true
setprop debug.hwc.logvsync 0
setprop debug.sf.gpuoverlay 0
setprop debug.sf.sa_enable 1
setprop debug.qc.hardware 1
setprop debug.sqlite.journalmode WAL
setprop debug.sf.sa_log 1
setprop debug.hwc.asyncdisp 1
setprop debug.power.loghint 0
setprop debug.force-opengl 1
setprop debug.cpuprio 7
setprop debug.gpuprio 7
setprop debug.ioprio 7
setprop debug.hwui.fps_divisor 1
setprop debugtool.anrhistory 0
setprop debug.hwc.force_gpu_vsync 1
setprop debug.sf.gpu_comp_tiling 1
setprop debug.javafx.animation.fullspeed true
setprop debug.javafx.animation.framerate "$1"
setprop debug.systemuicompilerfilter speed-profile
setprop debug.cpurend.vsync false
setprop debug.gpurend.vsync false
setprop debug.performance.tuning 1
setprop debug.perf.tuning 1
setprop debug.enable-vr-mode 1
setprop debug.performance.profile 1
setprop debug.perf.profile 1
setprop debug.hwui.use_layer_renderer true
setprop debug.hwui.target_cpu_time_percent 200
setprop debug.hwui.target_gpu_time_percent 200
setprop pm.dexopt.bg-dexopt speed-profile
setprop pm.dexopt.ab-ota speed-profile
setprop debug.qualcomm.sns.daemon 0
setprop debug.qualcomm.sns.hal 0
setprop debug.qualcomm.sns.libsensor1 0
setprop debug.sqlite.syncmode 1
setprop debug.hwui.texture_max_size 65536
setprop debug.hwui.texture_cache_size 65536
setprop debug.hwui.layer_cache_size 65536
setprop debug.hwui.path_cache_size 65536
setprop debug.hwui.gradient_cache_size 65536
setprop debug.hwui.drop_shadow_cache_size 65536
setprop debug.hwui.cache_size 65536
setprop debug.hwui.gradient_cache_size 65536
setprop debug.hwui.render_pipeline_cache_size 65536
setprop debug.hwui.cache_size 65536
setprop debug.hwui.resource_cache_size 65536
setprop debug.hwui.fbo_cache_size 65536
setprop debug.hwui.pipeline_cache_size 65536
setprop debug.hwui.buffer_cache_size 65536
setprop debug.hwui.layer_pool_size 65536
setprop debug.hwui.r_buffer_cache_size 65536
setprop debug.hwui.shadow.renderer monolithic
setprop debug.hwui.shape_cache_size 65536
setprop debug.hwui.disable_scissor_opt true        
setprop debug.sf.early_app_phase_offset_ns 1000000
setprop debug.sf.early_gl_app_phase_offset_ns 1000000
setprop debug.sf.early_gl_phase_offset_ns 1000000
setprop debug.sf.early_phase_offset_ns 1000000
setprop debug.sf.high_fps_early_gl_phase_offset_ns 1000000
setprop debug.sf.high_fps_late_app_phase_offset_ns 1000000
setprop debug.sf.high_fps_late_sf_phase_offset_ns 1000000
setprop debug.sf.early.app.duration 13666666
setprop debug.sf.early.sf.duration 10500000
setprop debug.sf.earlyGl.app.duration 13666666
setprop debug.sf.earlyGl.sf.duration 10500000
setprop debug.sf.late.app.duration 13666666
setprop debug.sf.late.sf.duration 10500000
setprop debug.sf.region_sampling_period_ns 200000000
setprop debug.sf.region_sampling_timer_timeout_ns 200000000
settings put global window_animation_scale 0
settings put global transition_animation_scale 0
settings put global animator_duration_scale 0
settings put global gpu_debug_layers 0
settings put global enable_gpu_debug_layers 0
settings put global game_mode_enable 1
settings put global perf_mode 1
settings put global angle_gl_driver_selection_pkgs com.dts.freefiremax,com.dts.freefireth
settings put global angle_gl_driver_selection_values angle,angle
settings put global GPUTUNER_SWITCH true
settings put global CPUTUNER_SWITCH true
setprop debug_app 0
setprop dalvik.vm.dexopt-flags m=y,v=n,o=v,u=n
setprop dalvik.vm.checkjni 0
setprop dalvik.vm.dex2oat-minidebuginfo false
setprop dalvik.vm.minidebuginfo false
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
echo "[INFO] $(date '+%H:%M:%S'): OFF Logcat VIP "
sleep 1
echo "[INFO] $(date '+%H:%M:%S'): ON RENDER if sp "
sleep 1
echo "[INFO] $(date '+%H:%M:%S'): Fix Drop Fps "
sleep 1
echo "[INFO] $(date '+%H:%M:%S'): RAM VIP FOR 2/3/4GB"

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
echo "[WARNING] $(date '+%H:%M:%S'): Modules V5 Đã Chạy Thành Công" >> /sdcard/log.txt
cmd notification post -S bigtext -t '[WARNNING]: Vui lòng khởi động lại để có tác dụng ' 'Tag' 'Thanks'
