package abc.bbs.category.mapper;

import java.util.List;

import abc.bbs.category.pojo.Category;

public interface CategoryMapper {
	
	public List<Category> selectAllCategory();

	public Category selectCategoryById(Integer id);

	public void addCategory(Category category);

	public void updateCategory(Category category);
}
