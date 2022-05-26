import { happyHouseApi } from "./index.js";

const api = happyHouseApi();

function getQuestionList(params, success) {
  api.get("/qna/list", { params }).then(success);
}

function getQnA(qId, success) {
  api.get(`/qna/${qId}`).then(success);
}

function getCategoryList(success) {
  api.get("/qna/category").then(success);
}

function registQuestion(newQuestion, success) {
  api.post("/qna/question", null, { params: { ...newQuestion } }).then(success);
}

function updateQuestion(newQuestion, success) {
  api.put("/qna/question", null, { params: { ...newQuestion } }).then(success);
}

function searchQuestion(qId, success) {
  api.get(`/qna/question/${qId}`).then(success);
}

function removeQuestion(qId, success) {
  api.delete(`/qna/question/${qId}`).then(success);
}

function registReply(newReply, success) {
  api.post("/qna/reply", null, { params: { ...newReply } }).then(success);
}

function updateReply(newReply, success) {
  api.put("/qna/reply", null, { params: { ...newReply } }).then(success);
}

function removeReply(rId, success) {
  api.delete(`/qna/reply/${rId}`).then(success);
}

export {
  getQuestionList,
  getQnA,
  getCategoryList,
  registQuestion,
  updateQuestion,
  searchQuestion,
  removeQuestion,
  registReply,
  updateReply,
  removeReply
};
