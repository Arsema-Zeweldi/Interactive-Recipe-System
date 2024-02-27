package GUI;

import javax.imageio.ImageIO;
import javax.swing.*;

import java.awt.Color;
import java.awt.Cursor;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.GridLayout;
import java.awt.Image;
import java.awt.event.*;
import java.io.File;
import java.io.IOException;

public class menu implements MouseListener {
	private JPanel menuPanel;
	private JLabel meatBased, seafood, vegi, poultry, pasta, international, grain, breakfast, dessert;
	
	
	public menu() {
		Caller c3 = new Caller();
		menuPanel = new JPanel();
		menuPanel.setLayout(new GridLayout(3, 3, 5, 5));
		major();
		c3.add(menuPanel);
		c3.setVisible(true);
	}
	
	public void major() {
		meatBased = new JLabel("Meat Based Dishes");
		ImageIcon meatIcon = new ImageIcon("C:/Users/ADI/Desktop/Hilcoe/CS224 (java)/Project/images/meat.jpg");
		seafood = new JLabel("Seafood Dishes");
		ImageIcon seafoodIcon = new ImageIcon("C:/Users/ADI/Desktop/Hilcoe/CS224 (java)/Project/images/fish.jpg");
		vegi = new JLabel("Vegitarian and Vegan");
		ImageIcon vegiIcon = new ImageIcon("C:/Users/ADI/Desktop/Hilcoe/CS224 (java)/Project/images/veg.jpg");
		poultry = new JLabel("Poultry Dishes");
		ImageIcon poultryIcon = new ImageIcon("C:/Users/ADI/Desktop/Hilcoe/CS224 (java)/Project/images/poultry.jpg");
		pasta = new JLabel("Pasta and Rice");
		ImageIcon pastaIcon = new ImageIcon("C:/Users/ADI/Desktop/Hilcoe/CS224 (java)/Project/images/mac.jpg");
		international = new JLabel("International Main Dishes");
		ImageIcon internationalIcon = new ImageIcon("C:/Users/ADI/Desktop/Hilcoe/CS224 (java)/Project/images/taco.jpg");
		grain = new JLabel("Grain and Legume");
		ImageIcon grainIcon = new ImageIcon("C:/Users/ADI/Desktop/Hilcoe/CS224 (java)/Project/images/grain.jpg");
		breakfast = new JLabel("Breakfast");
		ImageIcon breakfastIcon = new ImageIcon("C:/Users/ADI/Desktop/Hilcoe/CS224 (java)/Project/images/breakfast.jpg");
		dessert = new JLabel("Dessert");
		ImageIcon dessertIcon = new ImageIcon("C:/Users/ADI/Desktop/Hilcoe/CS224 (java)/Project/images/dessert.jpg");
		
		meatBased.setForeground(Color.white);
		meatBased.setFont(new Font("Serif", Font.BOLD, 40));
		meatBased.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
		seafood.setForeground(Color.white);
		seafood.setFont(new Font("Serif", Font.BOLD, 40));
		seafood.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
		vegi.setForeground(Color.white);
		vegi.setFont(new Font("Serif", Font.BOLD, 40));
		vegi.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
		poultry.setForeground(Color.white);
		poultry.setFont(new Font("Serif", Font.BOLD, 40));
		poultry.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
		pasta.setForeground(Color.white);
		pasta.setFont(new Font("Serif", Font.BOLD, 40));
		pasta.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
		international.setForeground(Color.white);
		international.setFont(new Font("Serif", Font.BOLD, 40));
		international.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
		grain.setForeground(Color.white);
		grain.setFont(new Font("Serif", Font.BOLD, 40));
		grain.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
		breakfast.setForeground(Color.white);
		breakfast.setFont(new Font("Serif", Font.BOLD, 40));
		breakfast.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
		dessert.setForeground(Color.white);
		dessert.setFont(new Font("Serif", Font.BOLD, 40));
		dessert.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
		
		meatBased.setIcon(meatIcon);
		meatBased.setHorizontalTextPosition(JLabel.CENTER);
		menuPanel.add(meatBased);
		seafood.setIcon(seafoodIcon);
		seafood.setHorizontalTextPosition(JLabel.CENTER);
		menuPanel.add(seafood);
		vegi.setIcon(vegiIcon);
		vegi.setHorizontalTextPosition(JLabel.CENTER);
		menuPanel.add(vegi);
		poultry.setIcon(poultryIcon);
		poultry.setHorizontalTextPosition(JLabel.CENTER);
		menuPanel.add(poultry);
		pasta.setIcon(pastaIcon);
		pasta.setHorizontalTextPosition(JLabel.CENTER);
		menuPanel.add(pasta);
		international.setIcon(internationalIcon);
		international.setHorizontalTextPosition(JLabel.CENTER);
		menuPanel.add(international);
		grain.setIcon(grainIcon);
		grain.setHorizontalTextPosition(JLabel.CENTER);
		menuPanel.add(grain);
		breakfast.setIcon(breakfastIcon);
		breakfast.setHorizontalTextPosition(JLabel.CENTER);
		menuPanel.add(breakfast);
		dessert.setIcon(dessertIcon);
		dessert.setHorizontalTextPosition(JLabel.CENTER);
		menuPanel.add(dessert);
		
		meatBased.addMouseListener(this);
		seafood.addMouseListener(this);
		vegi.addMouseListener(this);
		poultry.addMouseListener(this);
		pasta.addMouseListener(this);
		international.addMouseListener(this);
		grain.addMouseListener(this);
		breakfast.addMouseListener(this);
		dessert.addMouseListener(this);
	}

	@Override
	public void mouseClicked(MouseEvent e) {
		// TODO Auto-generated method stub
		if (e.getSource() == meatBased) {
			
		}
		
	}

	@Override
	public void mousePressed(MouseEvent e) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void mouseReleased(MouseEvent e) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void mouseEntered(MouseEvent e) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void mouseExited(MouseEvent e) {
		// TODO Auto-generated method stub
		
	}

}
