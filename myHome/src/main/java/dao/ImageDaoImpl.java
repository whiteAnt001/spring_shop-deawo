package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.Imagebbs;
import model.StartEnd;

@Repository
public class ImageDaoImpl implements ImageDao {
	@Autowired
	private SqlSession session;
	
	
	@Override
	public void updateOrderNo(Imagebbs bbs) {
		this.session.update("imageMapper.updateOrderNo", bbs);
	}

	@Override
	public void updateImageBBS(Imagebbs bbs) {
		this.session.update("imageMapper.updateImageBBS", bbs);
	}

	@Override
	public void deleteImageBBS(Integer id) {
		this.session.delete("imageMapper.deleteImageBBS", id);
	}

	@Override
	public Integer getReplyCount(Integer id) {
		return this.session.selectOne("imageMapper.getReplyCount", id);
	}

	@Override
	public Imagebbs getImageDetail(Integer id) {
		return this.session.selectOne("imageMapper.getImageDetail", id);
	}

	@Override
	public Integer getTotal() {
		return this.session.selectOne("imageMapper.getTotal");
	}

	@Override
	public List<Imagebbs> imageList(StartEnd se) {
		return this.session.selectList("imageMapper.imageList", se);
	}

	@Override
	public Integer getMaxWid() {
		return this.session.selectOne("imageMapper.getMaxWid");
	}

	@Override
	public void putImagebbs(Imagebbs bbs) {
		this.session.insert("imageMapper.putImagebbs", bbs);
	}

}
