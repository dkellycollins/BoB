from django.conf.urls import patterns, url
from bob import views

urlpatterns = patterns('',
 #  url(r'^$', views.index, name='index'),
   url(r'customer/(?P<customer_id>\d+)/$', views.customer, name='account'),
#   url(r'^/customer/(?<account_id>\d+/$', views.customer, name='customer'),
  url(r'manage/customer/(?P<customer_id>\d+)/$', views.manageCustomer, name='manageCustomer'),
  url(r'transfer/$', views.transfer, name='transfer'),
  url(r'bank/(?P<bank_id>\d+)/$', views.bank, name='bank'),
  url(r'manage/bank/(?P<customer_id>\d+)/$', views.manageBank, name='manageBank'),
)