
import httpAxios from "../httpAxios";

function getAll()
{
    return httpAxios.get('postdetail/index');
}
function getById(id)
{
    return httpAxios.get('postdetail/show/'+id);
}
function create(data)
{
    return httpAxios.post('postdetail/store',data);
}
function update(data,id)
{
    return httpAxios.post('postdetail/update/'+id,data);
}
function remove(id)
{
    return httpAxios.delete('postdetail/destroy/'+id);
}

const postdetailservice={
    getAll:getAll,
    getById:getById,
    create:create,
    update:update,
    remove:remove
}
export default postdetailservice;