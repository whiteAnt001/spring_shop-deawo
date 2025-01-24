package dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.PersistenceUnit;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.Imagebbs;
import model.StartEnd;
@Repository
public class ImageDaoImpl implements ImageDao {
	@Autowired
	private SqlSession sqlSession;
	
	private EntityManagerFactory emf;
	
	@PersistenceUnit
	public void setEmf(EntityManagerFactory emf) {
		this.emf = emf;
	}
	
	@Override
	public List<Imagebbs> getImageBytitle(StartEnd se) {
		return this.sqlSession.selectList("imageMapper.getImageBytitle", se);
	}


	@Override
	public Integer getImageCountByTitle(String title) {
		return this.sqlSession.selectOne("imageMapper.getImageCountByTitle", title);
	}


	@Override
	public List<Object[]> getImageList(String id) {
		EntityManager em = this.emf.createEntityManager();
		List<Object[]> imageList = em.createQuery("From ImagebbsORM AS imagebbs INNER JOIN imagebbs.user where imagebbs.user.user_id = :id", Object[].class).setParameter("id", id).getResultList();
		return imageList;
	}

	public void updateOrderNo(Imagebbs bbs) {
		this.sqlSession.update("imageMapper.updateOrderNo", bbs);
	}

	public void updateImageBBS(Imagebbs bbs) {
		this.sqlSession.update("imageMapper.updateImageBBS", bbs);
	}

	public void deleteImageBBS(Integer id) {
		this.sqlSession.delete("imageMapper.deleteImageBBS", id);
	}

	public Integer getReplyCount(Integer id) {
		return this.sqlSession.selectOne("imageMapper.getReplyCount",id);
	}

	public Imagebbs getImageDetail(Integer id) {
		return this.sqlSession.selectOne("imageMapper.getImageDetail",id);
	}

	public Integer getTotal() {
		Integer cnt = this.sqlSession.selectOne("imageMapper.getTotal");
		if(cnt == null) return 0;
		else return cnt; 
	}

	public List<Imagebbs> imageList(StartEnd st) {
		return this.sqlSession.selectList("imageMapper.imageList", st);
	}

	public Integer getMaxWid() {
		Integer max = this.sqlSession.selectOne("imageMapper.getMaxWid");
		if(max == null) return 0;
		else return max; 
	}

	public void putImagebbs(Imagebbs bbs) {
		this.sqlSession.insert("imageMapper.putImagebbs", bbs);
	}

}





