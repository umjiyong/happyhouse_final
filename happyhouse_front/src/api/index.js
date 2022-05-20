import axios from "axios";
import { HAPPYHOUSE_SPRING_SEVER_URL } from "@/config";

// axios 객체 생성
function happyHouseApi() {
  const instance = axios.create({
    baseURL: HAPPYHOUSE_SPRING_SEVER_URL,
    headers: {
      "Content-type": "application/json",
    },
  });
  return instance;
}

export { happyHouseApi };
