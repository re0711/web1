package abc.bbs.category.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import abc.bbs.category.pojo.Category;
import abc.bbs.category.mapper.CategoryMapper;

@Service
public class CategoryServiceImpl implements CategoryService {
	
	@Autowired
	CategoryMapper categoryMapper;
	
	public List<Category> selectAllCategory() {
		return categoryMapper.selectAllCategory();
	}

	public Category selectCategoryById(Integer id) {
		return categoryMapper.selectCategoryById(id);
	}
	
}
