package GUI;

import javax.swing.*;
import java.awt.*;

public class SignupPage extends JFrame {

    public SignupPage() {
        setTitle("Signup Page");
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setLayout(new GridBagLayout());
        setSize(1920, 1080);
        createComponents();

        // Center the frame on a 1920 x 1080 screen
        //setLocation((1920 - getWidth()) / 2, (1080 - getHeight()) / 2);

        //pack(); // Adjusts the frame size based on components
        setVisible(true);
    }

    private void createComponents() {
        GridBagConstraints gbc = new GridBagConstraints();
        gbc.insets = new Insets(5, 5, 5, 5); // Padding

        // First Name
        addLabel("First Name:", 0, 0, gbc);
        addTextField(1, 0, gbc);

        // Middle Name
        addLabel("Middle Name:", 0, 1, gbc);
        addTextField(1, 1, gbc);

        // Last Name
        addLabel("Last Name:", 0, 2, gbc);
        addTextField(1, 2, gbc);

        // Gender
        addLabel("Gender:", 0, 3, gbc);
        addComboBox(new String[]{"Select", "Male", "Female", "Other"}, 1, 3, gbc);

        // Email
        addLabel("Email:", 0, 4, gbc);
        addTextField(1, 4, gbc);

        // Telephone Number
        addLabel("Telephone Number:", 0, 5, gbc);
        addTextField(1, 5, gbc);

        // Password
        addLabel("Password:", 0, 6, gbc);
        addPasswordField(1, 6, gbc);

        // Confirm Password
        addLabel("Confirm Password:", 0, 7, gbc);
        addPasswordField(1, 7, gbc);
    }

    private void addLabel(String text, int gridx, int gridy, GridBagConstraints gbc) {
        JLabel label = new JLabel(text);
        gbc.gridx = gridx;
        gbc.gridy = gridy;
        gbc.anchor = GridBagConstraints.WEST;
        add(label, gbc);
    }

    private void addTextField(int gridx, int gridy, GridBagConstraints gbc) {
        JTextField textField = new JTextField(20);
        gbc.gridx = gridx;
        gbc.gridy = gridy;
        gbc.anchor = GridBagConstraints.WEST;
        gbc.fill = GridBagConstraints.HORIZONTAL;
        add(textField, gbc);
    }

    private void addComboBox(String[] options, int gridx, int gridy, GridBagConstraints gbc) {
        JComboBox<String> comboBox = new JComboBox<>(options);
        gbc.gridx = gridx;
        gbc.gridy = gridy;
        gbc.anchor = GridBagConstraints.WEST;
        gbc.fill = GridBagConstraints.HORIZONTAL;
        add(comboBox, gbc);
    }

    private void addPasswordField(int gridx, int gridy, GridBagConstraints gbc) {
        JPasswordField passwordField = new JPasswordField(20);
        gbc.gridx = gridx;
        gbc.gridy = gridy;
        gbc.anchor = GridBagConstraints.WEST;
        gbc.fill = GridBagConstraints.HORIZONTAL;
        add(passwordField, gbc);
    }

    public static void main(String[] args) {
        SwingUtilities.invokeLater(() -> new SignupPage());
    }
}

