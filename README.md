# HPA-App - Work Order & Production Management System

A Visual FoxPro application for managing quotes, orders, inventory, shop floor operations with integrated RMA processing and comprehensive work order module for metal processing operations including centerless grinding, forging, and wire drawing.

## Overview

HPA-App is a comprehensive business management system that handles the complete workflow from quote to delivery:   

- **Quote Management**: Create and track customer quotes with inventory visibility
- **Order Processing**: Convert quotes to orders with automatic inventory allocation
- **Work Order Module**: Process stock through various production operations
  - Centerless Grind
  - Open Die Forge
  - Hot Radial Forge
  - Cold Radial Forge
  - Draw Bench
  - Wire Drawing
- **Shop Floor Management**: Process orders through production workflow with production logging
- **Router System**: Connect Sales Orders to Work Orders and production log lot numbers
- **Certification**:  Track production work certifications
- **Shipping & Packing**: Generate packing slips and manage order fulfillment
- **Inventory Control**: Track incoming stock with detailed receiving information (material specifications, heat numbers, weights)
- **RMA Processing**: Handle returns and warranty claims

## System Requirements

- **Visual FoxPro Version**: 9.2
- **Operating System**: Windows 7/8/10/11
- **Memory**:  Minimum 2GB RAM recommended
- **Disk Space**: [Specify required disk space]
- **Additional Requirements**: [Any other dependencies, ODBC drivers, etc.]

## Project Structure

```
HPA-App/
├── forms/          # Visual FoxPro forms (. scx)
│   ├── quotes/     # Quote entry and management forms
│   ├── orders/     # Order processing forms
│   ├── workorders/ # Work order management forms
│   ├── production/ # Production operation forms
│   ├── inventory/  # Inventory management forms
│   ├── shipping/   # Packing slip and shipping forms
│   ├── receiving/  # Incoming stock forms
│   ├── router/     # Router management forms
│   └── rma/        # RMA processing forms
├── reports/        # Report files (. frx)
│   ├── quotes/     # Quote reports
│   ├── workorders/ # Work order reports
│   ├── certifications/ # Production certification reports
│   ├── packingslips/   # Packing slip reports
│   └── receiving/  # Receiving reports
├── prgs/           # Program files (.prg)
├── classes/        # Class libraries (.vcx)
├── data/           # Temp Database files (. dbc, .dbf)
│   ├── quotes. dbf
│   ├── orders.dbf
│   ├── workorders.dbf
│   ├── router.dbf
│   ├── certification.dbf
│   ├── Draw_log.dbf      # Draw Bench production log
│   ├── GFMlog.dbf        # Cold radial forge log
│   ├── HT_log.dbf        # Heat treat log
│   ├── LakeErie_log.dbf  # Hot radial forge log
│   ├── Swag_log. dbf      # Open die forge log
│   ├── Wire_log.dbf      # Wire drawing log
│   ├── inventory.dbf
│   ├── receiving.dbf
│   └── rma.dbf
├── images/         # Image resources
├── docs/           # Documentation
└── README.md       # This file
```

## Installation

1. Clone this repository:  
   ```bash
   git clone https://github.com/DavidKirchner68/HPA-App.git
   ```

2. Navigate to the project directory:
   ```bash
   cd HPA-App
   ```

3. Open the main project file in Visual FoxPro:
   - Launch Visual FoxPro 9.2
   - Open `HPA-App.pjx` (if using project file)
   - Or run the main program: `DO main. prg`

4. [Add any additional setup steps, like configuring database connections]

## Configuration

[Describe any configuration files or settings that need to be adjusted]

- Database connections:  SQL Server 2016
- Application settings: [Location/instructions]
- User preferences: [Location/instructions]

## Usage

### Running the Application

```foxpro
* Option 1: Run from main program
DO main.prg

* Option 2: Run compiled application
DO HPA-App.app
```

### Key Features

#### Quote Management
- Create new customer quotes
- View available inventory while quoting
- Track quote status and history

#### Order Processing
- Convert approved quotes to orders
- Allocate inventory to orders
- View order status and details

#### Work Order Module
Process stock through various production operations: 

- **Centerless Grind**:  Precision grinding operations
- **Open Die Forge (Lake Erie)**: Hot radial forging with LakeErie_log tracking
- **Cold Radial Forge (Swag)**: Fenn forging with swag_log tracking
- **Hot or Cold Radial Forge (GFM)**: Cold radial forging with GFMlog tracking
- **Draw Bench**: Drawing operations with Draw_log tracking
- **Wire Drawing**: Wire drawing operations with Wire_log tracking
- **Heat Treatment**: Heat treat operations with HT_log tracking

