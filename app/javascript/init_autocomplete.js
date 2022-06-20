import mapboxgl from "mapbox-gl";
import MapboxGeocoder from "@mapbox/mapbox-gl-geocoder";
// if (document.getElementById("geocoder")) {};
const initAutocomplete = () => {
  mapboxgl.accessToken =
    "pk.eyJ1IjoiYW1vdXJhbGkiLCJhIjoiY2wxaTY3bHgyMXMwODNjcDNzZWNic2NzdiJ9.jFV0Aug4qQ1T296MLHolIQ";
  const geocoder = new MapboxGeocoder({
    accessToken: mapboxgl.accessToken,
    types: "country,region,place,postcode,locality,neighborhood",
  });

  if (document.getElementById("geocoder")) {
  geocoder.addTo("#geocoder");

  // Get the geocoder results container.
  const results = document.getElementById("result");
  const searchInput = document.getElementById("search_location");
  const mapBoxResults = document.getElementsByClassName("mapboxgl-ctrl-geocoder mapboxgl-ctrl")[0].children[1];
  const userEdit = document.getElementById("user_location");
  const programLocation = document.getElementById("program_location");

  // Add geocoder result to container.
  geocoder.on("result", (e) => {
    results.innerText = JSON.stringify(e.result, null, 2);
    if (searchInput) {
      searchInput.value = mapBoxResults.value;
    }
    if (userEdit) {
      userEdit.value = mapBoxResults.value;
    }
    if (programLocation) {
      programLocation.value = mapBoxResults.value;
    }
  });

  // Clear results container when search is cleared.
  geocoder.on("clear", () => {
    results.innerText = "";
    if (searchInput) {
      searchInput.value = "";
    }
    if (userEdit) {
      userEdit.value = "";
    }
    if (programLocation) {
      programLocation.value = "";
    }
  });
};
};

export { initAutocomplete };
