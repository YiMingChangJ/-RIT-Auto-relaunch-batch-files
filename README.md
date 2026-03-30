# RITC Practice Server Management Scripts

## Overview
This suite of Windows Batch (`.bat`) scripts is designed to automate the deployment, continuous monitoring, and safe shutdown of multiple Rotman Interactive Trader (RIT) 2.0 Server instances. 

The monitoring scripts ensure high availability during practice sessions by automatically detecting server crashes, logging the downtime, and relaunching the application without manual intervention. If you would like to modify the API ports or the folder path of the batch files, please change the file type from `.bat` to `.txt`, so that you can open with Notepad to do the modification.

## Included Scripts & Port Mapping

The environment utilizes individual scripts for different RITC cases. Each script binds to specific Case and API ports to prevent conflicts.

| Script Name | Case File | Case Port | API Port |
| :--- | :--- | :--- | :--- |
| `Liquidity.bat` | Liquidity Risk - practice.xlsx | `16500` | `16510` |
| `Volatility.bat` | Volatility Trading Case - practice.xlsx | `16520` | `16530` |
| `Merger.bat` | Merger Arbitrage Case - practice.xlsx | `16540` | `16550` |
| `Algo1.bat` | Algorithmic Market Making - practice.xlsx | `16560` | `16565` |
| `Algo2.bat` | Algorithmic Market Making - practice.xlsx | `16570` | `16575` |
| `Algo3.bat` | Algorithmic Market Making - practice.xlsx | `16580` | `16585` |

### Utility Script
* `bulk-close-all-RIT-Server.bat`: A secure shutdown tool that forcefully terminates all active RIT 2.0 Server instances at once. It includes a `YES` confirmation prompt to prevent accidental closures.

## How the Auto-Restart Mechanism Works

The case-specific batch files (`Algo1.bat`, `Liquidity.bat`, etc.) operate on an infinite monitoring loop (`:MonitorLoop`):
1. **Launch:** The script launches the RIT Server application, passing the designated case file, user list, and port configurations via command-line arguments.
2. **Monitor:** Using the `start /wait` command, the batch script pauses execution as long as the server application is running. 
3. **Crash Detection:** If the RIT Server crashes or is closed unexpectedly, the `start /wait` command completes, allowing the script to proceed.
4. **Logging:** A timestamped error message is appended to `CrashLog.txt` in the same directory.
5. **Recovery:** The script initiates a 5-second countdown before looping back to relaunch the server automatically.

## Prerequisites & File Paths

For these scripts to execute successfully, the host machine must maintain the following directory structure:

* **RIT Server Executable:** `C:\Program Files (x86)\Rotman\RIT Instructor Application\Server.exe`
* **Case Files Directory:** `C:\Users\ritserver\Desktop\RITC\`
* **User List File:** `C:\Users\ritserver\Desktop\RITC\Practice Userlist\Practice Userlist.xlsx`

*Note: If the RIT Instructor Application is updated or moved, the paths inside the `.bat` files must be updated accordingly.
---

## 📜 Acknowledgements

Developed as part of the **Rotman International Trading Competition (RITC)** and **Rotman Finance Group Finance Research & Trading Lab** educational ecosystem.

**Copyright © Rotman BMO Finance Group Finance Research & Trading Lab, University of Toronto.**
All rights reserved.

---

## 🧩 Author

**Yi-Ming Chang**
Educational Developer, Rotman Finance Research & Trading Lab
University of Toronto
