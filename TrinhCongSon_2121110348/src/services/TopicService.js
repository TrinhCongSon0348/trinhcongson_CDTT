
import httpAxios from "../httpAxios";

function getAll()
{
    return httpAxios.get('topic/index');
}
function getById(id)
{
    return httpAxios.get('topic/show/'+id);
}
function create(data)
{
    return httpAxios.post('topic/store',data);
}
function update(id,data)
{
    return httpAxios.post('topic/update/'+id,data);
}
function remove(id)
{
    return httpAxios.delete('topic/destroy/'+id);
}
function getBySlug(slug)
{
    return httpAxios.get('topic/show/'+slug);
}
function getTopicByParentId(parent_id)
{
    return httpAxios.get(`topic_list/${parent_id}`);
}

const topicservice={
    getBySlug:getBySlug,
    getTopicByParentId:getTopicByParentId,
    getAll:getAll,
    getById:getById,
    create:create,
    update:update,
    remove:remove
}
export default topicservice;