--DOUGLAS TOMASINO u20210552

USE AdventureWorks2022
GO
-- Ejercicio 1:
-- Seleccione todos los datos de la tabla Departament del esquema HumanResources.
SELECT * FROM HumanResources.Department

-- Ejercicio 2:
-- Seleccione un agrupamiento de los nombres de grupos que existen en la tabla Departament del esquema HumanResources.
SELECT GroupName FROM HumanResources.Department GROUP BY GroupName

-- Ejercicio 3:
-- Seleccione todos los departamentos ordenándolos en orden descendente.
SELECT * FROM HumanResources.Department ORDER BY DepartmentID DESC

-- Ejercicio 4:
-- Seleccione todos los departamentos ordenándolos en orden ascendente.
SELECT * FROM HumanResources.Department ORDER BY DepartmentID ASC

-- Ejercicio 5:
-- Seleccione todos los empleados de la tabla Employee del esquema HumanResources.
SELECT * FROM HumanResources.Employee

-- Ejercicio 6:
-- Seleccione todos los empleados de la tabla Employee del esquema HumanResources donde el género sea masculino.
SELECT Empleado.BusinessEntityID, Persona.FirstName, Empleado.Gender
FROM HumanResources.Employee Empleado
INNER JOIN Person.Person Persona ON Empleado.BusinessEntityID = Persona.BusinessEntityID
WHERE Empleado.Gender = 'M'

-- Ejercicio 7:
-- Seleccione todos los empleados de la tabla Employee del esquema HumanResources donde el nivel de organización sea mayor a 3.
SELECT Empleado.BusinessEntityID, Persona.FirstName, Empleado.OrganizationLevel
FROM HumanResources.Employee Empleado
INNER JOIN Person.Person Persona ON Empleado.BusinessEntityID = Persona.BusinessEntityID
WHERE Empleado.OrganizationLevel > 3

-- Ejercicio 8:
-- Seleccione todos los empleados de la tabla Employee del esquema HumanResources donde el nivel de organización sea mayor e igual a 2 y que el género sea femenino.
SELECT Empleado.BusinessEntityID, Persona.FirstName, Empleado.OrganizationLevel
FROM HumanResources.Employee Empleado
INNER JOIN Person.Person Persona ON Empleado.BusinessEntityID = Persona.BusinessEntityID
WHERE (Empleado.OrganizationLevel >= 2) AND Empleado.Gender = 'F'

-- Ejercicio 9:
-- Selección los campos BusinessEntityID, NationalIDNumber de la tabla Employee del esquema HumanResources donde los jobtitle sean Marketing Assistant o Design Engineer.
SELECT Empleado.BusinessEntityID, Empleado.NationalIDNumber
FROM HumanResources.Employee Empleado
WHERE Empleado.JobTitle = 'Marketing Assistant' OR Empleado.JobTitle = 'Design Engineer'

-- Ejercicio 10:
-- Seleccionar todos los empleados de la tabla Employee del esquema HumanResources que estén entre la fecha de nacimiento de 1 de enero de 1969 y 31 de diciembre de 1972.
SELECT BusinessEntityID, BirthDate
FROM HumanResources.Employee
WHERE BirthDate BETWEEN '1969-01-01' AND '1972-12-31'

-- Ejercicio 11:
-- De la tabla Employee del esquema HumanResources calcular el total a pagar por horas de vacación si se conoce que cada hora cuesta $8.00.
SELECT BusinessEntityID, VacationHours, (VacationHours * 8.00) AS 'Total a pagar'
FROM HumanResources.Employee

-- Ejercicio 12:
-- De la tabla Production.ProductSubcategory mostrar cuantas subcategorías hay registradas por categoría.
SELECT ProductCategoryID, COUNT(ProductSubcategoryID) AS 'Cantidad'
FROM Production.ProductSubcategory
GROUP BY ProductCategoryID

-- Ejercicio 13:
-- De la tabla Sales.Customer mostrar cuántos clientes existen registrados por territorios.
SELECT TerritoryID, COUNT(CustomerID) AS 'Cantidad'
FROM Sales.Customer
GROUP BY TerritoryID

-- Ejercicio 14:
-- De la tabla Sales.SalesOrderHeader mostrar la suma total del Sub Total de compra según el IdCustomer que se coloque.
SELECT CustomerID, SUM(SubTotal) AS 'Suma Total'
FROM Sales.SalesOrderHeader
WHERE CustomerID = '29825'
GROUP BY CustomerID

-- Ejercicio 15:
-- De la tabla Sales.CreditCard mostrar cuántas tarjetas según su tipo están registradas en el sistema.
SELECT CardType, COUNT(CreditCardID) AS 'Tarjetas registradas'
FROM Sales.CreditCard
GROUP BY CardType

-- Ejercicio 16:
-- De la tabla Sales.SalesOrderDetail evaluar Linea total de compra que es el total de la compra,
-- si la compra es mayor de $1000.00 realizar un descuento del 10% y mostrar el nuevo total a pagar,
-- si es mayor $1500.00 realizar un descuento del 14% y mostrar el nuevo total a pagar,
-- si es mayor de $2000.00 realizar un descuento del 18% y mostrar el nuevo total a pagar.
SELECT LineTotal AS "Compra",
  CASE
    WHEN LineTotal > 2000 THEN LineTotal * 0.82
    WHEN LineTotal > 1500 THEN LineTotal * 0.86
    WHEN LineTotal > 1000 THEN LineTotal * 0.90
    ELSE LineTotal
  END AS "Total a pagar"
FROM Sales.SalesOrderDetail
