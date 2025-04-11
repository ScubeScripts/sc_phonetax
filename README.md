![gitthumps (2)](https://github.com/user-attachments/assets/7c827984-b381-411d-be8f-245963ca9fec)

Hello friends,

Today I would like to introduce you to the new version of `sc_phonetax`. This version offers you an incredible number of setting options and you can choose between three different notification systems. For players who do not only have one item as a phone, several items can now be stored. All necessary settings can be found in the `config.lua` file.

**New in this version:**

1. **QBCore support:** The system is now also fully compatible with the QBCore framework and thus offers a broader usability.
2. **Own notification system:** The dependency on `ox_lib` has been removed. Instead, the script now uses our own notification system `sc_notify`. Alternatively, the standard notifications from ESX and QBCore or the `bulletin` system can still be used.
3. **Optimized code:** The code has been fundamentally optimized to improve the performance and efficiency of the script.
4. **Multiple phone items:** Multiple items can now be stored in the configuration that are counted as a phone.

## Our notification system

> [sc_notify](https://github.com/ScubeScripts/sc_notify)

## Requirements

> [ESX-Legacy](https://github.com/esx-framework/esx-legacy)

or

> [QBCore](https://github.com/qbcore-framework/qb-core)

## Installation
Clone or download this repository

Add `sc_phonetax` to your `resources` folder

Add this to your `server.cfg`:
```
ensure sc_phonetax 
```
