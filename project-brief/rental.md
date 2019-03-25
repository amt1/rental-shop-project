# Rental Shop

You have been approached by the management of a rental store and have been asked to create a system to manage their stock items.  They need a system that allows them to manage rentals and their customers.

The store can be renting out anything you like, eg. cars, formal wear, books (library), property (letting agency).

## MVP

* The store manager should be able to perform CRUD actions on stock
* The store manager should be able to perform CRUD actions on their customer records
* The manager should be able to assign stock items to customers and check them back in again
* The manager should be able to view details of all current rentals

### User Stories

#### Managing stock
_As a shop manager_<br/>
_I want to manage records of my stock_<br/>
_So that I can see what I have in stock_<br/>
**Acceptance Criteria:** The user should be able to create stock items<br/>
**Acceptance Criteria:** The user should be able to edit stock items<br/>
**Acceptance Criteria:** The user should be able to delete stock items<br/>

#### Managing customers
_As a shop manager_<br/>
_I want to manage records of my customers_<br/>
_So that I can track who I rent items to_<br/>
**Acceptance Criteria:** The user should be able to create customer records<br/>
**Acceptance Criteria:** The user should be able to edit customer records<br/>
**Acceptance Criteria:** The user should be able to delete customer records<br/>

#### Renting items
_As a shop manager_<br/>
_I want to create records of rentals_<br/>
_So that I can rent items to customers_<br/>
**Acceptance Criteria:** The user should be able to assign a stock item to a customer<br/>
**Acceptance Criteria:** The user should be able to remove the item from the customer again<br/>

#### View all rentals
_As a shop manager_<br/>
_I want to view a summary of all current rentals_<br/>
_So I can see which items are currently with customers_<br/>
**Acceptance Criteria:** The user should be able to view details of current rentals in one place


## Possible Extensions

* The manager should be able to search their stock for a particular item
* The manager should be able to filter stock by category
* The manager should be able to see which items are overdue for return
* Anything else which you feel fits with what your shop is renting out

### User Stories

#### Searching
_As a shop manager_<br/>
_I want to search for a specific item_<br/>
_So that I can find out if it has been rented out_<br/>
**Acceptance Criteria:** The user should be able to search for an item in stock<br/>
**Acceptance Criteria:** Searching for an item should return the details for that item<br/>

#### Filtering
_As a shop manager_<br/>
_I want to filter my stock by category_<br/>
_So that I can see the details for items in that category_<br/>
**Acceptance Criteria:** The user should be able to search for stock belonging to a certain category<br/>

#### Checking for overdue items
_As a shop manager_<br/>
_I want to see a list of overdue items_<br/>
_So that I can find out which customers have them_<br/>
**Acceptance Criteria:** The user should have some way of tracking how long an item has been rented out for<br/>
**Acceptance Criteria:** The user should have some way of recording how long a rental should last<br/>
**Acceptance Criteria:** The user should be able to filter the list of rentals to show those which are overdue<br/>
**Acceptance Criteria:** From that filtered view, the user should be able to find the details of any customers who have overdue items