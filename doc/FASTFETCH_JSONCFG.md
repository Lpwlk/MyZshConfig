# Fastfetch formatting cheatsheet

> This cheatsheet has been generated using shell scripting and Fastfetch built-in commands such as `fastfetch --list-modules` and `fastfetch --help <moduleName>-format`

> Author: Pawlicki Loïc (Lpwlk) on 06/08/2025

## Available modules

```
1)  Battery       : Print battery capacity, status, etc  
2)  BIOS          : Print information of 1st-stage bootloader (name, version, release date, etc)  
3)  Bluetooth     : List (connected) bluetooth devices  
4)  BluetoothRadio: List bluetooth radios width supported version and vendor  
5)  Board         : Print motherboard name and other info  
6)  Bootmgr       : Print information of 2nd-stage bootloader (name, firmware, etc)  
7)  Break         : Print a empty line  
8)  Brightness    : Print current brightness level of your monitors  
9)  Btrfs         : Print Linux BTRFS volumes  
10) Camera        : Print available cameras  
11) Chassis       : Print chassis type (desktop, laptop, etc)  
12) Command       : Run custom shell scripts  
13) Colors        : Print some colored blocks  
14) CPU           : Print CPU name, frequency, etc  
15) CPUCache      : Print CPU cache sizes  
16) CPUUsage      : Print CPU usage. Costs some time to collect data  
17) Cursor        : Print cursor style name  
18) Custom        : Print a custom string, with or without key  
19) DateTime      : Print current date and time  
20) DE            : Print desktop environment name  
21) Display       : Print resolutions, refresh rates, etc  
22) Disk          : Print partitions, space usage, file system, etc  
23) DiskIO        : Print physical disk I/O throughput  
24) DNS           : Print configured DNS servers  
25) Editor        : Print information of the default editor ($VISUAL or $EDITOR)  
26) Font          : Print system font names  
27) Gamepad       : List (connected) gamepads  
28) GPU           : Print GPU names, graphic memory size, type, etc  
29) Host          : Print product name of your computer  
30) Icons         : Print icon style name  
31) InitSystem    : Print init system (pid 1) name and version  
32) Kernel        : Print system kernel version  
33) Keyboard      : List (connected) keyboards  
34) LM            : Print login manager (desktop manager) name and version   
35) Loadavg       : Print system load averages  
36) Locale        : Print system locale name  
37) LocalIp       : List local IP addresses (v4 or v6), MAC addresses, etc  
38) Media         : Print playing song name  
39) Memory        : Print system memory usage info  
40) Monitor       : Alias of Display module  
41) Mouse         : List connected mouses  
42) NetIO         : Print network I/O throughput  
43) OpenCL        : Print highest OpenCL version supported by the GPU  
44) OpenGL        : Print highest OpenGL version supported by the GPU  
45) OS            : Print operating system name and version  
46) Packages      : List installed package managers and count of installed packages  
47) PhysicalDisk  : Print physical disk information  
48) PhysicalMemory: Print system physical memory devices  
49) Player        : Print music player name  
50) PowerAdapter  : Print power adapter name and charging watts  
51) Processes     : Print number of running processes  
52) PublicIp      : Print your public IP address, etc  
53) Separator     : Print a separator line  
54) Shell         : Print current shell name and version  
55) Sound         : Print sound devices, volume, etc  
56) Swap          : Print swap (paging file) space usage  
57) Terminal      : Print current terminal name and version  
58) TerminalFont  : Print font name and size used by current terminal  
59) TerminalSize  : Print current terminal size  
60) TerminalTheme : Print current terminal theme (foreground and background colors)  
61) Title         : Print title, which contains your user name, hostname  
62) Theme         : Print current theme of desktop environment  
63) TPM           : Print info of Trusted Platform Module (TPM) Security Device  
64) Uptime        : Print how long system has been running  
65) Users         : Print users currently logged in  
66) Version       : Print Fastfetch version  
67) Vulkan        : Print highest Vulkan version supported by the GPU  
68) Wallpaper     : Print image file path of current wallpaper  
69) Weather       : Print weather information  
70) WM            : Print window manager name and version  
71) Wifi          : Print connected Wi-Fi info (SSID, connection and security protocol)  
72) WMTheme       : Print current theme of window manager  
73) Zpool         : Print ZFS storage pools 
```

