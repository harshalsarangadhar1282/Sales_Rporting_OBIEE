-- OBIEE Reporting Project SQL
-- Sales analysis query

SELECT
    s.Order_Date,
    r.Region,
    p.Product,
    p.Category,
    s.Sales_Rep,
    s.Quantity,
    s.Unit_Price,
    s.Sales_Amount
FROM Sales_Fact s
JOIN Region_Dimension r ON s.Region = r.Region
JOIN Product_Dimension p ON s.Product = p.Product
WHERE s.Sales_Amount > 0
ORDER BY s.Order_Date DESC;

-- Aggregate sales by region
SELECT
    r.Region,
    SUM(s.Sales_Amount) AS Total_Sales,
    SUM(s.Quantity) AS Total_Quantity
FROM Sales_Fact s
JOIN Region_Dimension r ON s.Region = r.Region
GROUP BY r.Region
ORDER BY Total_Sales DESC;

-- Top products by sales
SELECT
    p.Product,
    SUM(s.Sales_Amount) AS Total_Sales
FROM Sales_Fact s
JOIN Product_Dimension p ON s.Product = p.Product
GROUP BY p.Product
ORDER BY Total_Sales DESC;
