
import java.sql.*;
public class Main2 {
    Connection conn;
    PreparedStatement pst;
    Main2(){
        connect();
        add();
    }
    public static void main(String[] args) {

       Main2 x =  new Main2();
    }



    public void connect()
    {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost/test", "root","Password101");
            System.out.println("Success");
        }
        catch (ClassNotFoundException ex)
        {
            ex.printStackTrace();

        }
        catch (SQLException ex)
        {
            ex.printStackTrace();
        }
    }
    public void add(){

        String name = "avc", phone= "098766";
        int id = 2;

        try {
            pst = conn.prepareStatement("insert into first(idfirst,name,phone)values(?,?,?)");
            pst.setInt(1, id);
            pst.setString(2, name);
            pst.setString(3, phone);
            System.out.println("Added");


            pst.executeUpdate();
        }

        catch (SQLException e1)
        {

            e1.printStackTrace();
        }

    }


    }
