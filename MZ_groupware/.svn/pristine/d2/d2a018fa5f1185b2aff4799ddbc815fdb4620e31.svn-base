package com.spring.notification.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.spring.notification.dto.NotificationVO;

public class NotificationDAOImpl implements NotificationDAO {

	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session=session;
	}
	
	@Override
	public List<NotificationVO> selectNotificationList() throws SQLException {
		return session.selectList("Notification-Mapper.selectNotificationList");
	}

	@Override
	public List<NotificationVO> selectMyNotificationList(NotificationVO notification) throws SQLException {
		return session.selectList("Notification-Mapper.selectMyNotificationList", notification);
	}
	
	@Override
	public int selectMyNotificationCount(NotificationVO notification) throws SQLException {
		return session.selectOne("Notification-Mapper.selectMyNotificationCount", notification);
	}
	
	@Override
	public void insertNotification(NotificationVO notification) throws SQLException {
		session.update("Notification-Mapper.insertNotification", notification);
	}
	
	@Override
	public void deleteNotification(NotificationVO notification) throws SQLException {
		session.update("Notification-Mapper.deleteNotification", notification);
	}

	@Override
	public int selectLastNotificationNo() throws SQLException {
		return session.selectOne("Notification-Mapper.selectLastNotificationNo");
	}


	
}