## Modules formatting options
> Ctrl+F `<moduleName> format help` to find module-specific formatting options

### Battery format help
`--battery-format`
~~~
Sets the format string for Battery output.

The following values are passed:
    manufacturer {1}: Battery manufacturer
      model-name {2}: Battery model name
      technology {3}: Battery technology
        capacity {4}: Battery capacity (percentage num)
          status {5}: Battery status
     temperature {6}: Battery temperature (formatted)
     cycle-count {7}: Battery cycle count
          serial {8}: Battery serial number
manufacture-date {9}: Battery manufactor date
    capacity-bar {10}: Battery capacity (percentage bar)
       time-days {11}: Battery time remaining days
      time-hours {12}: Battery time remaining hours
    time-minutes {13}: Battery time remaining minutes
    time-seconds {14}: Battery time remaining seconds
~~~

### BIOS format help
`--bios-format`
~~~
Sets the format string for BIOS output.

The following values are passed:
            date {1}: Bios date
         release {2}: Bios release
          vendor {3}: Bios vendor
         version {4}: Bios version
            type {5}: Firmware type
~~~

### Bluetooth format help
`--bluetooth-format`
~~~
Sets the format string for Bluetooth output.

The following values are passed:
            name {1}: Name
         address {2}: Address
            type {3}: Type
battery-percentage {4}: Battery percentage number
       connected {5}: Is connected
battery-percentage-bar {6}: Battery percentage bar
~~~

### BluetoothRadio format help
`--bluetoothradio-format`
~~~
Sets the format string for BluetoothRadio output.

The following values are passed:
            name {1}: Radio name for discovering
         address {2}: Address
     lmp-version {3}: LMP version
  lmp-subversion {4}: LMP subversion
         version {5}: Bluetooth version
          vendor {6}: Vendor
    discoverable {7}: Discoverable
     connectable {8}: Connectable / Pairable
~~~

### Board format help
`--board-format`
~~~
Sets the format string for Board output.

The following values are passed:
            name {1}: Board name
          vendor {2}: Board vendor
         version {3}: Board version
          serial {4}: Board serial number
~~~

### Bootmgr format help
`--bootmgr-format`
~~~
Sets the format string for Bootmgr output.

The following values are passed:
            name {1}: Name / description
   firmware-path {2}: Firmware file path
   firmware-name {3}: Firmware file name
     secure-boot {4}: Is secure boot enabled
           order {5}: Boot order
~~~

### Break format help
~~~
Module 'Break' doesn't support output formatting
~~~

### Brightness format help
`--brightness-format`
~~~
Sets the format string for Brightness output.

The following values are passed:
      percentage {1}: Screen brightness (percentage num)
            name {2}: Screen name
             max {3}: Maximum brightness value
             min {4}: Minimum brightness value
         current {5}: Current brightness value
  percentage-bar {6}: Screen brightness (percentage bar)
      is-builtin {7}: Is built-in screen
~~~

### Btrfs format help
`--btrfs-format`
~~~
Sets the format string for Btrfs output.

The following values are passed:
            name {1}: Name / Label
            uuid {2}: UUID
         devices {3}: Associated devices
        features {4}: Enabled features
            used {5}: Size used
       allocated {6}: Size allocated
           total {7}: Size total
 used-percentage {8}: Used percentage num
allocated-percentage {9}: Allocated percentage num
used-percentage-bar {10}: Used percentage bar
allocated-percentage-bar {11}: Allocated percentage bar
       node-size {12}: Node size
     sector-size {13}: Sector size
~~~

### Camera format help
`--camera-format`
~~~
Sets the format string for Camera output.

The following values are passed:
            name {1}: Device name
          vendor {2}: Vendor
      colorspace {3}: Color space
              id {4}: Identifier
           width {5}: Width (in px)
          height {6}: Height (in px)
~~~

### Chassis format help
`--chassis-format`
~~~
Sets the format string for Chassis output.

The following values are passed:
            type {1}: Chassis type
          vendor {2}: Chassis vendor
         version {3}: Chassis version
          serial {4}: Chassis serial number
~~~

