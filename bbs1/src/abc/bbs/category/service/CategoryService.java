package abc.bbs.category.service;

import java.util.List;

import abc.bbs.category.pojo.Category;

public interface CategoryService {
	public List<Category> selectAllCategory();
	
	public Category selectCategoryById(Integer id);
}
