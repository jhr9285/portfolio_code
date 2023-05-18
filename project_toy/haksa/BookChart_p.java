// 도서대출현황 파이차트
package haksa;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;

public class BookChart_p extends JPanel {
	// 쿼리문 레퍼런스
	String bookCountQuery, rentQuery;
	// 수치 레퍼런스
	int allRentCount;
	// 각 학과별 대출도서 수 (Hashmap)
	HashMap<String, Integer> rentCount = new HashMap<>();
	// 각 학과별 대출도서 수 각도 (Hashmap)
	HashMap<String, Integer> bookRentAngle = new HashMap<>();
	// 학과 (배열)
	String[] major = {"컴퓨터시스템", "멀티미디어", "컴퓨터공학", "체육학", "국어국문학과", "철학", "역사학", "회계학"};
	
	// 학과별 도서대출 현황(%)을 파이차트로 그리기 (학과별 ==> GROUP BY 이용) ... (QUERY가 통계 내기가 어렵다.)
	// 특정학과 대출도서 각도 x = (특정 학과 대출도서 수 * 360) / 전체 대출도서 수
	
	public BookChart_p() {
		Connection conn = null;
		Statement stmt = null;
		PreparedStatement psmt = null; 
		ResultSet rs = null, rs2 = null; 

		Font ng = new Font("NanumGothic", Font.BOLD, 14);
		
		for(int i = 0; i < major.length; i++) {
			rentQuery = "SELECT student.dept, COUNT(student.dept) FROM student, bookRent "
							 + "WHERE student.id = bookRent.id AND student.dept = ? ";
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/sampledb?useSSL=false&useUnicode=true&characterEncoding=UTF-8", "root", "1234");
				psmt = conn.prepareStatement(rentQuery);
				psmt.setString(1, major[i]);
				rs = psmt.executeQuery();
				if(rs.next()) {
					if(rs.getInt(2) == 0) { break; }
					// 학과별 대출도서 수
					rentCount.put(major[i], rs.getInt(2));
				}
				bookCountQuery = "SELECT COUNT(*) FROM bookRent ";
				stmt = conn.createStatement();
				rs2 = stmt.executeQuery(bookCountQuery);
				if(rs2.next()) {
				// 전체 대출도서 수
					allRentCount = rs2.getInt(1);
				}
				// 학과별 대출도서 각도
				bookRentAngle.put(major[i], (int)(rentCount.get(major[i]) * 360 / allRentCount));
				
			} catch(Exception e) {
				JOptionPane.showMessageDialog(null, e.getMessage());
			} finally {
				try {
				rs2.close();
				rs.close();
				stmt.close();
				psmt.close();
				conn.close();
				} catch(Exception e2) {
					JOptionPane.showMessageDialog(null, e2.getMessage());
				}
			}
		}
		
		this.setSize(500, 500);
		this.setVisible(true);
	}
	
	@Override
	public void paintComponent(Graphics g) {
		super.paintComponent(g);
		Color[] color = {Color.RED, Color.BLUE, Color.GREEN, Color.YELLOW, Color.PINK, Color.WHITE, Color.GRAY};
		String[] colorName = {"RED", "BLUE", "GREEN", "YELLOW", "PINK", "WHITE", "GRAY"};
		
		g.setColor(color[0]);
		g.fillArc(100, 60, 250, 250, 0, bookRentAngle.get(major[0]));
		g.setColor(color[1]);
		g.fillArc(100, 60, 250, 250, 0 + bookRentAngle.get(major[0]), bookRentAngle.get(major[1]));
		g.setColor(color[2]);
		g.fillArc(100, 60, 250, 250, 0 + bookRentAngle.get(major[0]) + bookRentAngle.get(major[1]), bookRentAngle.get(major[2]));
		g.setColor(color[3]);
		g.fillArc(100, 60, 250, 250, 0 + bookRentAngle.get(major[0]) + bookRentAngle.get(major[1]) + bookRentAngle.get(major[2]), bookRentAngle.get(major[3]));
		g.setColor(color[4]);
		g.fillArc(100, 60, 250, 250, 0 + bookRentAngle.get(major[0]) + bookRentAngle.get(major[1]) + bookRentAngle.get(major[2]) + bookRentAngle.get(major[3]), bookRentAngle.get(major[4]));
		
		double[] x = new double[5];
		
		for(int i = 0; i < 5; i++) {
			x[i] = 100 * bookRentAngle.get(major[i]) / 360;
		}
		
		int gap = 20;
		int y = 350;
		g.setColor(Color.BLACK);
		
		for(int i = 0; i < 5; i++) {
			g.drawString(colorName[i] + "  :  " + major[i].toString(), gap, y+(gap*i));
			g.drawString(""+ x[i] +"%", gap*8, y+(gap*i)); 
		}
		
		g.setColor(Color.BLACK);
		g.setFont(new Font("NanumGothic", Font.BOLD, 15));
		g.drawString("도서 대출 현황 - 파이 차트", 140, 30);

	};
}
