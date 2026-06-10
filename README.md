import javax.swing.*;
import java.awt.*;
import java.awt.event.*;

public class ATMManagementSystem extends JFrame {
    private JRadioButton savingsBtn, currentBtn, depositBtn, withdrawBtn;
    private JTextField accountNoField, accountNameField, amountField;
    private JButton submitBtn, backBtn, clearBtn;
    private JLabel currentAmountLabel;
    private JTextArea transactionHistoryArea;
    private double currentAmount = 0;

    public ATMManagementSystem() {
        setTitle("ATM Management System");
        setSize(650, 500);
        setLayout(null);
        setLocationRelativeTo(null);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        getContentPane().setBackground(Color.CYAN);

        // A/C Type Panel
        JPanel accountTypePanel = new JPanel();
        accountTypePanel.setBorder(BorderFactory.createTitledBorder(BorderFactory.createLineBorder(Color.RED), "A/C Type"));
        accountTypePanel.setBounds(20, 20, 150, 100);
        savingsBtn = new JRadioButton("Savings");
        currentBtn = new JRadioButton("Current");
        ButtonGroup accountTypeGroup = new ButtonGroup();
        accountTypeGroup.add(savingsBtn);
        accountTypeGroup.add(currentBtn);
        accountTypePanel.add(savingsBtn);
        accountTypePanel.add(currentBtn);
        add(accountTypePanel);

        // Account Details Panel
        JPanel accountDetailsPanel = new JPanel();
        accountDetailsPanel.setBorder(BorderFactory.createTitledBorder(BorderFactory.createLineBorder(Color.BLUE), "Account Details"));
        accountDetailsPanel.setBounds(180, 20, 400, 100);
        accountDetailsPanel.setLayout(new GridLayout(2, 2));
        accountDetailsPanel.add(new JLabel("A/C No:"));
        accountNoField = new JTextField();
        accountDetailsPanel.add(accountNoField);
        accountDetailsPanel.add(new JLabel("A/C Name:"));
        accountNameField = new JTextField();
        accountDetailsPanel.add(accountNameField);
        add(accountDetailsPanel);

        // Transaction Panel
        JPanel transactionPanel = new JPanel();
        transactionPanel.setBorder(BorderFactory.createTitledBorder(BorderFactory.createLineBorder(Color.GREEN), "Transaction"));
        transactionPanel.setBounds(20, 140, 560, 150);
        transactionPanel.setLayout(null);
        depositBtn = new JRadioButton("Deposit");
        withdrawBtn = new JRadioButton("Withdraw");
        depositBtn.setBounds(20, 20, 100, 20);
        withdrawBtn.setBounds(140, 20, 100, 20);
        ButtonGroup transactionTypeGroup = new ButtonGroup();
        transactionTypeGroup.add(depositBtn);
        transactionTypeGroup.add(withdrawBtn);
        transactionPanel.add(depositBtn);
        transactionPanel.add(withdrawBtn);
        transactionPanel.add(new JLabel("Amount:")).setBounds(20, 60, 100, 20);
        amountField = new JTextField();
        amountField.setBounds(80, 60, 100, 20);
        transactionPanel.add(amountField);
        submitBtn = new JButton("Submit");
        submitBtn.setBounds(200, 60, 80, 20);
        // Add color to Submit button
        submitBtn.setBackground(Color.GREEN); // Button background color
        submitBtn.setForeground(Color.WHITE);
        transactionPanel.add(submitBtn);
        currentAmountLabel = new JLabel("Current Amount: $0.00");
        currentAmountLabel.setBounds(20, 100, 200, 20);
        transactionPanel.add(currentAmountLabel);
        add(transactionPanel);

        // Transaction History Panel
        JPanel historyPanel = new JPanel();
        historyPanel.setBorder(BorderFactory.createTitledBorder(BorderFactory.createLineBorder(Color.ORANGE), "Transaction History"));
        historyPanel.setBounds(20, 310, 560, 100);
        transactionHistoryArea = new JTextArea(4, 30);
        JScrollPane scrollPane = new JScrollPane(transactionHistoryArea);
        historyPanel.add(scrollPane);
        add(historyPanel);

        // Clear and Back Buttons with added color
        clearBtn = new JButton("Clear");
        clearBtn.setBounds(320, 420, 100, 30);
        clearBtn.setBackground(Color.RED);
        clearBtn.setForeground(Color.WHITE);
        clearBtn.addActionListener(new ClearActionListener());
        add(clearBtn);

        backBtn = new JButton("Back");
        backBtn.setBounds(460, 420, 100, 30);
        backBtn.setBackground(Color.BLUE);
        backBtn.setForeground(Color.WHITE);
        backBtn.addActionListener(new BackActionListener());
        add(backBtn);

        submitBtn.addActionListener(new SubmitActionListener());
        setVisible(true);
    }

    private class SubmitActionListener implements ActionListener {
        @Override
        public void actionPerformed(ActionEvent e) {
            handleSubmit();
        }
    }

    private class ClearActionListener implements ActionListener {
        @Override
        public void actionPerformed(ActionEvent e) {
            transactionHistoryArea.setText("");
        }
    }

    private class BackActionListener implements ActionListener {
        @Override
        public void actionPerformed(ActionEvent e) {
            dispose();
            Wellcome welcomeFrame = new Wellcome();
            welcomeFrame.setVisible(true);
        }
    }

    private void handleSubmit() {
        try {
            double amount = Double.parseDouble(amountField.getText());
            String transactionType = depositBtn.isSelected() ? "Deposit" : "Withdraw";
            if (transactionType.equals("Deposit")) {
                currentAmount += amount;
            } else if (transactionType.equals("Withdraw")) {
                if (currentAmount >= amount) {
                    currentAmount -= amount;
                } else {
                    JOptionPane.showMessageDialog(this, "Insufficient Funds");
                    return;
                }
            }
            currentAmountLabel.setText("Current Amount: $" + String.format("%.2f", currentAmount));
            transactionHistoryArea.append(transactionType + ": $" + amount + "\n");
            amountField.setText("");
        } catch (NumberFormatException ex) {
            JOptionPane.showMessageDialog(this, "Invalid amount entered. Please try again.");
        }
    }

    public static void main(String[] args) {
        new ATMManagementSystem();
    }
}