Each production type maintains detailed lot number tracking in dedicated log tables.

#### Router System
- Links Sales Orders to Work Orders
- Tracks production log lot numbers
- Manages workflow between departments
- Routes jobs through multiple production processes

#### Certification Management
- Track production work certifications
- Maintain certification records
- Generate certification reports
- Link certifications to work orders and lot numbers

#### Shop Floor Management
- Process orders through production
- Track work in progress
- Update order status
- Monitor production logs

#### Shipping & Fulfillment
- Box completed orders
- Generate packing slips
- Track shipments

#### Receiving Department
- Record incoming stock
- Enter material specifications (micing)
- Track heat numbers
- Record weights (pounds)
- Update inventory levels

#### RMA Processing
- Create return authorizations
- Track RMA status
- Process returns and replacements

## Development

### Building the Project

1. Open `HPA-App.pjx` in Visual FoxPro
2. Click "Build" button
3. Select build options:
   - Application (. app)
   - Executable (.exe)
   - COM DLL (.dll)

### Coding Standards

- Use meaningful variable names with Hungarian notation (e.g., `cCustomerName`, `nInvoiceTotal`)
- Comment complex logic
- Follow consistent indentation (tabs or spaces)
- Use uppercase for FoxPro commands and functions

### Database Schema

#### Quotes Table (HPAlloy.dbo.AllQuotes)
- QuoteID (C, 10) - Primary Key
- CustomerID (C, 10) - Foreign Key
- QuoteDate (D)
- Status (C, 20) - Open, Converted, Cancelled
- TotalAmount (N, 12, 2)

#### Orders Table (HPAlloy.dbo.Sales)
- OrderID (C, 10) - Primary Key
- QuoteID (C, 10) - Foreign Key
- OrderDate (D)
- Status (C, 20) - New, In Shop, Boxed, Shipped
- ShipDate (D)

#### Work Orders Table (HPAlloy.dbo.WorkOrder)
- WorkOrderID (C, 10) - Primary Key
- OrderID (C, 10) - Foreign Key
- ProductionType (C, 20) - Grind, Forge, Draw, Wire, etc.
- Status (C, 20) - Pending, In Progress, Completed
- LotNumber (C, 20)
- StartDate (D)
- CompletionDate (D)

#### Router Table (HPAlloy.dbo.rtr)
- RouterID (C, 10) - Primary Key
- SalesOrderID (C, 10) - Foreign Key to Orders
- WorkOrderID (C, 10) - Foreign Key to Work Orders
- LotNumber (C, 20) - Production log lot number
- Sequence (N, 3) - Routing sequence
- Status (C, 20)

#### Certification Table (HPAlloy.dbo.HPAcert)
- CertID (C, 10) - Primary Key
- WorkOrderID (C, 10) - Foreign Key
- LotNumber (C, 20)
- CertDate (D)
- CertType (C, 50)
- CertData (M) - Memo field for certification details
- Inspector (C, 50)

#### Production Log Tables

**Draw Bench Log (HPAlloy.dbo.Draw_log)**
- LogID (C, 10) - Primary Key
- LotNumber (C, 20)
- WorkOrderID (C, 10) - Foreign Key
- ProcessDate (D)
- [Process-specific fields]

**GFM Log - Cold Radial Forge (HPAlloy.dbo.GFMlog)**
- LogID (C, 10) - Primary Key
- LotNumber (C, 20)
- WorkOrderID (C, 10) - Foreign Key
- ProcessDate (D)
- [Process-specific fields]

**Heat Treat Log (HPAlloy.dbo.HT_log)**
- LogID (C, 10) - Primary Key
- LotNumber (C, 20)
- WorkOrderID (C, 10) - Foreign Key
- ProcessDate (D)
- [Process-specific fields]

**Lake Erie Log - Open Die Forge (HPAlloy.dbo.LakeErie_log)**
- LogID (C, 10) - Primary Key
- LotNumber (C, 20)
- WorkOrderID (C, 10) - Foreign Key
- ProcessDate (D)
- [Process-specific fields]

**Swag Log - Cold rotary Forge (HPAlloy.dbo.Swag_log)**
- LogID (C, 10) - Primary Key
- LotNumber (C, 20)
- WorkOrderID (C, 10) - Foreign Key
- ProcessDate (D)
- [Process-specific fields]

