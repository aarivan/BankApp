# Online Bank application. 

Points applicable throughout the bank app:

	1. A user can have multiple accounts to manage money.
	2. User needs an admin’s authorization to deposit money.
	3. User needs an admin’s authorization to withdraw money if  the transaction amount is greater than $1000 from his/her account.
	4. User should be able to search through the list of users ( by name or email address) and add them as friends.
	5. User can transfer money between his/her accounts and to a friend’s account without permission from an admin.
	6. An admin has the authorization to approve or decline any pending transactions.

There will be two types of users in the system:

	1. Admin
	2. User

# Admins

The system should have a preconfigured Admin, which cannot be deleted or modified by other admins.

Any admin user will have the following attributes: email (unique for each admin), name and password.

All admins can perform the following tasks:

	1. Log in with an email and password
	2. Edit her/his profile details
	3. Manage admins
		3.1 Create new admins
		3.2 View the list of all the admins and their profile details (except password)
		3.3 Delete admins (except herself/himself and the preconfigured Admin)
	Manage account
		3.4 Create an account for a user. An account will have the following attributes: Account Number (unique for each account, 9-digit number), status, balance
			3.4.1 Possible values for the status attribute:
				3.4.1.1 Active - all the transaction operations, deposit, withdraw, send and borrow are available.
				3.4.1.2 Closed - All the transaction operations are unavailable.
		3.5 View the list of all the accounts. View the balance for the accounts
		3.6 View the details(account number, status, balance) of an account. Also, show the user who own the account.
		3.7 Edit the details of an account
			3.7.1 Admin can change the status of an account 
		3.8 Approve or decline a transaction request
			3.8.1 Once the transaction is approved, the change should be reflected to the account immediately.
		3.9 View the transaction history of an account
			3.9.1 a history of the pending transactions that are not canceled by user before approved or declined.
			3.9.2 a history of the transactions that have been approved and declined.
		3.10 Delete an account from the system
	4. Manage Users
		4.1 View the list of all the users and their profile details (except password)
		4.2 View the transaction history of a user 
			4.2.1 a history of the pending transactions that did not canceled before approved or declined.
			4.2.2 a history of the transactions that have been approved and declined.
		4.3 Delete a user


# Users

A user will have the following attributes: email (unique for each member), name and password.

Anyone can sign up as a user using their email, name and password. After signup, she/he can do the following tasks:

	1. Log in with email and password
	2. Edit her/his profile details
	3. View the details of his/her accounts
	4. Request the admin to create bank accounts
	5. Search other users using email or name.
	6. Add other users as friend
		6.1 A user can only transfer money to friends.
		6.2 Users who are not friends are not allowed to transfer money between themselves.
	7. View the list of his friends.
	8. View the list of transactions with their details. For example, the amount, from which account to which, status, start date and effective date.
	9. Cancel a transaction request.

--------------------------------------------------------------------------------------------------------------------------------

Production Enviroment: http://secure-online-banking.herokuapp.com/

Preconfigured admin
--------------------------------------------------------------------------------------------------------------------------------
A super admin is provided with the following credentials

    Email: admin@ncsu.edu
    Password: admin
	
Before Sign-in:
--------------------------------------------------------------------------------------------------------------------------------
1. Login with the admin/user's email id
2. Signup to create a new user email.

After Sign-in:
--------------------------------------------------------------------------------------------------------------------------------
ADMIN

* Home: 
It is the landing page for the admin.
* List of Transactions: 
This displays the list of user transactions. The admin can see the transactions of various users and their accounts. The transaction statuses can be observed. Wherever the transaction is pending, the admin can either cancel the transaction or approve it.
* User List:
The user list is displayed to the admin. The user search bar can be used by the admin to search for a user. The email-id needs to be entered in order to search for the user. Here, the admin can delete a particular user if there is no pending transaction on any of his accounts.
* Accounts List:
The accounts list is displayed to the admin. Here, the admin can delete a particular account if there is no pending transaction on the accounts. By entering the user's email id directly, the admin can create an account for him/her.
* New Account Request:
The admin can see the list of account creation requests by the users. The admin can either approve or reject the account creation requests. 
* Admin Details:
Here, the admin can see the list of other admins. The delete button remains on for the admin who isn't pre-configured. The admin has the privilege to add or delete another admin. The "ADD NEW ADMIN" option helps you to create new admins.
* Edit my profile:
Here, the admin can change his account password.
* Logout


USER

* Home: 
Its the landing page for the user. The user can request a new account from this page. He can view his accounts and its balance in the drop down box. The list of transactions can be viewed on the same page.
* Make a Transfer:
The user can initiate various types of transactions here. The options provided are : Transfer, Deposit and Withdraw. Deposit and Withdrawal (above 1000) requires admin permissions. Transfers can be made to other users added as beneficiaries. 
* Search User:
This allows a user to search for other users by email and know their details to add them as beneficiaries. One needs to type the email id in the search bar.
* Manage Beneficiaries:
Manage beneficiaries allows us to add beneficiaries in order to initiate transfers. A user can add other users as beneficiaries. Also, the user can see the his own beneficiary list on the same page.
* Settings:
Here, the user can change his account password.
* Logout
