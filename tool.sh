tool() {
cmd package install-existing com.xiaomi.joyose
cmd package install-existing com.xiaomi.glgm
cmd package install-existing com.samsung.android.game.gos
cmd package install-existing com.samsung.android.game.gametools
cmd package install-existing com.samsung.android.game.gamehome
settings delete system speed_pointer
settings delete system game-touchscreen-boost
settings delete system touch.pressure.scale
settings delete system touch_slop
settings delete system touch_boost
settings delete system ram_boost
settings delete system cpu_boost
settings delete system gpu_boost
settings delete system ui.hw
settings delete secure long_press_timeout
settings delete secure multi_press_timeout
settings delete secure speed_mode
settings delete secure speed_mode_enable
settings delete secure game_auto_temperature
settings delete secure game_dashboard_always_on
}
tool > /dev/null 2>&1 && echo "done"