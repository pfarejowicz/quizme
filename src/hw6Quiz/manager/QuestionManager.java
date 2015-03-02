package hw6Quiz.manager;

import java.io.*;
import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;

public class QuestionManager {

	private Connection con;

	public QuestionManager(Connection con) {
		this.con = con;
	}
	
	public void addQuestion(int quiz_id, String type, Object obj) {
		try {
			ByteArrayOutputStream bs = new ByteArrayOutputStream();
			ObjectOutputStream os = new ObjectOutputStream(bs);
			os.writeObject(obj);
			os.close();
			
			PreparedStatement prepStmt = con.prepareStatement("INSERT INTO questions (quiz_id, question_type, metadata) VALUES(?, ?, ?)");
			prepStmt.setInt(1, quiz_id);
			prepStmt.setString(2, type);
			prepStmt.setObject(3, bs.toByteArray());
			prepStmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public HashMap<Integer, String> getQuestionIDs(int quiz_id) {
		HashMap<Integer, String> questions = new HashMap<Integer, String>();
		try {
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT * FROM questions WHERE quiz_id = \"" + quiz_id + "\"");
			while (rs.next()){
				questions.put(rs.getInt("question_id"), rs.getString("question_type"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return questions;
	}
	
	public Object getQuestionByID(int question_id) {
		try {
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT * FROM questions WHERE question_id = \"" + question_id + "\"");
			if (rs.next()){
				Object obj = rs.getObject("metadata");
				ByteArrayInputStream bs = new ByteArrayInputStream((byte[]) obj);
				ObjectInputStream is = new ObjectInputStream(bs);
				return is.readObject();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return null;
	}

}
