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