### Command format help
`--command-format`
~~~
Sets the format string for Command output.

The following values are passed:
          result {1}: Command result
~~~

### Colors format help
~~~
Module 'Colors' doesn't support output formatting
~~~

### CPU format help
`--cpu-format`
~~~
Sets the format string for CPU output.

The following values are passed:
            name {1}: Name
          vendor {2}: Vendor
  cores-physical {3}: Physical core count
   cores-logical {4}: Logical core count
    cores-online {5}: Online core count
       freq-base {6}: Base frequency (formatted)
        freq-max {7}: Max frequency (formatted)
     temperature {8}: Temperature (formatted)
      core-types {9}: Logical core count grouped by frequency
        packages {10}: Processor package count
~~~

### CPUCache format help
`--cpucache-format`
~~~
Sets the format string for CPUCache output.

The following values are passed:
          result {1}: Separate result
             sum {2}: Sum result
~~~

### CPUUsage format help
`--cpuusage-format`
~~~
Sets the format string for CPUUsage output.

The following values are passed:
             avg {1}: CPU usage (percentage num, average)
             max {2}: CPU usage (percentage num, maximum)
       max-index {3}: CPU core index of maximum usage
             min {4}: CPU usage (percentage num, minimum)
       min-index {5}: CPU core index of minimum usage
         avg-bar {6}: CPU usage (percentage bar, average)
         max-bar {7}: CPU usage (percentage bar, maximum)
         min-bar {8}: CPU usage (percentage bar, minimum)
~~~

### Cursor format help
`--cursor-format`
~~~
Sets the format string for Cursor output.

The following values are passed:
           theme {1}: Cursor theme
            size {2}: Cursor size
~~~

### Custom format help
~~~
'Custom' doesn't support output formatting
~~~

### DateTime format help
`--datetime-format`
~~~
Sets the format string for DateTime output.

The following values are passed:
            year {1}: Year
      year-short {2}: Last two digits of year
           month {3}: Month
    month-pretty {4}: Month with leading zero
      month-name {5}: Month name
month-name-short {6}: Month name short
            week {7}: Week number on year
         weekday {8}: Weekday
   weekday-short {9}: Weekday short
     day-in-year {10}: Day in year
    day-in-month {11}: Day in month
     day-in-week {12}: Day in week
            hour {13}: Hour
     hour-pretty {14}: Hour with leading zero
         hour-12 {15}: Hour 12h format
  hour-12-pretty {16}: Hour 12h format with leading zero
          minute {17}: Minute
   minute-pretty {18}: Minute with leading zero
          second {19}: Second
   second-pretty {20}: Second with leading zero
 offset-from-utc {21}: Offset from UTC in the ISO 8601 format
   timezone-name {22}: Locale-dependent timezone name or abbreviation
      day-pretty {23}: Day in month with leading zero
~~~

### DE format help
`--de-format`
~~~
Sets the format string for DE output.

The following values are passed:
    process-name {1}: DE process name
     pretty-name {2}: DE pretty name
         version {3}: DE version
~~~

### Display format help
`--display-format`
~~~
Sets the format string for Display output.

The following values are passed:
           width {1}: Screen configured width (in pixels)
          height {2}: Screen configured height (in pixels)
    refresh-rate {3}: Screen configured refresh rate (in Hz)
    scaled-width {4}: Screen scaled width (in pixels)
   scaled-height {5}: Screen scaled height (in pixels)
            name {6}: Screen name
            type {7}: Screen type (Built-in or External)
        rotation {8}: Screen rotation (in degrees)
      is-primary {9}: True if being the primary screen
  physical-width {10}: Screen physical width (in millimeters)
 physical-height {11}: Screen physical height (in millimeters)
            inch {12}: Physical diagonal length in inches
             ppi {13}: Pixels per inch (PPI)
       bit-depth {14}: Bits per color channel
     hdr-enabled {15}: True if high dynamic range (HDR) mode is enabled
manufacture-year {16}: Year of manufacturing
manufacture-week {17}: Nth week of manufacturing in the year
          serial {18}: Serial number
    platform-api {19}: The platform API used when detecting the display
  hdr-compatible {20}: True if the display is HDR compatible
    scale-factor {21}: HiDPI scale factor
 preferred-width {22}: Screen preferred width (in pixels)
