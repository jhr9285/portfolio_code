// 도서관리
package haksa;
import java.awt.Dimension;
import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.swing.JComboBox;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.table.DefaultTableModel;

public class BookRent_p extends JPanel {
	DefaultTableModel model;
	JTable table;
	Connection conn = null;
	PreparedStatement psmt;
	String query;
	
	public BookRent_p() {
		query = "SELECT student.id, student.name, books.title, bookRent.rDate "
				+ "FROM student, books, bookRent "
				+ "WHERE student.id = bookRent.id AND books.no = bookRent.bookNo";
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/sampledb?useSSL=false&useUnicode=true&characterEncoding=UTF-8", "root", "1234");
			psmt = conn.prepareStatement(query);
			
		} catch(Exception e) {
			e.printStackTrace();
		}

		this.setLayout(null);
		
		Font ng = new Font("NanumGothic", Font.BOLD, 14);

		JLabel l_dept = new JLabel("학과별 대출현황");
		l_dept.setFont(ng);
		l_dept.setBounds(10, 15, 130, 20);
		add(l_dept);
		
		String[] dept = {"전체", "컴퓨터시스템", "멀티미디어", "컴퓨터공학", "철학", "역사학", "회계학", "체육학", "국어국문학과"};
		JComboBox cb_dept = new JComboBox(dept);
		cb_dept.setBounds(120, 15, 100, 20);
		add(cb_dept);
		
		cb_dept.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				query = "SELECT student.id, student.name, books.title, bookRent.rDate "
						+ "FROM student, books, bookRent "
						+ "WHERE student.id = bookRent.id AND books.no = bookRent.bookNo ";
				
				JComboBox cb = (JComboBox)e.getSource();

				if(cb.getSelectedIndex() == 0) {
					query += " ORDER BY student.id";
				} else if(cb.getSelectedIndex() == 1) { 
					query += " AND student.dept ='컴퓨터시스템' ORDER BY bookRent.no" ;
				} else if(cb.getSelectedIndex() == 2) { 
					query += " AND student.dept ='멀티미디어' ORDER BY bookRent.no" ;
				} else if(cb.getSelectedIndex() == 3) { 
					query += " AND student.dept ='컴퓨터공학' ORDER BY bookRent.no" ;
				} else if(cb.getSelectedIndex() == 4) { 
					query += " AND student.dept ='철학' ORDER BY bookRent.no" ;
				} else if(cb.getSelectedIndex() == 5) { 
					query += " AND student.dept ='역사학' ORDER BY bookRent.no" ;
				} else if(cb.getSelectedIndex() == 6) { 
					query += " AND student.dept ='회계학' ORDER BY bookRent.no" ;
				} else if(cb.getSelectedIndex() == 7) { 
					query += " AND student.dept ='체육학' ORDER BY bookRent.no" ;
				} else if(cb.getSelectedIndex() == 8) { 
					query += " AND student.dept ='국어국문학과' ORDER BY bookRent.no" ;
				} 
				
				list(); 
			}
		});
		
		String[] colName = {"학번", "이름", "도서명", "대출일"};
		model = new DefaultTableModel(colName, 0);
		table = new JTable(model);
		table.setPreferredScrollableViewportSize(new Dimension(470, 200));
		add(table);
		JScrollPane sp = new JScrollPane(table);
		sp.setBounds(10, 50, 450, 320);
		add(sp);
		
		this.setSize(490, 440);
		this.setVisible(true);
	}

	public void list() {
		try {
			ResultSet rs = psmt.executeQuery(query);
			
			model.setNumRows(0);
			
			while(rs.next()){
				String[] row = new String[4];
				row[0] = rs.getString("id");
				row[1] = rs.getString("name");
				row[2] = rs.getString("title");
				row[3] = rs.getString("rDate");
				model.addRow(row);
			}
			rs.close();
			
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
	}
}
