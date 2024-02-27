package GUI;

import java.awt.*;

import javax.imageio.ImageIO;
import javax.swing.*;
import java.awt.event.*;
import java.io.File;
import java.io.IOException;

import javax.swing.event.*;

public class SignUp extends JFrame implements ActionListener {
	private JPanel signUpPage;
	private JLabel firstName, middleName, lastName, gender, email, telNo, password, checkPassword;
	private JTextField fNameField, mNameField, lNameField, emailField, telNoField, passField, chPassField;
	private JButton signup;
	private JComboBox<String> chooseGen;
	private String[] genChoices = {"Female", "Male"};
	private JCheckBox noMiddleName;
	Caller c = new Caller();
	public SignUp() {
		signUpPage = new JPanel() {
            protected void paintComponent(Graphics g) {
                super.paintComponent(g);
                try {

                    Image image = ImageIO.read(new File("C:/Users/ADI/Downloads/temp4.jpg"));

                    g.drawImage(image, 0, 0, getWidth(), getHeight(), this);
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        };
		signUpPage.setLayout(null);
		/*
		setTitle("Recipe Page");
		setSize(1920, 1080);
		setDefaultCloseOperation(EXIT_ON_CLOSE);
		*/
		major();
		
		c.add(signUpPage);
		c.setVisible(true);
	}
	
	public void major() {
		//Labels
		firstName = new JLabel("First Name: ");
		middleName = new JLabel("Middle Name: ");
		lastName = new JLabel("Last Name: ");
		gender = new JLabel("Gender: ");
		email = new JLabel("Email: ");
		telNo = new JLabel("Telephone No.: ");
		password = new JLabel("Password: ");
		checkPassword = new JLabel("Confirm Password: ");
		
		//text fields
		fNameField = new JTextField(60);
		mNameField = new JTextField(60);
		lNameField = new JTextField(60);
		emailField = new JTextField(60);
		telNoField = new JTextField(60);
		passField = new JTextField(60);
		chPassField = new JTextField(60);
		
		//button
		signup = new JButton("Sign Up");
		
		//combo box
		chooseGen = new JComboBox<String>(genChoices);
		
		//check box
		noMiddleName = new JCheckBox("No Middle Name");

		//set bounds
		
		firstName.setBounds(400, 100, 100, 20);
		fNameField.setBounds(530, 100, 200, 20);

		middleName.setBounds(400, 130, 100, 20);
		mNameField.setBounds(530, 130, 200, 20);
		noMiddleName.setBounds(760, 130, 150, 20);

		lastName.setBounds(400, 160, 100, 20);
		lNameField.setBounds(530, 160, 200, 20);

		gender.setBounds(400, 190, 100, 20);
		chooseGen.setBounds(530, 190, 200, 20);

		email.setBounds(400, 220, 100, 20);
		emailField.setBounds(530, 220, 200, 20);

		telNo.setBounds(400, 250, 100, 20);
		telNoField.setBounds(530, 250, 200, 20);

		password.setBounds(400, 280, 100, 20);
		passField.setBounds(530, 280, 200, 20);

		checkPassword.setBounds(400, 310, 130, 20);
		chPassField.setBounds(530, 310, 200, 20);
		
		signup.setBounds(500, 360, 150, 30);
		//add
		signUpPage.add(firstName);
		signUpPage.add(fNameField);
		signUpPage.add(middleName);
		signUpPage.add(mNameField);
		signUpPage.add(noMiddleName);
		signUpPage.add(lastName);
		signUpPage.add(lNameField);
		signUpPage.add(gender);
		signUpPage.add(chooseGen);
		signUpPage.add(email);
		signUpPage.add(emailField);
		signUpPage.add(telNo);
		signUpPage.add(telNoField);
		signUpPage.add(password);
		signUpPage.add(passField);
		signUpPage.add(checkPassword);
		signUpPage.add(chPassField);
		signUpPage.add(signup);

	}
	
	@Override
	public void actionPerformed(ActionEvent e) {
		// TODO Auto-generated method stub
		
	}
	
}
