# E-Commerce Sales & Customer Analytics

## Project overview
An end-to-end beginner-to-intermediate portfolio project that analyzes e-commerce orders, product performance, regional sales, sales channels, discounts, and customer value.

## Business objective
Turn transaction-level order data into actionable descriptive insights that can help a business understand revenue, profitability, product mix, and customer behavior.

## Tools
- **Excel:** inspect data, filters, PivotTables, KPI summaries (optional workflow)
- **Python:** pandas, NumPy, Matplotlib, Jupyter Notebook
- **SQL:** aggregation, joins (extension), CTEs/window functions (MySQL 8+)
- **Power BI:** recommended dashboard build using the cleaned CSV

## Repository structure
```text
data/       raw and cleaned CSV files
python/     exploratory analysis notebook
sql/        business analysis queries
excel/      place your Excel workbook here
dashboard/  place your Power BI .pbix and screenshots here
reports/    exported analysis tables and findings
```

## Dataset
`data/ecommerce_sales_raw.csv` is a **synthetic practice dataset** created for this portfolio project. It contains 1,200 order rows across 2025, 250 possible customers, 10 products, five regions, and three sales channels. It is not real company/customer data.

Columns include order ID/date, customer and product IDs, product/category, quantity, unit price, discount, revenue, cost, profit, region, and sales channel.

## How to run
1. Install Python 3, Jupyter, pandas, numpy, and matplotlib.
2. Open `python/ecommerce_sales_analysis.ipynb` in Jupyter Notebook.
3. Run cells from top to bottom. The notebook cleans the raw data and exports analysis tables into `reports/`.
4. Import `data/ecommerce_sales_clean.csv` into MySQL as `ecommerce_sales`, then run `sql/ecommerce_analysis.sql` (MySQL 8+).
5. In Power BI Desktop, import the clean CSV and create the dashboard pages described below.

## Suggested Power BI pages
1. **Executive Overview:** revenue, profit, orders, customers, average order value, profit margin; monthly revenue trend.
2. **Product Performance:** category/product revenue, profit, units sold; top and bottom products.
3. **Customer Insights:** unique/repeat customers, customer revenue ranking, RFM segment counts (use `reports/customer_rfm_segments.csv`).
4. **Regional & Channel Analysis:** revenue/profit by region and sales channel.
5. **Discount Analysis:** discount band vs revenue/profit/margin.

Suggested measures:
```DAX
Total Revenue = SUM(ecommerce_sales_clean[revenue])
Total Profit = SUM(ecommerce_sales_clean[profit])
Total Orders = DISTINCTCOUNT(ecommerce_sales_clean[order_id])
Total Customers = DISTINCTCOUNT(ecommerce_sales_clean[customer_id])
Average Order Value = DIVIDE([Total Revenue], [Total Orders])
Profit Margin % = DIVIDE([Total Profit], [Total Revenue])
```

## Business questions
- Which product categories contribute most to revenue and profit?
- Which regions and channels perform best?
- How do monthly sales and profit change?
- Who are the highest-value customers?
- How are discounts associated with profitability?

## Important limitations
- Synthetic data is for learning and portfolio demonstration only.
- Patterns in this dataset are not evidence of real market behavior.
- Discount relationships are descriptive; do not claim discounts caused changes in profit.

## Before publishing
- Run every notebook cell and review the results.
- Verify SQL table/column names after import.
- Build and save your own Power BI `.pbix` dashboard; do not claim a dashboard exists until you create it.
- Add screenshots and a short `reports/business_insights.md` with your actual findings.
- Update this README with what you personally completed.

## Suggested resume title
**E-Commerce Sales & Customer Analytics | Python, SQL, Excel, Power BI**

Use resume bullets only for the work you have personally completed and can explain in an interview.
