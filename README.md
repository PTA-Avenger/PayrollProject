# COBOL Payroll Processing System

> Author: Thato Mabena  
> Date: June 4, 2025  
> Language: COBOL (GnuCOBOL via OpenCobolIDE)  
> Compiler: `cobc -free`

---

## 📌 Description

This project is a **Payroll Processing System** built using classic COBOL. It reads employee data from a flat file (`employee.dat`), calculates gross pay, tax, and net pay, and outputs a summary report to a text file (`payroll.rep`).

It's a foundational business application that reflects how COBOL is used in real-world payroll and finance systems.

---

## 🚀 How It Works

1. **Input**:  
   Reads each employee's ID, name, hours worked, and hourly rate from `employee.dat`.

2. **Processing**:
   - Gross Pay = Hours × Rate
   - Tax:  
     - 20% if Gross Pay > 100000.00  
     - 10% otherwise  
   - Net Pay = Gross Pay − Tax

3. **Output**:  
   A readable payroll summary is written to `payroll.rep`.

---

## 📁 File Structure
📂 PayrollProject/
├── PayrollProject.cbl # Main COBOL source file
├── employee.dat # Input file (fixed-width format)
├── payroll.rep # Output file (generated after run)
└── README.md # Project documentation

---

## 🧪 Sample Input (`employee.dat`)

Each line is exactly 35 characters with no delimiters.
00001John Smith 004008000
00002Lisa White 003509500
00003Marcus Jones 004510000

**Field Breakdown:**
- `00001` → Employee ID (5 characters)
- `John Smith         ` → Name (20 characters, padded)
- `00400` → Hours Worked
- `08000` → Hourly Rate (e.g. 8000 = 80.00)

---

## 📤 Sample Output (`payroll.rep`)
00001 John Smith Hrs: 00400 Rate: 08000 Gross: 320000.00 Tax: 32000.00 Net: 288000.00
00002 Lisa White Hrs: 00350 Rate: 09500 Gross: 332500.00 Tax: 33250.00 Net: 299250.00
00003 Marcus Jones Hrs: 00451 Rate: 10000 Gross: 451000.00 Tax: 45100.00 Net: 405900.00

---

## 🛠 How to Run

### 🧰 Requirements
- [GnuCOBOL](https://gnucobol.sourceforge.io/) or [OpenCobolIDE](https://open-cobol-ide.readthedocs.io/)
- Windows, Linux, or MacOS

### ⚙️ Steps
1. Clone or download the project
2. Open in OpenCobolIDE or terminal
3. Make sure `employee.dat` is in the same folder as the `.exe` or `.cbl`
4. Compile with:  
   ```bash
   cobc -x -free PayrollProject.cbl
./PayrollProject.exe  (or just run in IDE)

🧠 Key Learning Points
File I/O in COBOL (SELECT, FD)

Fixed-format data handling

Arithmetic with COMPUTE

Using STRING for dynamic line building

Structured PERFORM and IF blocks

📦 Future Improvements
Add overtime pay logic (e.g. 1.5× after 160 hours)

Export to CSV format for Excel integration

Console menu interface

Total payroll summary (e.g. total gross/net)

✅ License
This project is open for educational and portfolio use.

🙌 Acknowledgements
