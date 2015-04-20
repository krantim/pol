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

    public Account mapAccount(EasyNetAccount easyNetAccount) {
        Account account = null;

        String[] details = easyNetAccount.getBalanceDetail().split(";");

        NumberFormat format = NumberFormat.getInstance(new Locale("th", "TH"));

        try {
            account = new Account(details[0].trim(), format.parse(details[1]).doubleValue());
        } catch (ParseException e) {
            //TODO error handling
            e.printStackTrace();
        }
        return account;
    }

}
