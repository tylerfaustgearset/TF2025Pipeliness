public class AccountSubscriptionNumberClass {
    public static void transformAccounts(List<Account> accounts) {
        for (Account acc : accounts) {
            String accountName = acc.Name;
            String accountNamePrefix = accountName.substring(0, 3);

            // Initialize the new Subscription Number and SLA Expiration Date
            String newSubscriptionNumber = null;
            String newSLAExpirationDate = null;

            // Proceed with the transformation of the subscription number
            String subscriptionNumber = acc.Subscription_number__c;
            String prefixToRemove = 'GEA-';

            if (subscriptionNumber != null && subscriptionNumber.startsWith(prefixToRemove)) {
                // Remove the "GEA-" prefix
                subscriptionNumber = subscriptionNumber.substring(prefixToRemove.length());

                // Combine the Account Name prefix with the remaining subscription number
                newSubscriptionNumber = accountNamePrefix + subscriptionNumber;

                // Ensure the length does not exceed 8
                if (newSubscriptionNumber.length() > 8) {
                    // Trim to 8 characters and add "!"
                    newSubscriptionNumber = newSubscriptionNumber.substring(0, 8) + '!';
                }
            }

            // Update the Account Subscription_number_for_Invoice__c field
            acc.Subscription_number_for_Invoice__c = newSubscriptionNumber;
        }
    }
}