**Wire Drawing Log (HPAlloy.dbo.Wire_log)**
- LogID (C, 10) - Primary Key
- LotNumber (C, 20)
- WorkOrderID (C, 10) - Foreign Key
- ProcessDate (D)
- [Process-specific fields]

#### Inventory Table (HPAlloy.dbo.vStockLst)
- InventoryID (C, 10) - Primary Key
- PartNumber (C, 20)
- Description (C, 100)
- QtyOnHand (N, 10, 2)
- QtyAllocated (N, 10, 2)
- QtyAvailable (N, 10, 2)

#### Receiving Table (HPAlloy.dbo.receiving)
- ReceivingID (C, 10) - Primary Key
- InventoryID (C, 10) - Foreign Key
- ReceiveDate (D)
- Micing (C, 50) - Material specifications
- HeatNumber (C, 20)
- Pounds (N, 10, 2)

#### RMA Table (HPAlloy.dbo.rma)
- RMAID (C, 10) - Primary Key
- OrderID (C, 10) - Foreign Key
- RMADate (D)
- Reason (M) - Memo field
- Status (C, 20) - Open, Processing, Completed

## Workflow

```
1. Quote → 2. Sales Order → 3. Router → 4. Work Order → 5. Production Process
                ↓                           ↓
           Inventory Allocation      Production Logs: 
                ↑                     - Draw_log
           Receiving (Stock)          - GFMlog
                                      - HT_log
                                      - LakeErie_log
                                      - Swag_log
                                      - Wire_log
                                           ↓
                                    Certification
                                           ↓
                        6. Shop Floor → 7. Boxing → 8. Packing Slip → 9. Shipping

RMA Processing (Returns) ← Shipped Orders
```

## Production Operations

### Centerless Grind
- Precision grinding operations for cylindrical parts
- Tight tolerance control
- Surface finish specifications

### Cold rotary forge (Swag)
- Fenn forging operations
- Logged in Swag_log table
- Lot number tracking

### Hot Open Die forge (Lake Erie)
- Hot forging process
- Logged in LakeErie_log table
- Temperature and pressure tracking

### Radial Forge (GFM)
- Hot or Cold radial forging operations
- Logged in GFMlog table
- Dimensional tracking

### Draw Bench
- Drawing operations for bars
- Logged in Draw_log table
- Reduction ratio tracking

### Wire Drawing
- Wire production and sizing
- Logged in Wire_log table
- Die sequence tracking

### Heat Treatment
- Heat treating operations
- Logged in HT_log table
- Temperature and time cycle tracking

## Troubleshooting

### Common Issues

**Issue 1: "File not found" error**
- Solution:  Verify all database files are in the correct data/ directory

**Issue 2: Database corruption**
- Solution:  Run `VALIDATE DATABASE` command or rebuild indexes with `REINDEX`

**Issue 3: Inventory allocation errors**
- Solution: Verify QtyAvailable = QtyOnHand - QtyAllocated

**Issue 4: Packing slip not printing**
- Solution: Check printer configuration and report file path

**Issue 5: Production log not updating**
- Solution: Verify work order is properly routed and lot number is assigned

**Issue 6: Router connection errors**
- Solution: Check that Sales Order and Work Order IDs match in router table

## Version History

### Version 3.9.18 (2025-11-10)
- Current release
- Work Order module with multiple production processes
- Router system linking Sales Orders to Work Orders
- Production log tables for all processes
- Certification tracking
- [Add other changes and features for this version]

### Version 3.9.17
- [Previous version changes]

## Contributing

This is a private project.  For questions or suggestions, please contact [your contact information].

## License

Proprietary - All Rights Reserved

## Contact

- **Developer**:  David Kirchner
- **Email**: David Kirchner@Yahoo.com
- **GitHub**: [@DavidKirchner68](https://github.com/DavidKirchner68)

## Acknowledgments

- [Any libraries, tools, or resources you've used]
- [Credits to contributors or inspirations]

## Notes

- This project uses Visual FoxPro 9.2
- Current Version: 3.9.18
- Handles complete quote-to-cash workflow
- Integrated inventory management with receiving and RMA functionality
- Comprehensive work order module for metal processing operations
- Production certification and traceability through lot number tracking
- Router system connects sales orders through production to completion
- [Any other important notes about the project]
```