import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartFrame;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.data.category.DefaultCategoryDataset;
import org.jfree.data.general.DefaultPieDataset;
import java.sql.*;

public class Results {
	public static void main(String[] args) {

		int tdelay = 0,tdelay1 = 0,tdelay2 = 0,tdelay3 = 0,tdelay4 = 0;
		int count=0;


		try {
			DBCon db = new DBCon();
			Connection con = db.getConnection();
			Statement stmt = con.createStatement();

			ResultSet rs = stmt.executeQuery("SELECT * FROM TimeDelay");

			while (rs.next() == true) {
				count=count+1;
				
				if(count==1)
				{				

				tdelay=Integer.parseInt(rs.getString("tdelay"));
				}
				
				if(count==2)
				{				

				tdelay1=Integer.parseInt(rs.getString("tdelay"));
				}				
				if(count==3)
				{				

				tdelay2=Integer.parseInt(rs.getString("tdelay"));
				}				
				if(count==4)
				{				

				tdelay3=Integer.parseInt(rs.getString("tdelay"));
				}				
				if(count==5)
				{				

				tdelay4=Integer.parseInt(rs.getString("tdelay"));
				}				

			}
			
			

			DefaultCategoryDataset dataSet = new DefaultCategoryDataset();
			dataSet.setValue(tdelay, "Time Delay", "Total Time Delay");
			dataSet.setValue(tdelay1, "Time Delay1", "Total Time Delay1");
			dataSet.setValue(tdelay2, "Time Delay2", "Total Time Delay2");
			dataSet.setValue(tdelay3, "Time Delay3", "Total Time Delay3");
			dataSet.setValue(tdelay4, "Time Delay4", "Total Time Delay4");
			
			
			

			JFreeChart chart = ChartFactory.createBarChart3D("Mitigating Denial of Service Attacks in OLSR Protocol Using Fictitious Nodes",
							"Time Delay Details", "Total Activities",
							dataSet, PlotOrientation.VERTICAL, true, true, true);
			ChartFrame chartFrame = new ChartFrame("Mitigating Denial of Service Attacks in OLSR Protocol Using Fictitious Nodes",
					chart);
			chartFrame.setVisible(true);
			chartFrame.setSize(800, 500);
		} catch (Exception ex) {
			System.out.println(ex);

		}

	}
}