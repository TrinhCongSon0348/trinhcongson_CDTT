
import httpAxios from "../httpAxios";

function getAll()
{
    return httpAxios.get('member/index');
}
function getById(id)
{
    return httpAxios.get('member/show/'+id);
}
function create(data)
{
    return httpAxios.post('member/store',data);
}
function update(data,id)
{
    return httpAxios.post('member/update/'+id,data);
}
function remove(id)
{
    return httpAxios.delete('member/destroy/'+id);
}
const memberservice={
    getAll:getAll,
    getById:getById,
    create:create,
    update:update,
    remove:remove
}
export default memberservice;