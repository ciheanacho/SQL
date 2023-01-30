---Select the Database Of Use 
Use PortfolioProject3

--Cleaning Data with SQL Queries

--Selecting the data to use
Select *
From PortfolioProject3..Housing

--Standardize Date of Sale
--Step 1. Selecting the data that we are going to be converting, and correctly formating the data before conversion. 
Select SaleDate, Convert(date,Saledate) as Correct_Date
from PortfolioProject3..Housing

--Step 2. Updating the SaleDate Column 
--This was done by creating a temporary column, dropping the original, then renaming the column to the original column name

Select SaleDate
from Housing

Alter Table Housing
Add UpdatedSaleDate date

Update Housing
Set UpdatedSaleDate = Convert(date,SaleDate) 

Select UpdatedSaleDate
From Housing

Alter Table Housing
Drop Column SaleDate

exec sp_rename 'Housing.UpdatedSaleDate', 'SaleDate', 'Column';

Select SaleDate 
from Housing


--Populate Property Address
--Step 1. Identifying the rows in which the property Address was empty
--This was done by joining the table with itself where the ParcelID was the same and the UniqueId was different
--This method was chosen because it would be able to identify instances (Unique Id) where the address was empty, but the ParcelId was the same as another.

Select a.ParcelId,a.PropertyAddress, b.ParcelId,b.PropertyAddress
from Housing a join Housing b
on a.ParcelId= b.ParcelId and a.UniqueId<>b.UniqueId
Where a.PropertyAddress is null

--Step 2. Populate the rows where the property address is empty
--This is done by using the self join to populate the property address where the first Property address field on table a is null through an update. 
Update a
Set PropertyAddress = ISNULL(a.PropertyAddress, b.PropertyAddress)
from Housing a join Housing b
on a.ParcelID = b.ParcelID
and a.UniqueID <> b.UniqueID
Where a.PropertyAddress is null

Select a.PropertyAddress, b.PropertyAddress
from Housing a join Housing b
on a.ParcelID = b.ParcelID and a.UniqueID <> b.UniqueID

Select UniqueID, ParcelID, PropertyAddress
from Housing
order by [UniqueID ]

---Breaking down the address into Street Address, City and State for Property Address and Owner Address

--Starting with the Property Address. We're going to Select the Format for how we want our data to look like. 
--This will be done using a substring and a character index.
--For the first portion, We're going to be looking at the property address for the substring starting at the first position and our stopping point will be the position before the comma. 
--For the second portion, we're going to be looking at the property address for the substring starting at the first position AFTER the comma, and end at the length of the property address. 
Select 
SUBSTRING(PropertyAddress, 1, charindex(',',PropertyAddress) - 1)as Property_Street_Address,
SUBSTRING(PropertyAddress, CharIndex(',', PropertyAddress)+1, Len(PropertyAddress)) as Property_City
from Housing

--Now We add the columns to the table using the respective queries. 
Alter Table Housing
Add Split_Property_Street_Address nvarchar(250)

update Housing
Set Split_Property_Street_Address =SUBSTRING(PropertyAddress, 1, charindex(',',PropertyAddress) - 1)

Alter Table Housing
Add Split_Property_City nvarchar(250)

Update Housing
Set Split_Property_City = SUBSTRING(PropertyAddress, CharIndex(',', PropertyAddress)+1, Len(PropertyAddress))

--Using ParseName to Split the Owner Address Field. We'll use the comma as a delimiter for this function. 

Select 
PARSENAME(Replace(OwnerAddress,',', '.'),3)as Street_Address,
PARSENAME(Replace(OwnerAddress, ',','.'),2) as City,
PARSENAME(Replace(OwnerAddress, ',','.'),1) as State 
from Housing 

--Now We add the columns to the table using the respective queries. 
Alter Table Housing
Add Split_Owner_Street_Address nvarchar(250)

Alter Table Housing
Add Split_Owner_City nvarchar(250)

Alter Table Housing
Add Split_State nvarchar(250)

Update Housing
Set Split_Owner_Street_Address = PARSENAME(Replace(OwnerAddress,',', '.'),3)

Update Housing
Set Split_Owner_City = PARSENAME(Replace(OwnerAddress, ',','.'),2)

Update Housing
Set Split_State = PARSENAME(Replace(OwnerAddress, ',','.'),1)

Select Split_Owner_Street_Address, Split_Owner_City, Split_State
from Housing

-- Change Y and N to Yes and No in "Sold as Vacant"
--First we idenfity the unique values and how many of each value exists within each field.
Select Distinct(SoldAsVacant), count(soldAsVacant)
from Housing
Group by SoldAsVacant
order by 2 

--Secondly, we'll create a case to change "Y" to "Yes" and "N" to "No"
Select SoldAsVacant,
	Case when SoldAsVacant = 'Y' then 'Yes'
		When SoldAsVacant = 'N' then 'No'
		Else SoldAsVacant
		End
from Housing

--Update the Code the Case Query. 
Update Housing
Set SoldAsVacant = Case when SoldAsVacant = 'Y' then 'Yes'
		When SoldAsVacant = 'N' then 'No'
		Else SoldAsVacant
		End
--Remove Duplicates
--Step 1:Identify Duplicates. We're looking for any value (other than UniqueId) that should be unique but has multiple of the same value.
Select *, 
	ROW_NUMBER() Over (
	Partition By ParcelID,
				PropertyAddress,
				SalePrice,
				SaleDate,
				LegalReference
				Order By
					UniqueId
					) row_num
from Housing;
--Step 2: Create a CTE of the Data used to Idenfity Duplicates.
WITH RowNumCTE as(
Select *, 
	ROW_NUMBER() Over (
	Partition By ParcelID,
				PropertyAddress,
				SalePrice,
				SaleDate,
				LegalReference
				Order By
					UniqueId
					) row_num
from Housing
)

--Delete 
--from RowNumCTE
--Where row_num>1

Select *
from RowNumCTE
where row_num > 1
Order by PropertyAddress

--Delete Unused Columns(This isn't normally recommended with the raw data. Instead it'd be more beneficial to create a view)
Alter Table Housing
Drop Column TaxDistrict

Select *
From Housing