preferred-height {23}: Screen preferred height (in pixels)
preferred-refresh-rate {24}: Screen preferred refresh rate (in Hz)
~~~

### Disk format help
`--disk-format`
~~~
Sets the format string for Disk output.

The following values are passed:
       size-used {1}: Size used
      size-total {2}: Size total
 size-percentage {3}: Size percentage num
      files-used {4}: Files used
     files-total {5}: Files total
files-percentage {6}: Files percentage num
     is-external {7}: True if external volume
       is-hidden {8}: True if hidden volume
      filesystem {9}: Filesystem
            name {10}: Label / name
     is-readonly {11}: True if read-only
     create-time {12}: Create time in local timezone
size-percentage-bar {13}: Size percentage bar
files-percentage-bar {14}: Files percentage bar
            days {15}: Days after creation
           hours {16}: Hours after creation
         minutes {17}: Minutes after creation
         seconds {18}: Seconds after creation
    milliseconds {19}: Milliseconds after creation
      mountpoint {20}: Mount point / drive letter
      mount-from {21}: Mount from (device path)
           years {22}: Years integer after creation
    days-of-year {23}: Days of year after creation
  years-fraction {24}: Years fraction after creation
~~~

### DiskIO format help
`--diskio-format`
~~~
Sets the format string for DiskIO output.

The following values are passed:
       size-read {1}: Size of data read [per second] (formatted)
    size-written {2}: Size of data written [per second] (formatted)
            name {3}: Device name
        dev-path {4}: Device raw file path
      bytes-read {5}: Size of data read [per second] (in bytes)
   bytes-written {6}: Size of data written [per second] (in bytes)
      read-count {7}: Number of reads
     write-count {8}: Number of writes
~~~

### DNS format help
`--dns-format`
~~~
Sets the format string for DNS output.

The following values are passed:
          result {1}: DNS result
~~~

### Editor format help
`--editor-format`
~~~
Sets the format string for Editor output.

The following values are passed:
            type {1}: Type (Visual / Editor)
            name {2}: Name
        exe-name {3}: Exe name of real path
       full-path {4}: Full path of real path
         version {5}: Version
~~~

### Font format help
`--font-format`
~~~
Sets the format string for Font output.

The following values are passed:
           font1 {1}: Font 1
           font2 {2}: Font 2
           font3 {3}: Font 3
           font4 {4}: Font 4
        combined {5}: Combined fonts for display
~~~

### Gamepad format help
`--gamepad-format`
~~~
Sets the format string for Gamepad output.

The following values are passed:
            name {1}: Name
          serial {2}: Serial number
battery-percentage {3}: Battery percentage num
battery-percentage-bar {4}: Battery percentage bar
~~~

### GPU format help
`--gpu-format`
~~~
Sets the format string for GPU output.

The following values are passed:
          vendor {1}: GPU vendor
            name {2}: GPU name
          driver {3}: GPU driver
     temperature {4}: GPU temperature
      core-count {5}: GPU core count
            type {6}: GPU type
 dedicated-total {7}: GPU total dedicated memory
  dedicated-used {8}: GPU used dedicated memory
    shared-total {9}: GPU total shared memory
     shared-used {10}: GPU used shared memory
    platform-api {11}: The platform API used when detecting the GPU
       frequency {12}: Current frequency in GHz
           index {13}: GPU vendor specific index
dedicated-percentage-num {14}: Dedicated memory usage percentage num
dedicated-percentage-bar {15}: Dedicated memory usage percentage bar
shared-percentage-num {16}: Shared memory usage percentage num
shared-percentage-bar {17}: Shared memory usage percentage bar
  core-usage-num {18}: Core usage percentage num
  core-usage-bar {19}: Core usage percentage bar
     memory-type {20}: Memory type (Windows only)
~~~

### Host format help
`--host-format`
~~~
Sets the format string for Host output.

The following values are passed:
          family {1}: Product family
            name {2}: Product name
         version {3}: Product version
             sku {4}: Product sku
          vendor {5}: Product vendor
          serial {6}: Product serial number
            uuid {7}: Product uuid
~~~

