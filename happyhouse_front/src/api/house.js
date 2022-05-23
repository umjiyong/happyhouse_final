import { happyHouseApi } from "./index.js";

const api = happyHouseApi();


function areaList(params, success, fail) {
  api
    .get(`/house/area`, { params })
    .then(success)
    .catch(fail);
}

export { areaList };

