<template>
  <div class="map-container">
    <div
      id="map"
      :class="[
        { 'search-size': mapSize === 'searchSize' },
        { 'compare-size': mapSize === 'compareSize' },
      ]"
    ></div>
    <div class="map-controller flex-row gap-item"></div>
  </div>
  <!--카카오 맵 API-->
</template>

<script>
import { mapState, mapMutations } from "vuex";

export default {
  name: "KakaoMap",
  data() {
    return {
      markers: [],
      infowindow: null,
      customOverlay: null,
    };
  },
  props: {
    detailOn: Boolean,
    mapSize: String,
  },
  mounted() {
    if (window.kakao && window.kakao.maps) {
      console.log("before init map");
      console.log(window.kakao);
      this.initMap();
    } else {
      const script = document.createElement("script");
      /* global kakao */
      console.log(" set map");
      script.onload = () => kakao.maps.load(this.initMap);
      script.src =
        "//dapi.kakao.com/v2/maps/sdk.js?autoload=false&appkey=c55152ebe143d53da08dae86d55b65f5&libraries=services";
      document.head.appendChild(script);
    }
  },
  methods: {
    ...mapMutations("houseStore", [
      "SET_SHOW_STATUS_POSITION",
      "SET_HOUSE_INFO1",
    ]),
    initMap() {
      const container = document.getElementById("map");
      const options = {
        center: new kakao.maps.LatLng(33.450701, 126.570667),
        level: 6, // 초기 확대 레벨(클수록 넓은 시야)
      };

      //지도 객체를 등록합니다.
      //지도 객체는 반응형 관리 대상이 아니므로 initMap에서 선언합니다.
      this.map = new kakao.maps.Map(container, options);
    },
    moveCenter(lat, lng) {
      this.map.setCenter(new kakao.maps.LatLng(lat, lng));
    },
    // 마커 표시
    displayMarker(placeList, kind) {
      if (this.markers.length > 0) {
        this.markers.forEach((marker) => marker.setMap(null));
      }
      const positions = placeList.map((place) => {
        // plcaeList에 lat, long이 있어야 한다.
        return new kakao.maps.LatLng(place.lat, place.lng);
      });

      // 지도 범위 재설정용
      var bounds = new kakao.maps.LatLngBounds();

      // 지도 범위 계산, 동시에 마커 적용
      if (positions.length > 0) {
        this.markers = positions.map((position, index) => {
          bounds.extend(position);

          // 어떤 대상의 위치 정보냐에 따라 다른 마커 이미지 적용***
          let imageSrc = "";
          if (kind === "house") {
            imageSrc =
              "https://cdn2.iconfinder.com/data/icons/vivid/48/home-256.png"; // 마커 이미지 url
          } else if (kind === "transportation") {
            imageSrc =
              "https://cdn3.iconfinder.com/data/icons/font-awesome-solid/512/train-subway-128.png";
          } else if (kind === "safety") {
            imageSrc =
              "https://cdn2.iconfinder.com/data/icons/boxicons-solid-vol-1/24/bxs-cctv-128.png";
          } else if (kind === "education") {
            imageSrc =
              "https://cdn3.iconfinder.com/data/icons/font-awesome-solid/640/school-128.png";
          } else if (kind === "environment") {
            imageSrc =
              "https://cdn4.iconfinder.com/data/icons/tree-22/81/13-128.png";
          } else if (kind === "culture") {
            imageSrc =
              "https://cdn2.iconfinder.com/data/icons/boxicons-solid-vol-2/24/bxs-movie-128.png";
          } else if (kind === "life") {
            imageSrc =
              "https://cdn3.iconfinder.com/data/icons/solid-amenities-icon-set/64/Parking_2-128.png";
          } else {
            imageSrc =
              "https://cdn3.iconfinder.com/data/icons/font-awesome-solid/512/circle-question-256.png";
          }
          const imageSize = new kakao.maps.Size(36, 37); // 마커 이미지의 크기

          const markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);
          const marker = new kakao.maps.Marker({
            map: this.map,
            position,
            image: markerImage,
          });
          // 아파트만 클릭 시 인포윈도우 출력
          if (kind === "house") {
            // 마커 클릭 시 동작
            kakao.maps.event.addListener(marker, "click", () => {
              // this.displayInfowindow(marker, "아파트 정보", placeList[index]);
              this.displayInfo(marker, placeList[index]);
              // open detail
              this.SET_HOUSE_INFO1(placeList[index]);
              this.$emit("openDetail");
            });
          }

          return marker;
        });

        if (kind !== "house") {
          // 현재 선택된 아파트는 계속 마커 유지
          const imageSrc =
            "https://cdn1.iconfinder.com/data/icons/jumpicon-basic-ui-filled-line-1/32/-_Home-House--128.png";
          const imageSize = new kakao.maps.Size(36, 37); // 마커 이미지의 크기

          const markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);
          const marker = new kakao.maps.Marker({
            map: this.map,
            position: new kakao.maps.LatLng(
              this.houseInfo1.lat,
              this.houseInfo1.lng
            ),
            image: markerImage,
          });
          this.markers.push(marker);

          // 아파트가 아닌 경우 선택한 집을 센터로
          this.moveCenter(this.houseInfo1.lat, this.houseInfo1.lng);
        }

        // 새 지도 범위 설정
        this.map.setBounds(bounds);
      }
    },
    displayInfo(marker, place) {
      if (this.infowindow && this.infowindow.getMap()) {
        //이미 생성한 인포윈도우가 있기 때문에 지도 중심좌표를 인포윈도우 좌표로 이동시킨다.
        this.map.setCenter(this.infowindow.getPosition());
        return;
      }

      const iwContent = `
        <div class="overlaybox">
      	<div class="boxtitle"><span class="title">${place.aptName}</span></div>
      	<div class="first"></div>
        <div>
      			<span class="count">${place.dongName} ${place.jibun}</span>
        </div>
        <div>
      			<span>건축년도</span>
      			<span class="count">${place.buildYear}</span>
        </div>
      </div>`; // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
      const mLan = marker.getPosition().getLat() + 0.00033;
      const mLng = marker.getPosition().getLng();
      const iwPosition = new kakao.maps.LatLng(mLan, mLng); //인포윈도우 표시 위치입니다
      // const iwPosition = new kakao.maps.LatLng(place.lat, place.lng); //인포윈도우 표시 위치입니다
      const iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다

      const iw = new kakao.maps.InfoWindow({
        map: this.map, // 인포윈도우가 표시될 지도
        position: iwPosition,
        content: iwContent,
        removable: iwRemoveable,
      });
      this.infowindow = iw;
      // this.infowindow.addListener();
      // iw.addListener("domready", () => {
      //   console.log("heloo");
      // });

      this.map.setCenter(iwPosition);
    },
    // 상세 페이지 열기
    openHouseDetail() {
      console.log("open detail!!");
      this.$emit("openDetail");
    },
  },
  computed: {
    cultureList: [],
    ...mapState("houseStore", [
      "houseList",
      "houseInfo1",
      "showStatusPosition",
      "transportationList",
      "educationList",
      "environmentList",
      "lifeList",
      "safetyList",
      "cultureList",
    ]),
  },
  watch: {
    // houseList 변화 시 마커 표시 동작
    houseList(houses) {
      console.log("watched!!");
      // const positions = val.map((house) => {
      //   return [house.lat, house.lng];
      // });
      // lat, lng가 포함된 객체 리스트를 전달하고, 표시할 마커 타입을 전달한다.
      this.displayMarker(houses, "house");
    },
    // 새로운 상세 페이지가 열리면 해당 아파트 위치로
    houseInfo1(houseInfo) {
      this.moveCenter(houseInfo.lat, houseInfo.lng);
      const bounds = new kakao.maps.LatLngBounds();
      const pos = new kakao.maps.LatLng(houseInfo.lat, houseInfo.lng);
      bounds.extend(pos);
      this.map.setBounds(bounds);
    },
    showStatusPosition(selectedStatus) {
      if (selectedStatus === "culture") {
        this.displayMarker(this.cultureList, selectedStatus);
      } else if (selectedStatus === "environment") {
        this.displayMarker(this.environmentList, selectedStatus);
      } else if (selectedStatus === "education") {
        this.displayMarker(this.educationList, selectedStatus);
      } else if (selectedStatus === "life") {
        this.displayMarker(this.lifeList, selectedStatus);
      } else if (selectedStatus === "transportation") {
        this.displayMarker(this.transportationList, selectedStatus);
      } else if (selectedStatus === "safety") {
        this.displayMarker(this.safetyList, selectedStatus);
      }
    },
    detailOn(currentDetailOn) {
      if (!currentDetailOn) {
        //상세 보기가 꺼지면 조회된 아파트 마커 재실행
        this.displayMarker(this.houseList, "house");
        // 지도 위치는 그대로 유지
        this.moveCenter(this.houseInfo1.lat, this.houseInfo1.lng);
        const bounds = new kakao.maps.LatLngBounds();
        const pos = new kakao.maps.LatLng(
          this.houseInfo1.lat,
          this.houseInfo1.lng
        );
        bounds.extend(pos);
        this.map.setBounds(bounds);

        // 선택한 status 변화감지를 위해 초기화
        console.log("디테일 보기 종료.....");
        this.SET_SHOW_STATUS_POSITION("empty");
      }
    },
  },
};
</script>

<style>
.search-size {
  width: 100%;
  height: 80vh;
}
.compare-size {
  width: 100%;
  height: 50vh;
}
.map-container {
  flex-grow: 6;
  flex-shrink: 0;
}
.map-controller {
  position: fixed;
  top: 10%;
  left: 30%;
}
.overlaybox {
  width: 250px;
  height: 120px;
  padding: 15px;
  padding-bottom: 20px;
  position: relative;
  top: 5px;
}
</style>
