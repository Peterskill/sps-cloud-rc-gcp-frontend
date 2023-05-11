

fetch('https://us-central1-sps-cloud-rc.cloudfunctions.net/visitor-count-v1').then(reponse=>reponse.json()).then(data=>{
    document.getElementById('visitor-count').innerText=data.count
})