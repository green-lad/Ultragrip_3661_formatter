stampFolder=prompt("Please enter folder name with stamps", "briefmarken");
numberOfStamps=prompt("Please enter the number of stamps", "12");

mainContainer = "tagContainer";
tagsPerPage = 12;
availableStampSpaces = 0;
currentPage = null;

tagContainer = document.getElementById(mainContainer);
for (let i = 0; i < numberOfStamps; i++) {
  if (availableStampSpaces == 0) {
    const div = document.createElement("div");
    div.className = "tagPage";
    currentPage = div;
    availableStampSpaces = tagsPerPage
    tagContainer.appendChild(div)
  }
  const div = document.createElement("div");
  const img = document.createElement("img");
  img.src = "./"+stampFolder+"/stamp."+i+".png";
  div.appendChild(img);
  currentPage.appendChild(div);
  availableStampSpaces -= 1
}