### Icons format help
`--icons-format`
~~~
Sets the format string for Icons output.

The following values are passed:
          icons1 {1}: Icons part 1
          icons2 {2}: Icons part 2
~~~

### InitSystem format help
`--initsystem-format`
~~~
Sets the format string for InitSystem output.

The following values are passed:
            name {1}: Init system name
             exe {2}: Init system exe path
         version {3}: Init system version path
             pid {4}: Init system pid
~~~

### Kernel format help
`--kernel-format`
~~~
Sets the format string for Kernel output.

The following values are passed:
         sysname {1}: Sysname
         release {2}: Release
         version {3}: Version
            arch {4}: Architecture
 display-version {5}: Display version
       page-size {6}: Page size
~~~

### Keyboard format help
`--keyboard-format`
~~~
Sets the format string for Keyboard output.

The following values are passed:
            name {1}: Name
          serial {2}: Serial number
~~~

### LM format help
`--lm-format`
~~~
Sets the format string for LM output.

The following values are passed:
         service {1}: LM service
            type {2}: LM type
         version {3}: LM version
~~~

### Loadavg format help
`--loadavg-format`
~~~
Sets the format string for Loadavg output.

The following values are passed:
        loadavg1 {1}: Load average over 1min
        loadavg2 {2}: Load average over 5min
        loadavg3 {3}: Load average over 15min
~~~

### Locale format help
`--locale-format`
~~~
Sets the format string for Locale output.

The following values are passed:
          result {1}: Locale code
~~~

### LocalIp format help
`--localip-format`
~~~
Sets the format string for LocalIp output.

The following values are passed:
            ipv4 {1}: IPv4 address
            ipv6 {2}: IPv6 address
             mac {3}: MAC address
          ifname {4}: Interface name
is-default-route {5}: Is default route
             mtu {6}: MTU size in bytes
           speed {7}: Link speed (formatted)
           flags {8}: Interface flags
~~~

### Media format help
`--media-format`
~~~
Sets the format string for Media output.

The following values are passed:
        combined {1}: Pretty media name
           title {2}: Media name
          artist {3}: Artist name
           album {4}: Album name
          status {5}: Status
~~~

### Memory format help
`--memory-format`
~~~
Sets the format string for Memory output.

The following values are passed:
            used {1}: Used size
           total {2}: Total size
      percentage {3}: Percentage used (num)
  percentage-bar {4}: Percentage used (bar)
~~~

### Monitor format help
`--monitor-format`
~~~
Sets the format string for Monitor output.

The following values are passed:
            name {1}: Display name
           width {2}: Native resolution width in pixels
          height {3}: Native resolution height in pixels
  physical-width {4}: Physical width in millimeters
 physical-height {5}: Physical height in millimeters
            inch {6}: Physical diagonal length in inches
             ppi {7}: Pixels per inch (PPI)
manufacture-year {8}: Year of manufacturing
manufacture-week {9}: Nth week of manufacturing in the year
          serial {10}: Serial number
    refresh-rate {11}: Maximum refresh rate in Hz
  hdr-compatible {12}: True if the display is HDR compatible
~~~

### Mouse format help
`--mouse-format`
~~~
Sets the format string for Mouse output.

The following values are passed:
            name {1}: Mouse name
          serial {2}: Mouse serial number
~~~

### NetIO format help
`--netio-format`
~~~
Sets the format string for NetIO output.

The following values are passed:
         rx-size {1}: Size of data received [per second] (formatted)
         tx-size {2}: Size of data sent [per second] (formatted)
          ifname {3}: Interface name
is-default-route {4}: Is default route
        rx-bytes {5}: Size of data received [per second] (in bytes)
        tx-bytes {6}: Size of data sent [per second] (in bytes)
      rx-packets {7}: Number of packets received [per second]
      tx-packets {8}: Number of packets sent [per second]
       rx-errors {9}: Number of errors received [per second]
       tx-errors {10}: Number of errors sent [per second]
        rx-drops {11}: Number of packets dropped when receiving [per second]
        tx-drops {12}: Number of packets dropped when sending [per second]
~~~

### OpenCL format help
`--opencl-format`
~~~
Sets the format string for OpenCL output.

The following values are passed:
         version {1}: Platform version
            name {2}: Platform name
          vendor {3}: Platform vendor
