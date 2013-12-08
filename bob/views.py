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
        




  
 