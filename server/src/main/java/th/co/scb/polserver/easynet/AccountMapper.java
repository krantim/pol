package th.co.scb.polserver.easynet;

import th.co.scb.polserver.core.Account;

import java.text.NumberFormat;
import java.text.ParseException;
import java.util.HashMap;
import java.util.Locale;

public class AccountMapper {

    private HashMap<String, String> accountTypeMap = new HashMap<>();

    public AccountMapper() {
        accountTypeMap.put("2", "Savings");
    }

    public Account[] mapAccount(EasyNetUser user, EasyNetAccount[] easyNetAccounts ) {
        Account[] accounts = new Account[easyNetAccounts.length];
        for(int i=0; i<easyNetAccounts.length; i++){
            EasyNetAccount easyNetAccount = easyNetAccounts[i];
            String[] details = easyNetAccount.getBalanceDetail().split(";");

            NumberFormat format = NumberFormat.getInstance(new Locale("th","TH"));

            try {
                Account account = new Account("", accountTypeMap.get(user.getAccountType()), details[0].trim(), "", format.parse(details[1]).doubleValue());
                accounts[i] = account;
            }catch (ParseException e){
                //TODO error handling
                e.printStackTrace();
            }
        }
        return accounts;
    }

}