~~~

### OpenGL format help
`--opengl-format`
~~~
Sets the format string for OpenGL output.

The following values are passed:
         version {1}: OpenGL version
        renderer {2}: OpenGL renderer
          vendor {3}: OpenGL vendor
             slv {4}: OpenGL shading language version
         library {5}: OpenGL library used
~~~

### OS format help
`--os-format`
~~~
Sets the format string for OS output.

The following values are passed:
         sysname {1}: Name of the kernel
            name {2}: Name of the OS
     pretty-name {3}: Pretty name of the OS, if available
              id {4}: ID of the OS
         id-like {5}: ID like of the OS
         variant {6}: Variant of the OS
      variant-id {7}: Variant ID of the OS
         version {8}: Version of the OS
      version-id {9}: Version ID of the OS
        codename {10}: Version codename of the OS
        build-id {11}: Build ID of the OS
            arch {12}: Architecture of the OS
~~~

### Packages format help
`--packages-format`
~~~
Sets the format string for Packages output.

The following values are passed:
             all {1}: Number of all packages
          pacman {2}: Number of pacman packages
   pacman-branch {3}: Pacman branch on manjaro
            dpkg {4}: Number of dpkg packages
             rpm {5}: Number of rpm packages
          emerge {6}: Number of emerge packages
           eopkg {7}: Number of eopkg packages
            xbps {8}: Number of xbps packages
      nix-system {9}: Number of nix-system packages
        nix-user {10}: Number of nix-user packages
     nix-default {11}: Number of nix-default packages
             apk {12}: Number of apk packages
             pkg {13}: Number of pkg packages
  flatpak-system {14}: Number of flatpak-system app packages
    flatpak-user {15}: Number of flatpak-user app packages
            snap {16}: Number of snap packages
            brew {17}: Number of brew packages
       brew-cask {18}: Number of brew-cask packages
        macports {19}: Number of macports packages
           scoop {20}: Number of scoop packages
           choco {21}: Number of choco packages
         pkgtool {22}: Number of pkgtool packages
         paludis {23}: Number of paludis packages
          winget {24}: Number of winget packages
            opkg {25}: Number of opkg packages
       am-system {26}: Number of am-system packages
         sorcery {27}: Number of sorcery packages
            lpkg {28}: Number of lpkg packages
       lpkgbuild {29}: Number of lpkgbuild packages
     guix-system {30}: Number of guix-system packages
       guix-user {31}: Number of guix-user packages
       guix-home {32}: Number of guix-home packages
        linglong {33}: Number of linglong packages
        pacstall {34}: Number of pacstall packages
           mport {35}: Number of mport packages
              qi {36}: Number of qi packages
         am-user {37}: Number of am-user (aka appman) packages
          pkgsrc {38}: Number of pkgsrc packages
     hpkg-system {39}: Number of hpkg-system packages
       hpkg-user {40}: Number of hpkg-user packages
            pisi {41}: Number of pisi packages
            soar {42}: Number of soar packages
         nix-all {43}: Total number of all nix packages
     flatpak-all {44}: Total number of all flatpak app packages
        brew-all {45}: Total number of all brew packages
        guix-all {46}: Total number of all guix packages
        hpkg-all {47}: Total number of all hpkg packages
~~~

### PhysicalDisk format help
`--physicaldisk-format`
~~~
Sets the format string for PhysicalDisk output.

The following values are passed:
            size {1}: Device size (formatted)
            name {2}: Device name
    interconnect {3}: Device interconnect type
        dev-path {4}: Device raw file path
          serial {5}: Serial number
   physical-type {6}: Device kind (SSD or HDD)
  removable-type {7}: Device kind (Removable or Fixed)
   readonly-type {8}: Device kind (Read-only or Read-write)
        revision {9}: Product revision
     temperature {10}: Device temperature (formatted)
~~~

### PhysicalMemory format help
`--physicalmemory-format`
~~~
Sets the format string for PhysicalMemory output.

