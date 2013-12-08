from django.db import models

# Create your models here.

class Zipcode(models.Model):
    zip = models.IntegerField()
    city = models.CharField(max_length=30)
    state = models.CharField(max_length=2)
    def __unicode__(self):
        return self.zip

class ContactInfo(models.Model):
    phone_num = models.CharField(max_length=12)
    address1 = models.CharField(max_length=50)
    address2 =  models.CharField(max_length=50)
    zip = models.IntegerField()
    def __unicode__(self):
        return self.phone_num
    
class Bank(models.Model):
    name = models.CharField(max_length=30)
    bitCoinValue = models.FloatField()
    contactInfo = models.ForeignKey(ContactInfo)
    def __unicode__(self):
        return self.name

class Customer(models.Model):
    first_name = models.CharField(max_length=30)
    last_name = models.CharField(max_length=30)
    contact_info = models.ForeignKey(ContactInfo)
    def __unicode__(self):
        return self.first_name + " " + self.last_name
    
class Account(models.Model):
    interest_rate = models.FloatField()
    balance = models.FloatField()
    customer = models.ForeignKey(Customer)
    bank = models.ForeignKey(Bank)
    def __unicode__(self):
        return self.customer.first_name + " " + self.customer.last_name
    
class CashAccount(Account):
    withdrawl_fee = models.FloatField()
    number_withdraws = models.IntegerField()
    def type(self):
        return "cash"

class BitcoinAccount(Account):
    wallet_type = models.CharField(max_length=20)
    processingFee = models.FloatField()
    def type(self):
        return "bitcoin"
    
class Bitcoin(models.Model):
    public_address = models.CharField(max_length=33)
    private_key = models.CharField(max_length=30)
    balance = models.FloatField()
    def __unicode__(self):
        return self.public_address

class Transfer(models.Model):
    date = models.DateField(auto_now_add=True)
    time = models.TimeField(auto_now_add=True)
    cash_transfer = models.FloatField()
    buyerID = models.ForeignKey(Account,related_name='+')
    seller = models.ForeignKey(Account,related_name='+')
    def __unicode__(self):
        return self.id
    
class BitcoinTransfer(Transfer):
    public_address = models.ForeignKey(Bitcoin)
    def __unicode__(self):
        return self.id