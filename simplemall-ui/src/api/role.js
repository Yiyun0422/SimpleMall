import service from '../utils/axios';

// 查询职能
export async function searchRoles() {
    try {
        const response = await service.get(`/roles`);
        if (response.code !== 1) {
            throw new Error(response.msg || 'Failed to fetch roles');
        }
        return response;
    } catch (error) {
        throw new Error('Network Error');
    }
}


// 删除
export async function deleteRole(id) {
    try {
        const response = await service.delete(`/role/delete/${id}`);
        if (response.code !== 1) {
            throw new Error(response.msg || 'Failed to delete roles');
        }
        return response;
    } catch (error) {
        throw new Error('Network Error');
    }
}

// 新增
export async function insertRole(params) {
    try {
        const response = await service.post(`/role/insert`,params);
        if (response.code !== 1) {
            throw new Error(response.msg || 'Failed to insert roles');
        }
        return response;
    } catch (error) {
        throw new Error('Network Error');
    }
}

// 修改
export async function updateRole(params) {
    try {
        const response = await service.put(`/role/update`,params);
        if (response.code !== 1) {
            throw new Error(response.msg || 'Failed to update roles');
        }
        return response;
    } catch (error) {
        throw new Error('Network Error');
    }
}