The following values are passed:
           bytes {1}: Size (in bytes)
            size {2}: Size formatted
       max-speed {3}: Max speed (in MT/s)
   running-speed {4}: Running speed (in MT/s)
            type {5}: Type (DDR4, DDR5, etc.)
     form-factor {6}: Form factor (SODIMM, DIMM, etc.)
         locator {7}: Bank/Device Locator (BANK0/SIMM0, BANK0/SIMM1, etc.)
          vendor {8}: Vendor
          serial {9}: Serial number
     part-number {10}: Part number
  is-ecc-enabled {11}: True if ECC enabled
~~~

### Player format help
`--player-format`
~~~
Sets the format string for Player output.

The following values are passed:
          player {1}: Pretty player name
            name {2}: Player name
              id {3}: Player Identifier
             url {4}: URL name
~~~

### PowerAdapter format help
`--poweradapter-format`
~~~
Sets the format string for PowerAdapter output.

The following values are passed:
           watts {1}: Power adapter watts
            name {2}: Power adapter name
    manufacturer {3}: Power adapter manufacturer
           model {4}: Power adapter model
     description {5}: Power adapter description
          serial {6}: Power adapter serial number
~~~

### Processes format help
`--processes-format`
~~~
Sets the format string for Processes output.

The following values are passed:
          result {1}: Process count
~~~

### PublicIp format help
`--publicip-format`
~~~
Sets the format string for PublicIp output.

The following values are passed:
              ip {1}: Public IP address
        location {2}: Location
~~~

### Separator format help
~~~
'Separator' doesn't support output formatting
~~~

### Shell format help
`--shell-format`
~~~
Sets the format string for Shell output.

The following values are passed:
    process-name {1}: Shell process name
             exe {2}: The first argument of the command line when running the shell
        exe-name {3}: Shell base name of arg0
         version {4}: Shell version
             pid {5}: Shell pid
     pretty-name {6}: Shell pretty name
        exe-path {7}: Shell full exe path
             tty {8}: Shell tty used
~~~

### Sound format help
`--sound-format`
~~~
Sets the format string for Sound output.

The following values are passed:
         is-main {1}: Is main sound device
            name {2}: Device name
volume-percentage {3}: Volume (in percentage num)
      identifier {4}: Identifier
volume-percentage-bar {5}: Volume (in percentage bar)
    platform-api {6}: Platform API used
~~~

### Swap format help
`--swap-format`
~~~
Sets the format string for Swap output.

The following values are passed:
            used {1}: Used size
           total {2}: Total size
      percentage {3}: Percentage used (num)
  percentage-bar {4}: Percentage used (bar)
            name {5}: Name
~~~

### Terminal format help
`--terminal-format`
~~~
Sets the format string for Terminal output.

The following values are passed:
    process-name {1}: Terminal process name
             exe {2}: The first argument of the command line when running the terminal
        exe-name {3}: Terminal base name of arg0
             pid {4}: Terminal pid
     pretty-name {5}: Terminal pretty name
         version {6}: Terminal version
        exe-path {7}: Terminal full exe path
             tty {8}: Terminal tty / pts used
~~~

### TerminalFont format help
`--terminalfont-format`
~~~
Sets the format string for TerminalFont output.

The following values are passed:
        combined {1}: Terminal font combined
            name {2}: Terminal font name
            size {3}: Terminal font size
          styles {4}: Terminal font styles
~~~

### TerminalSize format help
`--terminalsize-format`
~~~
Sets the format string for TerminalSize output.

The following values are passed:
            rows {1}: Terminal rows
         columns {2}: Terminal columns
           width {3}: Terminal width (in pixels)
          height {4}: Terminal height (in pixels)
~~~

### TerminalTheme format help
`--terminaltheme-format`
~~~
Sets the format string for TerminalTheme output.

The following values are passed:
        fg-color {1}: Terminal foreground color
         fg-type {2}: Terminal foreground type (Dark / Light)
        bg-color {3}: Terminal background color
         bg-type {4}: Terminal background type (Dark / Light)
~~~

### Title format help
`--title-format`
~~~
Sets the format string for Title output.

The following values are passed:
       user-name {1}: User name
       host-name {2}: Host name
        home-dir {3}: Home directory
        exe-path {4}: Executable path of current process
      user-shell {5}: User's default shell
user-name-colored {6}: User name (colored)
at-symbol-colored {7}: @ symbol (colored)
host-name-colored {8}: Host name (colored)
  full-user-name {9}: Full user name
