# ActiveMerchant iDEAL multi-certificate patch

The iDEAL certificates sometimes expire. To support both old and new certificates for a transition period, include this gem.

## Example usage

In your Gemfile:

```ruby
gem "activemerchant"
gem "active_merchant_ideal"
gem "active_merchant_ideal_multicert"
```

(Order does matter)

In your ActiveMerchant initializer, configure multiple certificates like this:

```ruby
ActiveMerchant::Billing::IdealGateway.ideal_certificate_files = [
  "/path/to/certificate1", 
  "/path/to/certificate2"
]
```

Every time a transaction is verified, the message signature is verified
with the proper certificate identified by the message fingerprint.

## LICENSE

active_merchant_ideal_multicert is Copyright (c) 2011 Voormedia B.V. and distributed under the MIT license. See the LICENSE file for more info.

