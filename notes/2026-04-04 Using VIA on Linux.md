---
title: Using VIA on Linux
date: 2026-04-04
---
Currently Firefox doesn't support WebHID (an API to allow browsers to
communicate with HID devices).

Whilst this is the case, I've been using Ungoogled Chromium installed
via Flatpak.

Without making any changes, you are presented with the following error
message:

```
20:34:21.706
NotAllowedError: Failed to open the device.
Device: Keychron Keychron K6 Pro
Vid: 0x3434
Pid: 0x0261

20:34:21.713
Received invalid protocol version from device
Device: Keychron Keychron K6 Pro
Vid: 0x3434
Pid: 0x0261
```

To resolve this, open <chrome://device-log> and look for a message similar to
the following `[20:34:21] Failed to open '/dev/hidraw9': FILE_ERROR_ACCESS_DENIED`.

The solution to this is running `sudo chmod 666 /dev/hidraw9`, when you reboot
or disconnect the device the permissions change will undo itself.

Happy tinkering!

Related:
- [2025-04-04 Keychron K6 Pro](2025-04-04%20Keychron%20K6%20Pro.md)
