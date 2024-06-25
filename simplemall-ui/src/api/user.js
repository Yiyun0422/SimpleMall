import service from "../utils/axios"

// 查询所有用户
export async function fetchUsers(params) {
    try {
        const response = await service.get(`/users`, { params });
        if (response.code !== 1) {
            throw new Error(response.msg || 'Failed to fetch users');
        }
        return response;
    } catch (error) {
        throw new Error('Network Error');
    }
}

// 条件搜索用户
export async function searchUser() { }



// 删除用户
export async function deleteUser(id) {
    try {
        const response = await service.delete(`/user/delete/${id}`);
        if (response.code !== 1) {
            throw new Error(response.msg || 'Failed to delete users')
        }
        return response;
    } catch (error) {
        throw new Error('Network Error');
    }
}

// 新增用户
export async function insertUser(params) {
    try {
         const response = await service.post(`/user/insert`,params);
        if (response.code !== 1) {
            throw new Error(response.msg || 'Failed to add users')
        }
        return response;
    } catch (error) {
        throw new Error('Network Error');
    }
}

// 修改用户
export async function updateUser(params) {
    try {
        const response = await service.put(`/user/update`, params);
        if (response.code !== 1) {
            throw new Error(response.msg || 'Failed to update users')
        }
        return response;
    } catch (error) {
        throw new Error('Network Error');
    }
}

// 根据id获取用户信息
export async function searchUserById(id) {
    try {
        const response = await service.get(`/user/select/${id}`);
        if (response.code !== 1) {
            throw new Error(response.msg || 'Failed to update users')
        }
        return response;
    } catch (error) {
        throw new Error('Network Error');
    }
}