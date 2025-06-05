# COBOL Payroll Processing System

![Language](https://img.shields.io/badge/language-COBOL-blue)
![License](https://img.shields.io/badge/license-Portfolio-green)

> Author: Thato Mabena  
> Date: June 4, 2025  
> Language: COBOL (GnuCOBOL via OpenCobolIDE)  
> Compiler: `cobc -free`

---

## 🚀 Introduction

COBOL remains a foundational language for business and financial systems, powering payroll, banking, and enterprise operations for decades. This project demonstrates a classic payroll processing application in COBOL, ideal for learning or portfolio use.

---

## 📌 Project Purpose

This Payroll Processing System reads employee data, calculates gross pay, tax, and net pay, then outputs a summary report. It models real-world payroll logic and showcases key COBOL features used in business.

---

## 🛠️ How It Works

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

```
PayrollProject/
├── PayrollProject.cbl   # Main COBOL source file
├── employee.dat         # Input file (fixed-width format)
├── payroll.rep          # Output file (generated after run)
└── README.md            # Project documentation
```

---

## 🧪 Sample Input (`employee.dat`)

Each line is exactly 35 characters with no delimiters.

| Employee ID | Name (20 chars, padded) | Hours Worked | Hourly Rate (e.g., 8000 = 80.00) |
|-------------|------------------------|--------------|-----------------------------------|
| 00001       | John Smith             | 00400        | 08000                             |
| 00002       | Lisa White             | 00350        | 09500                             |
| 00003       | Marcus Jones           | 00451        | 10000                             |

**Example Lines:**
```
00001John Smith         004008000
00002Lisa White         003509500
00003Marcus Jones       004510000
```

---

## 📤 Sample Output (`payroll.rep`)

```
00001 John Smith Hrs: 00400 Rate: 08000 Gross: 320000.00 Tax: 32000.00 Net: 288000.00
00002 Lisa White Hrs: 00350 Rate: 09500 Gross: 332500.00 Tax: 33250.00 Net: 299250.00
00003 Marcus Jones Hrs: 00451 Rate: 10000 Gross: 451000.00 Tax: 45100.00 Net: 405900.00
```

---

## 🏗️ Key Code Example

Below is the COBOL code snippet for tax calculation:
```cobol
IF GROSS-PAY > 100000
    COMPUTE TAX = GROSS-PAY * 0.20
ELSE
    COMPUTE TAX = GROSS-PAY * 0.10
END-IF
```

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
    ```
5. Run:
    ```bash
    ./PayrollProject.exe  # Or run in IDE
    ```

---

## 🧠 Key Learning Points

- File I/O in COBOL (SELECT, FD)
- Fixed-format data handling
- Arithmetic with COMPUTE
- Using STRING for dynamic line building
- Structured PERFORM and IF blocks

---

## ⚡ Troubleshooting

- **employee.dat not found**: Ensure the file exists in the same directory as your compiled binary or source.
- **Compilation issues**: Make sure you are using GnuCOBOL with `-free` for free-format syntax.

---

## 📦 Future Improvements

- Add overtime pay logic (e.g. 1.5× after 160 hours)
- Export to CSV format for Excel integration
- Console menu interface
- Total payroll summary (e.g. total gross/net)

---

## 🤝 Contributing

Contributions are welcome! Please fork the repo, create a feature branch, and submit a pull request.

---

## 📚 Resources

- [GnuCOBOL Documentation](https://gnucobol.sourceforge.io/)
- [OpenCobolIDE Docs](https://open-cobol-ide.readthedocs.io/)
- [COBOL Tutorial](https://www.tutorialspoint.com/cobol/index.htm)

---

## 🙌 Acknowledgements

- Inspired by classic COBOL business applications.
- Thanks to the GnuCOBOL and OpenCobolIDE community.
