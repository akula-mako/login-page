import javax.swing.*;
import java.awt.*;
import java.awt.event.*;

public class login extends JFrame{
    private JPanel Panel;
    private JTextField textField1;
    private JButton loginButton;
    private JPasswordField passwordField1;
    private JLabel message;
    private JCheckBox terms;
    private JPanel email;
    private JTextField emailTextField;

    public login() {
        setSize(500, 500);
        setContentPane(Panel);
        setVisible(true);
        loginButton.setEnabled(false);

        loginButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                String password = passwordField1.getText();
                boolean hasUpperCase = !password.equals(password.toLowerCase());
                boolean hasDigit = password.matches(".*\\d.*");

                if (password.length() > 8 && hasUpperCase && hasDigit) {
                    String email = emailTextField.getText();
                    String emailRegex = "^[\\w.-]+@[\\w.-]+\\.[a-zA-Z]{2,}$";

                    if (email.matches(emailRegex)) {
                        message.setForeground(Color.green);
                        message.setText("Login successful");
                    } else {
                        message.setForeground(Color.red);
                        message.setText("Invalid email format");
                    }
                } else {
                    message.setForeground(Color.red);
                    message.setText("Password must have more than 8 characters, at least 1 uppercase letter, and 1 number");
                }
            }
        });

        textField1.addFocusListener(new FocusAdapter() {
            @Override
            public void focusLost(FocusEvent e) {
                super.focusLost(e);
                if (textField1.getText().length() <= 5) {
                    message.setForeground(Color.red);
                    message.setText("Your username should be more than 5 characters");
                    textField1.requestFocus();
                } else {
                    message.setText(" ");
                }
            }
        });

        terms.addItemListener(new ItemListener() {
            @Override
            public void itemStateChanged(ItemEvent e) {
                loginButton.setEnabled(terms.isSelected());
            }
        });

        passwordField1.addFocusListener(new FocusAdapter() {
            @Override
            public void focusLost(FocusEvent e) {
                super.focusLost(e);

                String password = passwordField1.getText();
                boolean hasUpperCase = !password.equals(password.toLowerCase());
                boolean hasDigit = password.matches(".*\\d.*");

                if (password.length() > 8 && hasUpperCase && hasDigit) {
                    message.setForeground(Color.green);
                    message.setText("Good password");
                } else {
                    message.setForeground(Color.red);
                    message.setText("Password must have more than 8 characters, at least 1 uppercase letter, and 1 number");
                }
            }
        });
    }
}
