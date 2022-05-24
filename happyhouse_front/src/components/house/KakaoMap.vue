<template>
  <div class="map-container">
    <div id="map" style="width: 100%; height: 80vh"></div>
    <div class="map-controller flex-row gap-item"></div>
  </div>
  <!--카카오 맵 API-->
</template>

<script>
import { mapState } from "vuex";

export default {
  name: "KakaoMap",
  data() {
    return {
      markers: [],
      infowindow: null,
      customOverlay: null,
    };
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

          // 마커 클릭 시 동작
          kakao.maps.event.addListener(marker, "click", () => {
            // this.displayInfowindow(marker, "아파트 정보", placeList[index]);
            this.displayInfo(marker, placeList[index]);
          });

          return marker;
        });

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
      	<div class="boxtitle">${place.aptName}</div>
      	<div class="first"></div>
        <div>
      			<span class="count">${place.dongName} ${place.jibun}</span>
        </div>
        <div>
      			<span class="title">건축년도</span>
      			<span class="count">${place.buildYear}</span>
        </div>
        <div id="detail-btn" class="hover-pointer"">상세정보 ▶</div>
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
    ...mapState("houseStore", ["houseList"]),
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
  },
};
</script>

<style>
.map-container {
  flex-grow: 6;
}
.map-controller {
  position: fixed;
  top: 10%;
  left: 30%;
}
.overlaybox {
  width: 150px;
  height: 150px;
  padding: 15px;
  padding-bottom: 20px;
  margin-bottom: 10px;
}
</style>
