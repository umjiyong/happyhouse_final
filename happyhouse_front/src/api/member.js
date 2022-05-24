import { apiInstance } from "./index.js";

const api = apiInstance();

async function login(user, success, fail) {
  await api
    .post(`/user/login`, JSON.stringify(user))
    .then(success)
    .catch(fail);
}

async function findById(user, success, fail) {
  api.defaults.headers["access-token"] = sessionStorage.getItem("access-token");
  await api
    .get(`/user/findpwd`)
    .then(success)
    .catch(fail);
}

async function collectMemberInfo(userid) {
  console.log("collectMemberInfo 호출됨" + userid);
  await api.get(`/user/list`);
}
async function modifyMemberInfo(user) {
  await api.put(`/user/modify`, JSON.stringify(user));
}
async function unregisterMember(userid, success, fail) {
  await api
    .delete(`/user/delete/${userid}`)
    .then(success)
    .catch(fail);
}

async function signUpMember(user, success, fail) {
  await api
    .post(`/user/regist`, JSON.stringify(user))
    .then(success)
    .catch(fail);
}
// function logout(success, fail)

export {
  login,
  findById,
  modifyMemberInfo,
  unregisterMember,
  signUpMember,
  collectMemberInfo
};