~~~

### Theme format help
`--theme-format`
~~~
Sets the format string for Theme output.

The following values are passed:
          theme1 {1}: Theme part 1
          theme2 {2}: Theme part 2
~~~

### TPM format help
`--tpm-format`
~~~
Sets the format string for TPM output.

The following values are passed:
         version {1}: TPM device version
     description {2}: TPM general description
~~~

### Uptime format help
`--uptime-format`
~~~
Sets the format string for Uptime output.

The following values are passed:
            days {1}: Days after boot
           hours {2}: Hours after boot
         minutes {3}: Minutes after boot
         seconds {4}: Seconds after boot
    milliseconds {5}: Milliseconds after boot
       boot-time {6}: Boot time in local timezone
           years {7}: Years integer after boot
    days-of-year {8}: Days of year after boot
  years-fraction {9}: Years fraction after boot
~~~

### Users format help
`--users-format`
~~~
Sets the format string for Users output.

The following values are passed:
            name {1}: User name
       host-name {2}: Host name
         session {3}: Session name
       client-ip {4}: Client IP
      login-time {5}: Login Time in local timezone
            days {6}: Days after login
           hours {7}: Hours after login
         minutes {8}: Minutes after login
         seconds {9}: Seconds after login
    milliseconds {10}: Milliseconds after login
           years {11}: Years integer after login
    days-of-year {12}: Days of year after login
  years-fraction {13}: Years fraction after login
~~~

### Version format help
`--version-format`
~~~
Sets the format string for Version output.

The following values are passed:
            name {1}: Project name
         version {2}: Version
   version-tweak {3}: Version tweak
      build-type {4}: Build type (debug or release)
         sysname {5}: System name
            arch {6}: Architecture
cmake-built-type {7}: CMake build type when compiling (Debug, Release, RelWithDebInfo, MinSizeRel)
    compile-time {8}: Date time when compiling
        compiler {9}: Compiler used when compiling
            libc {10}: Libc used when compiling
~~~

### Vulkan format help
`--vulkan-format`
~~~
Sets the format string for Vulkan output.

The following values are passed:
          driver {1}: Driver name
     api-version {2}: API version
conformance-version {3}: Conformance version
instance-version {4}: Instance version
~~~

### Wallpaper format help
`--wallpaper-format`
~~~
Sets the format string for Wallpaper output.

The following values are passed:
       file-name {1}: File name
       full-path {2}: Full path
~~~

### Weather format help
`--weather-format`
~~~
Sets the format string for Weather output.

The following values are passed:
          result {1}: Weather result
~~~

### WM format help
`--wm-format`
~~~
Sets the format string for WM output.

The following values are passed:
    process-name {1}: WM process name
     pretty-name {2}: WM pretty name
   protocol-name {3}: WM protocol name
     plugin-name {4}: WM plugin name
         version {5}: WM version
~~~

### Wifi format help
`--wifi-format`
~~~
Sets the format string for Wifi output.

The following values are passed:
        inf-desc {1}: Interface description
      inf-status {2}: Interface status
          status {3}: Connection status
            ssid {4}: Connection SSID
           bssid {5}: Connection BSSID
        protocol {6}: Connection protocol
  signal-quality {7}: Connection signal quality (percentage num)
         rx-rate {8}: Connection RX rate
         tx-rate {9}: Connection TX rate
        security {10}: Connection Security algorithm
signal-quality-bar {11}: Connection signal quality (percentage bar)
         channel {12}: Connection channel number
            band {13}: Connection channel band in GHz
~~~

### WMTheme format help
`--wmtheme-format`
~~~
Sets the format string for WMTheme output.

The following values are passed:
          result {1}: WM theme
~~~

### Zpool format help
`--zpool-format`
~~~
Sets the format string for Zpool output.

The following values are passed:
            name {1}: Zpool name
           state {2}: Zpool state
            used {3}: Size used
           total {4}: Size total
 used-percentage {5}: Size percentage num
fragmentation-percentage {6}: Fragmentation percentage num
used-percentage-bar {7}: Size percentage bar
fragmentation-percentage-bar {8}: Fragmentation percentage bar
~~~

