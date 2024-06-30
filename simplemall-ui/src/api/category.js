import service from '../utils/axios';

// 查询商品类别
export async function searchCategories() {
    try {
        const response = await service.get(`/categories`);
        if (response.code !== 1) {
            throw new Error(response.msg || 'Failed to fetch categories');
        }
        return response;
    } catch (error) {
        throw new Error('Network Error');
    }
}


export async function deleteCategory(id) {
    try {
        const response = await service.delete(`/category/delete/${id}`);
        if (response.code !== 1) {
            throw new Error(response.msg || 'Failed to delete category');
        }
        return response;
    } catch (error) {
        throw new Error('Network Error');
    }
}

export async function updateCategory(params) {
    try {
        const response = await service.put(`/category/update`,params);
        if (response.code !== 1) {
            throw new Error(response.msg || 'Failed to update category');
        }
        return response;
    } catch (error) {
        throw new Error('Network error');
    }
}

export async function insertCategory(params) {
    try {
        const response = await service.post(`/category/insert`,params);
        if (response.code !== 1) {
            throw new Error(response.msg || 'Failed to insert category');
        }
        return response;
    } catch (error) {
        throw new Error('Network error');
    }
}