import service from '../utils/axios';


export async function login(params) {
    try {
        const response = await service.post(`/login`,params);
        if (response.code !== 1) {
            throw new Error(response.msg || 'Failed to fetch user');
        }
        return response;
    } catch (error) {
        throw new Error('Network Error');
    }
}