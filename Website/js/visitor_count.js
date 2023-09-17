

fetch('https://us-central1-sps-cloud-rc.cloudfunctions.net/viscountgcp').then(reponse=>reponse.json()).then(data=>{
    document.getElementById('visitor-count').innerText=data.count
})
