// 1. HakSa 프로젝트에 '주소'를 추가해서 구현하기.
package haksa;
import java.awt.Dimension;
import java.awt.FlowLayout;
import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.JTextArea;
import javax.swing.JTextField;
import javax.swing.table.DefaultTableModel;

public class Student_p extends JPanel {
	
//====== 1. 레이블과 입력창을 만든다.========================================================================
	JLabel lblID = null; 
	JLabel lblName = null; 
	JLabel lblDepartment = null;
	JLabel lblAddress = null;
	JTextField tfID = null; 
	JTextField tfName = null;
	JTextField tfDepartment = null;
	JTextField tfAddress = null;
	JTextArea taList = null; 
	JButton btnInsert = null, btnList = null, btnUpdate = null, btnDelete = null; 
	
	DefaultTableModel model = null; 
	JTable table = null;
	
	JButton btnSearch = null;
	
	public Student_p() {
		this.setLayout(new FlowLayout()); 
		
//====== 2. 레이블과 입력창 객체를 생성한다.=================================================================								
		this.lblID = new JLabel("학번");
		this.tfID = new JTextField(29); 		
		this.btnSearch = new JButton("Search");	
		this.lblName = new JLabel("이름");
		this.tfName = new JTextField(37);
		this.lblDepartment = new JLabel("학과");
		this.tfDepartment = new JTextField(37);
		this.lblAddress = new JLabel("주소");
		this.tfAddress = new JTextField(37);
		this.taList = new JTextArea(19, 23); 			
		this.btnInsert = new JButton("등록");	
		this.btnList = new JButton("목록"); 	
		this.btnUpdate = new JButton("수정");	
		this.btnDelete = new JButton("삭제"); 	
		
		Font ng = new Font("NanumGothic", Font.BOLD, 14);
		
		lblID.setFont(ng);
		btnSearch.setFont(ng);
		lblName.setFont(ng);
		lblDepartment.setFont(ng);
		lblAddress.setFont(ng);
		taList.setFont(ng);
		btnInsert.setFont(ng);
		btnList.setFont(ng);
		btnUpdate.setFont(ng);
		btnDelete.setFont(ng);
		
//====== 3. 레이블과 입력창 객체를 프레임에 연결한다. (혹은 패널, 혹은 컨테이너) ===========================
		this.add(lblID); 
		this.add(tfID);
		this.add(btnSearch);
		this.add(lblName);
		this.add(tfName);
		this.add(lblDepartment);
		this.add(tfDepartment);
		this.add(lblAddress);
		this.add(tfAddress);

		String colName[] = {"학번", "이름", "학과", "주소"};
		model = new DefaultTableModel(colName, 0);
		table = new JTable(model);
		table.setFont(ng);
		table.setPreferredScrollableViewportSize(new Dimension(460, 280));
		
		this.add(new JScrollPane(table));
		table.getColumnModel().getColumn(3).setPreferredWidth(200); 
		
		this.add(btnInsert);
		this.add(btnList);
		this.add(btnUpdate);
		this.add(btnDelete);
		
//====== 4. 이벤트 처리 코드를 입력한다. ====================================================================
		
		this.btnList.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				Connection conn = null;
				ResultSet rs = null; 
				Statement st = null; 
				try {
					Class.forName("com.mysql.cj.jdbc.Driver");
					conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/sampledb?useSSL=false&useUnicode=true&characterEncoding=UTF-8", "root", "1234");
				
					st = conn.createStatement();
					rs = st.executeQuery("SELECT * FROM student");
					
				    model.setNumRows(0); 
				
					while(rs.next()) { 
						String[] row = new String[4];
						row[0] = rs.getString("id"); 
						row[1] = rs.getString("name");
						row[2] = rs.getString("dept");
						row[3] = rs.getString("address");
						model.addRow(row); 
					}
					
				} catch (ClassNotFoundException e1) {
						e1.printStackTrace();
				} catch (SQLException e2) {
						e2.printStackTrace();
				} finally { 
					try {
						rs.close(); 
						st.close();
						conn.close();
					} catch (SQLException e3) {
						e3.printStackTrace();
					}
				}
			}
		});
		
		this.btnInsert.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				Connection conn = null;
				ResultSet rs = null; 
				Statement st = null; 
				try {
					Class.forName("com.mysql.cj.jdbc.Driver");
					conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/sampledb?useSSL=false&useUnicode=true&characterEncoding=UTF-8", "root", "1234");
					st = conn.createStatement();
		
					st.executeUpdate("INSERT INTO student VALUES('" + tfID.getText() + "', '"+ tfName.getText() +"', '"+ tfDepartment.getText() +"', '"+ tfAddress.getText() +"');");
	
					tfID.setText("");
					tfName.setText("");
					tfDepartment.setText("");
					tfAddress.setText("");

					rs = st.executeQuery("SELECT * FROM student");
					
				    model.setNumRows(0); 

					while(rs.next()) { 
						String[] row = new String[4];
						row[0] = rs.getString("id"); 
						row[1] = rs.getString("name");
						row[2] = rs.getString("dept");
						row[3] = rs.getString("address");
						model.addRow(row); 
					}
					
				} catch (ClassNotFoundException e1) {
						e1.printStackTrace();
				} catch (SQLException e2) {
						e2.printStackTrace();
				} finally { 
					try {
						rs.close(); 
						st.close();
						conn.close();
					} catch (SQLException e3) {
						e3.printStackTrace();
					}
				}
			} 
		});
		
		this.btnDelete.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				int result = JOptionPane.showConfirmDialog(null, "삭제하시겠습니까?", "Confirm", JOptionPane.YES_NO_OPTION);
										     			
				System.out.println(result);  
				
				if(result == JOptionPane.YES_OPTION) { 
					Connection conn = null;
					ResultSet rs = null; 
					Statement st = null; 
					try {
						Class.forName("com.mysql.cj.jdbc.Driver");
						conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/sampledb?useSSL=false&useUnicode=true&characterEncoding=UTF-8", "root", "1234");
						st = conn.createStatement();
						
						st.executeUpdate("DELETE FROM student WHERE id = '" + tfID.getText() + "'");
					
						tfID.setText(""); 
						tfName.setText("");
						tfDepartment.setText("");
						tfAddress.setText("");
				
						rs = st.executeQuery("SELECT * FROM student");
						
					    model.setNumRows(0); 

						while(rs.next()) { 
							String[] row = new String[4];
							row[0] = rs.getString("id"); 
							row[1] = rs.getString("name");
							row[2] = rs.getString("dept");
							row[3] = rs.getString("address");
							model.addRow(row); 
						}
						
					} catch (ClassNotFoundException e1) {
							e1.printStackTrace();
					} catch (SQLException e2) {
							e2.printStackTrace();
					} finally { 
						try {
							rs.close(); 
							st.close();
							conn.close();
						} catch (SQLException e3) {
							e3.printStackTrace();
						}
					}
					JOptionPane.showMessageDialog(null, "삭제되었습니다.");
				} 
			}
		});
		
		this.btnSearch.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				Connection conn = null;
				ResultSet rs = null; 
				Statement st = null; 
				try {
					Class.forName("com.mysql.cj.jdbc.Driver");
					conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/sampledb?useSSL=false&useUnicode=true&characterEncoding=UTF-8", "root", "1234");
					st = conn.createStatement(); 

					// select문
					rs = st.executeQuery("SELECT * FROM student WHERE id = '" + tfID.getText() + "'");
					
				    model.setNumRows(0); 
					
					while(rs.next()) { 
						// 수정을 위해 텍스트에어리어에 검색한 사람의 정보 띄우기
						tfID.setText(rs.getString("id"));
						tfName.setText(rs.getString("name"));
						tfDepartment.setText(rs.getString("dept"));
						tfAddress.setText(rs.getString("address"));

						String[] row = new String[4];
						row[0] = rs.getString("id"); 
						row[1] = rs.getString("name");
						row[2] = rs.getString("dept");
						row[3] = rs.getString("address");
						model.addRow(row); 
					}
					
				} catch (ClassNotFoundException e1) {
						e1.printStackTrace();
				} catch (SQLException e2) {
						e2.printStackTrace();
				} finally { 
					try {
						rs.close(); 
						st.close();
						conn.close();
					} catch (SQLException e3) {
						e3.printStackTrace();
					}
				}
			}
		});
		
		this.btnUpdate.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				int result = JOptionPane.showConfirmDialog(null, "수정하시겠습니까?", "Confirm", JOptionPane.YES_NO_OPTION);
				System.out.println(result); 
				
				if(result == JOptionPane.YES_OPTION) { 
					Connection conn = null;
					ResultSet rs = null; 
					Statement st = null; 
					try {
						Class.forName("com.mysql.cj.jdbc.Driver");
						conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/sampledb?useSSL=false&useUnicode=true&characterEncoding=UTF-8", "root", "1234");
						st = conn.createStatement();
						
				
						st.executeUpdate("UPDATE student SET name = '"+ tfName.getText() 
										+"', dept = '" + tfDepartment.getText() 
										+ "', address = '"+ tfAddress.getText()
										+ "' WHERE id = '" + tfID.getText() + "'");

						rs = st.executeQuery("SELECT * FROM student");
						
					    model.setNumRows(0); 
	
						while(rs.next()) { 
							String[] row = new String[4];
							row[0] = rs.getString("id"); 
							row[1] = rs.getString("name");
							row[2] = rs.getString("dept");
							row[3] = rs.getString("address");
							model.addRow(row); 
						}
						
					} catch (ClassNotFoundException e1) {
							e1.printStackTrace();
					} catch (SQLException e2) {
							e2.printStackTrace();
					} finally { 
						try {
							rs.close(); 
							st.close();
							conn.close();
						} catch (SQLException e3) {
							e3.printStackTrace();
						}
					}
				}
			}
		});
		
		this.table.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseClicked(MouseEvent e) {
				table = (JTable)e.getComponent(); 
				model = (DefaultTableModel)table.getModel(); 
				String id = (String)model.getValueAt(table.getSelectedRow(), 0); 
					tfID.setText(id);
				String name = (String)model.getValueAt(table.getSelectedRow(), 1);
					tfName.setText(name);
				String dept = (String)model.getValueAt(table.getSelectedRow(), 2);
					tfDepartment.setText(dept);
				String address = (String)model.getValueAt(table.getSelectedRow(), 3);
					tfAddress.setText(address);
			}
		});
		
		this.setSize(470, 480);
		this.setVisible(true);
	}
}