# Robocopy-Based File Migration Tool

## Overview
This repository provides a **PowerShell-based Robocopy migration tool** designed for migrating **NFS/CIFS shares** from **NetApp, VNX, or Unity arrays** to **Dell PowerStore**. The tool ensures a **highly efficient, fault-tolerant, and automated data migration** experience while preserving **file permissions, timestamps, and integrity**.

## Key Features
- **Full Directory & ACL Migration**: Preserves all NTFS permissions, attributes, and timestamps.
- **Incremental Syncs**: Copies only changed or new files after the initial sync.
- **Multi-Threading for Performance**: Uses **Robocopy’s /MT parameter** for fast transfers.
- **Error Handling & Logging**: Detailed logging to track failures and retry mechanisms.
- **Throttling & Auto Scheduling**:
  - Dynamically adjusts bandwidth usage based on configured schedules.
  - Ensures optimal network performance during migration.
- **HTML-Based Control Panel (Upcoming Feature)**:
  - A web-based interface to monitor and trigger migration jobs.
  - Provides job progress tracking, error reporting, and job history logs.

## Prerequisites
1. **Windows Server 2016+** (Recommended for best performance)
2. **Robocopy** (Built into Windows)
3. **PowerShell v5.1+**
4. **SMB/NFS Shares Access**
5. **Administrator Privileges** (For full ACL migration)
6. **Scheduled Task Support** (For automated scheduling)

## Installation
1. Clone the repository:
   ```sh
   git clone https://github.com/navidrast/robocopy.git
   cd robocopy
   ```

2. Ensure the PowerShell script is executable:
   ```sh
   Set-ExecutionPolicy Bypass -Scope Process -Force
   ```
3. Modify the `robocopy_migration.ps1` script to update:
   - **Source & Destination paths**
   - **Scheduling parameters**
   - **Bandwidth throttling configurations**

## Usage
Run the PowerShell script to begin migration:
```powershell
powershell.exe -File .\robocopy_migration.ps1
```

## Scheduled Execution
To automate the migration based on a schedule:

1. Open **Task Scheduler** on Windows.
2. Create a new task with **highest privileges**.
3. Set the trigger to run **daily/hourly** based on your migration needs.
4. Set the action to execute the script via:
   ```powershell
   powershell.exe -ExecutionPolicy Bypass -File C:\Path\To\robocopy_migration.ps1
   ```

## HTML Dashboard (Upcoming Feature)
A web-based control panel will be introduced to:

- **Start & Stop Migration Jobs**
- **Monitor Job Progress & Performance**
- **Manage Auto-Scheduling & Bandwidth Controls**

## Roadmap
- ✅ **Basic Robocopy migration script**
- 🔄 **Dynamic bandwidth throttling & auto-scheduling**
- 🔄 **Web dashboard for job management**
- 🔄 **Email notifications & reporting**

## Contributions
Feel free to contribute! Open a pull request or submit an issue if you have feature requests.

## License
MIT License. Free to use and modify.

---

### Developed by [Navid Rastgani](https://github.com/navidrast) 🚀
