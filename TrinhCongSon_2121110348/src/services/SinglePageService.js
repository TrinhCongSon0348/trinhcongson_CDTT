
import httpAxios from "../httpAxios";

function getAll()
{
    return httpAxios.get('singlepage/index');
}
function getById(id)
{
    return httpAxios.get('singlepage/show/'+id);
}
function create(data)
{
    return httpAxios.post('singlepage/store',data);
}
function update(data,id)
{
    return httpAxios.post('singlepage/update/'+id,data);
}
function remove(id)
{
    return httpAxios.delete('singlepage/destroy/'+id);
}

const singlepageservice={
    getAll:getAll,
    getById:getById,
    create:create,
    update:update,
    remove:remove
}
export default singlepageservice;