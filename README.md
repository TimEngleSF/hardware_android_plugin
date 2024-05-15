# Android Hardware Detection Plugin

## Contents

-   `addons/` contains GetHardware plugin
-   `demo_app` contains Godot_app with plugin already set up

## Installation

1. Place `GetHardware/` dir located in [`addons/`](./addons/) to project's `addons/`
2. Enable Plugin
    - In Menu Bar click `Project` -> `Project Settings`
    - Locate `Plugins` tab and enable `GetHardware` plugin
3. Enable Gradle Build
    - In Menu Bar click `Project` -> `Export`
    - Select `Android`
    - Check and Enable `Use Gradle Build`

## Usage

Refer to [Link Text](./demo_app/game.gd)

## Plugin Functions

-   **getTotalRAM()**
    -   returns Total RAM in MB
-   **getNonVolatileMemoryInfo()**
    -   returns Non Volitle Memory in MB
-   **getAndroidVersion()**
    -   returns android os version as a string. Ex: "10.0.0"
-   **getCPUInfo()**
    -   returns CPU architecture as a string
-   **getCPUSpeed()**
    -   returns CPU speed in bigoMIPS
