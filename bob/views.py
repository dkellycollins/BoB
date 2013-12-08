from django.http import HttpResponse

from django.template import RequestContext, loader

from bob.models import *

from django.contrib.auth import *
    
def customer(request, customer_id):
    cash_accounts = CashAccount.objects.filter(customer = Customer.objects.get(id = customer_id))
    bitcoin_accounts = BitcoinAccount.objects.filter(customer = Customer.objects.get(id = customer_id))
    for account in cash_accounts:
        account.account_type = "cash"
        account.transactions = Transfer.objects.filter(buyerID = account) | Transfer.objects.filter(seller = account)
    for account in bitcoin_accounts:
        account.account_type = "bitcoin"
        account.transactions = Transfer.objects.filter(buyerID = account) | Transfer.objects.filter(seller = account)
    accounts = list(cash_accounts)
    accounts.extend(list(bitcoin_accounts))
    return render(request, 'bob/customerAccounts.html', {
        'accounts' : accounts
    })
    

def createUser(request):
    if request.method == 'POST':
        form = UserCreationForm(request.POST)
        if form.is_valid():
            form.save()
            return HttpResponse('/account/' + userid)
    else:
        form = UserCreationForm()
        return render(request, 'bob/user.html', {
            form : form,
        })
    
def manageCustomer(request, customer_id)
    if request.user.is_authenticated():
        if request.method == 'POST':
            return manageCustomerPost(request)
        else:
            return manageCustomerGet(request, customer_id)
    else:
        return HttpResponse('Unauthorized', status=401)
    
def manageCustomerGet(request, customer_id)
    #if customer
    customer = Customer.objects.get(id = customer_id)
    customer.accounts = Accounts.objects.filter(customer = customer)
    return render(request, 'bob/customerAccountManagement.html', {
        'customer' : customer
        })
    
def transfer(request)
    if request.user.is_authenticated():
        if request.method = 'POST':
            return transferPost(request)
        else:
            return transferGet(request)
    else:
        return HttpResponse('Unauthorized', status=401)
        
<<<<<<< HEAD
def transferGet(request)
    #if customer
    #accounts = Accounts.objects.filter(customer = Customer.objects.get(id = customer_id))
    #if bank
    #accounts = Account.objects.filter(customer = Bank.objects.get(id = bank_id))
    return render(request, 'bob/transfer.html', {
        'accounts' : accounts
        })
    
def bank(request, bank_id)
    #verify bank
    cash_accounts = CashAccount.objects.filter(bank = Bank.objects.get(id = bank_id))
    bitcoin_accounts = BitCoinAccount.objects.filter(bank = Bank.objects.get(id = bank_id))
    for account in cash_accounts:
        account.account_type = "cash"
        account.transactions = Transfer.objects.filter(buyerID = account) | Transfer.objects.filter(seller = account)
        account.customer = Customer.objects.filter(id = account.id)
    for account in bitcoin_accounts:
        account.account_type = "bitcoin"
        account.transactions = Transfer.objects.filter(buyerID = account) | Transfer.objects.filter(seller = account)
        account.customer = Customer.objects.filter(id = account.id)
    accounts = list(cash_accounts)
    accounts.extend(bitcoin_accounts)
    return render(request, 'bob/bankAccounts.html', {
        'accounts' : accounts
        })
=======
def changePassword(request):
    if request.method == 'POST' && request.user.is_authenticated():
        form = SetPasswordForm(request.POST)
        if form.isValid():
            form.save()
        return HttpResponse('/success')
    else:
        form = SetPasswordForm()
        return render(request, 'bob/form.html', {
            form : form,
        }
        




  
 
>>>>>>> 2452ce337d9226a364e0b0aaef4cbf0cc9449fbb
