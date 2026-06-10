import java.awt.*;
import javax.swing.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class Profile extends JFrame {
    private Container c;
    private JLabel titleLabel, accType, name, mobile, email, address, citizen, marriage, occupation, income;
    private JTextField ta, taT, taE, taA, taN, taEm, taI,asc;
    private JComboBox<String> mar; // Assuming this is a string type
    private JButton logBtn, backBtn;
    private Font f, fp, fd;
    private Cursor cursor;

    public Profile() {
        initComponents();
    }

    public void initComponents() {
        setSize(550, 550);
        setResizable(false);
        setLocationRelativeTo(null);
        c = getContentPane();
        c.setLayout(null);

        Color redish = new Color(178, 221, 242);
        c.setBackground(redish);
        f = new Font("Moderustic", Font.BOLD, 17);
        fp = new Font("Arial", Font.ITALIC, 14);
        fd = new Font("Arial", Font.ITALIC, 15);
        cursor = new Cursor(Cursor.HAND_CURSOR);
        Color charcoalGray = new Color(54, 69, 79);

        titleLabel = new JLabel("Bank Account Personal Details");
        titleLabel.setForeground(charcoalGray);
        titleLabel.setFont(new Font("Helvetica", Font.BOLD, 20));
        titleLabel.setBounds(100, 20, 350, 60);
        c.add(titleLabel);

        accType = new JLabel("1. Account Type:");
        accType.setForeground(charcoalGray);
        accType.setFont(f);
        accType.setBounds(30, 150, 450, 25);
        c.add(accType);
		asc = new JTextField();
        asc.setBounds(180, 150, 300, 25);
        asc.setBackground(Color.WHITE);
        asc.setForeground(Color.BLACK);
        asc.setHorizontalAlignment(JTextField.CENTER);
        asc.setCursor(cursor);
        asc.setFont(fd);
        c.add(asc);


        name = new JLabel("3. Name");
        name.setBounds(30, 180, 70, 25);
        name.setFont(f);
        c.add(name);

        ta = new JTextField();
        ta.setBounds(105, 180, 395, 25);
        ta.setBackground(Color.WHITE);
        ta.setForeground(Color.BLACK);
        ta.setHorizontalAlignment(JTextField.CENTER);
        ta.setCursor(cursor);
        ta.setFont(fd);
        c.add(ta);

        mobile = new JLabel("4. Telephone");
        mobile.setBounds(30, 215, 110, 25);
        mobile.setFont(f);
        c.add(mobile);

        taT = new JTextField();
        taT.setBounds(140, 215, 130, 25);
        taT.setBackground(Color.WHITE);
        taT.setHorizontalAlignment(JTextField.CENTER);
        taT.setFont(fd);
        taT.setCursor(cursor);
        c.add(taT);

        email = new JLabel("5. Email");
        email.setBounds(280, 215, 70, 25);
        email.setFont(f);
        c.add(email);

        taE = new JTextField();
        taE.setBounds(350, 215, 150, 25);
        taE.setBackground(Color.WHITE);
        taE.setHorizontalAlignment(JTextField.CENTER);
        taE.setFont(fp);
        taE.setCursor(cursor);
        c.add(taE);

        address = new JLabel("6. Mailing Home Address");
        address.setBounds(30, 250, 200, 25);
        address.setFont(f);
        c.add(address);

        taA = new JTextField();
        taA.setBounds(240, 250, 260, 25);
        taA.setBackground(Color.WHITE);
        taA.setHorizontalAlignment(JTextField.CENTER);
        taA.setFont(fp);
        taA.setCursor(cursor);
        c.add(taA);

        citizen = new JLabel("7. Nationality");
        citizen.setBounds(30, 285, 120, 25);
        citizen.setFont(f);
        c.add(citizen);

        taN = new JTextField();
        taN.setBounds(140, 285, 150, 25);
        taN.setBackground(Color.WHITE);
        taN.setHorizontalAlignment(JTextField.CENTER);
        taN.setFont(fp);
        taN.setCursor(cursor);
        c.add(taN);

        marriage = new JLabel("8. Marital Status");
        marriage.setBounds(300, 285, 130, 25);
        marriage.setFont(f);
        c.add(marriage);

        mar = new JComboBox<>(new String[]{"Single", "Married", "Divorced"});
        mar.setBounds(435, 285, 70, 25);
		mar.setBackground(Color.WHITE);
        c.add(mar);

        occupation = new JLabel("9. Occupation");
        occupation.setBounds(30, 320, 120, 25);
        occupation.setFont(f);
        c.add(occupation);

        taEm = new JTextField();
        taEm.setBounds(150, 320, 150, 25);
        taEm.setBackground(Color.WHITE);
        taEm.setHorizontalAlignment(JTextField.CENTER);
        taEm.setFont(fp);
        taEm.setCursor(cursor);
        c.add(taEm);

        income = new JLabel("10. Monthly Income");
        income.setBounds(300, 320, 170, 25);
        income.setFont(f);
        c.add(income);

        taI = new JTextField();
        taI.setBounds(460, 320, 70, 25);
        taI.setBackground(Color.WHITE);
        taI.setHorizontalAlignment(JTextField.CENTER);
        taI.setFont(fp);
        taI.setCursor(cursor);
        c.add(taI);

        backBtn = new JButton("BACK");
        backBtn.setBounds(30, 375, 120, 30);
        backBtn.setBackground(Color.BLACK);
        backBtn.setForeground(Color.WHITE);
        backBtn.setFont(f);
        backBtn.setCursor(cursor);
        c.add(backBtn);

        backBtn.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                dispose();
                ///Login frame = new Login();
                //frame.setVisible(true);
            }
        });

        logBtn = new JButton("Login");
        logBtn.setBounds(380, 375, 120, 30);
        logBtn.setBackground(Color.BLACK);
        logBtn.setForeground(Color.WHITE);
        logBtn.setFont(f);
        logBtn.setCursor(cursor);
        c.add(logBtn);

        logBtn.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
				dispose();
                
            }
        });
    }

    public static void main(String[] args) {
        Profile frame = new Profile();
        frame.setVisible(true);
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setTitle("PROFILE");
    }
}

