package GUI;

import javax.imageio.ImageIO;
import javax.swing.*;

import java.awt.Color;
import java.awt.Graphics;
import java.awt.Image;
import java.awt.event.*;
import java.io.File;
import java.io.IOException;

public class SignIn implements ActionListener {
	private JPanel signin;
	private JLabel email, password;
	private JTextField emailField, passwordField;
	private JButton signInButton, signUpButton;
	private Caller c2 = new Caller();
	
	public SignIn() {
		signin = new JPanel() {
			protected void paintComponent(Graphics g) {
                super.paintComponent(g);
                try {

                    Image image = ImageIO.read(new File("C:/Users/ADI/Downloads/temp5.jpg"));

                    g.drawImage(image, 0, 0, getWidth(), getHeight(), this);
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
		};
		signin.setLayout(null);
		major();
		c2.add(signin);
		c2.setVisible(true);
	}
	
	public void major() {
		
		email = new JLabel("Email: ");
		password = new JLabel("Password: ");
		emailField = new JTextField(50);
		passwordField = new JTextField(50);
		signInButton = new JButton("Sign In");
		signUpButton = new JButton("Sign Up");
		
		//set bounds
		email.setBounds(900, 300, 50, 30);
		email.setForeground(Color.white);
		emailField.setBounds(1000, 300, 200, 30);
		
		password.setBounds(900, 360, 100, 30);
		password.setForeground(Color.white);
		passwordField.setBounds(1000, 360, 200, 30);
		
		signInButton.setBounds(940, 420, 100, 30);
		signUpButton.setBounds(1055, 420, 100, 30);
		
		//listeners
		signInButton.addActionListener(this);
		signUpButton.addActionListener(this);
		
		//add
		signin.add(email);
		signin.add(emailField);
		signin.add(password);
		signin.add(passwordField);
		signin.add(signInButton);
		signin.add(signUpButton);
	}

	@Override
	public void actionPerformed(ActionEvent e) {
		// TODO Auto-generated method stub
		if (e.getSource() == signUpButton) {
			c2.setVisible(false);
			SignUp s = new SignUp();
		}
		else if (e.getSource() == signInButton) {
			c2.setVisible(false);
			menu m = new menu();
		}
	}

}
