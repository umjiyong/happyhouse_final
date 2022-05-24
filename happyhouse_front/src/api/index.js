import axios from "axios";
import { API_BASE_URL, HAPPYHOUSE_SPRING_SEVER_URL } from "@/config";

// axios 객체 생성

function apiInstance() {
  const instance = axios.create({
    baseURL: API_BASE_URL,
    headers: {
      "Content-type": "application/json",
    },
  });
  return instance;
}

function happyHouseApi() {
  const instance = axios.create({
    baseURL: HAPPYHOUSE_SPRING_SEVER_URL,
    headers: {
      "Content-type": "application/json"
    }
  });
  return instance;
}

export { apiInstance, happyHouseApi };
