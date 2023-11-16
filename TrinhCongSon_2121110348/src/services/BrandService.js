
import httpAxios from "../httpAxios";

function getAll()
{
    return httpAxios.get('brand/index');
}
function getById(id)
{
    return httpAxios.get('brand/show/'+id);
}
function create(data)
{
    return httpAxios.post('brand/store',data);
}
function update(data,id)
{
    return httpAxios.post('brand/update/'+id,data);
}
function remove(id)
{
    return httpAxios.delete('brand/destroy/'+id);
}
function getBySlug(slug)
{
    return httpAxios.get('brand/show/'+slug);
}
function getBrandByParentId(parent_id)
{
    return httpAxios.get(`brand_list/${parent_id}`);
}

const brandservice={
    getBySlug:getBySlug,
    getBrandByParentId:getBrandByParentId,
    getAll:getAll,
    getById:getById,
    create:create,
    update:update,
    remove:remove
}
export default brandservice;