USE `e-commerce`;

SELECT *
FROM dark_store_inventory
LIMIT 10;
SELECT COUNT(*) AS Total_Rows
FROM dark_store_inventory;
SELECT SUM(Stock_Received) AS Total_Stock_Received
FROM dark_store_inventory;
SELECT SUM(Units_Sold) AS Total_Units_Sold
FROM dark_store_inventory;
SELECT SUM(Units_Expired_Wasted) AS Total_Wasted_Units
FROM dark_store_inventory;
SELECT
    ROUND(
        SUM(Units_Expired_Wasted) * 100.0 /
        SUM(Stock_Received), 2
    ) AS Wastage_Percentage
FROM dark_store_inventory;
SELECT
    SUM(Units_Expired_Wasted * `Unit_Cost(Rs.)`) AS Total_Financial_Loss
FROM dark_store_inventory;
SELECT
    ROUND(AVG(`Unit_Cost(Rs.)`), 2) AS Average_Unit_Cost
FROM dark_store_inventory;
SELECT
    Store_City,
    SUM(Units_Expired_Wasted * `Unit_Cost(Rs.)`) AS Total_Financial_Loss
FROM dark_store_inventory
GROUP BY Store_City
ORDER BY Total_Financial_Loss DESC;
SELECT
    Category,
    SUM(Units_Expired_Wasted * `Unit_Cost(Rs.)`) AS Total_Financial_Loss
FROM dark_store_inventory
GROUP BY Category
ORDER BY Total_Financial_Loss DESC;
SELECT
    Category,
    SUM(Units_Expired_Wasted) AS Total_Wasted_Units
FROM dark_store_inventory
GROUP BY Category
ORDER BY Total_Wasted_Units DESC;
SELECT
    Store_City,
    ROUND(
        SUM(Units_Expired_Wasted) * 100.0 /
        SUM(Stock_Received), 2
    ) AS Wastage_Percentage
FROM dark_store_inventory
GROUP BY Store_City
ORDER BY Wastage_Percentage DESC;
SELECT
    Store_City,
    Category,
    SUM(Units_Expired_Wasted * `Unit_Cost(Rs.)`) AS Financial_Loss
FROM dark_store_inventory
GROUP BY Store_City, Category
ORDER BY Financial_Loss DESC
LIMIT 10;
SELECT
    Category,
    SUM(Units_Expired_Wasted) AS Total_Wasted_Units
FROM dark_store_inventory
GROUP BY Category
ORDER BY Total_Wasted_Units DESC
LIMIT 1;
SELECT
    Category,
    SUM(Units_Expired_Wasted * `Unit_Cost(Rs.)`) AS Financial_Loss
FROM dark_store_inventory
GROUP BY Category
ORDER BY Financial_Loss DESC
LIMIT 1;
SELECT
    Store_ID,
    Store_City,
    SUM(Units_Expired_Wasted * `Unit_Cost(Rs.)`) AS Financial_Loss
FROM dark_store_inventory
GROUP BY Store_ID, Store_City
ORDER BY Financial_Loss DESC
LIMIT 10;
SELECT
    Category,
    ROUND(AVG(`Unit_Cost(Rs.)`), 2) AS Avg_Unit_Cost,
    SUM(Units_Expired_Wasted * `Unit_Cost(Rs.)`) AS Financial_Loss
FROM dark_store_inventory
GROUP BY Category
ORDER BY Financial_Loss DESC;
SELECT
    Category,
    ROUND(
        SUM(Units_Sold) * 100.0 / SUM(Stock_Received), 2
    ) AS Sold_Percentage
FROM dark_store_inventory
GROUP BY Category
ORDER BY Sold_Percentage DESC;
SELECT
    Category,
    SUM(Stock_Received) AS Stock_Received,
    SUM(Units_Sold) AS Units_Sold,
    SUM(Units_Expired_Wasted) AS Wasted_Units,
    ROUND(
        SUM(Units_Expired_Wasted) * 100.0 /
        SUM(Stock_Received), 2
    ) AS Wastage_Percentage
FROM dark_store_inventory
GROUP BY Category
ORDER BY Wastage_Percentage DESC;
SELECT
    Store_City,
    SUM(Stock_Received) AS Stock_Received,
    SUM(Units_Sold) AS Units_Sold,
    SUM(Units_Expired_Wasted) AS Wasted_Units,
    ROUND(
        SUM(Units_Sold) * 100.0 /
        SUM(Stock_Received), 2
    ) AS Sold_Percentage,
    ROUND(
        SUM(Units_Expired_Wasted) * 100.0 /
        SUM(Stock_Received), 2
    ) AS Wastage_Percentage,
    SUM(Units_Expired_Wasted * `Unit_Cost(Rs.)`) AS Financial_Loss
FROM dark_store_inventory
GROUP BY Store_City
ORDER BY Financial_Loss DESC;