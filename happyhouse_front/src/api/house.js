import { happyHouseApi } from "./index.js";

const api = happyHouseApi();

function areaList(params, success) {
  // api.get(`/house/area`, params).then(success).catch(fail);
  api.get(`/house/area`, { params }).then(success);
}
function houseList(params, success) {
  // api.get(`/house/area`, params).then(success).catch(fail);
  api.get(`/house/list`, { params }).then(success);
}
function searchHouseDealByAptCode(aptCode, success) {
  api.get(`/house/deal/${aptCode}`).then(success);
}
function searchStatus(aptCode, success) {
  api.get(`/house/status/${aptCode}`).then(success);
}
export { areaList, houseList, searchHouseDealByAptCode, searchStatus };
