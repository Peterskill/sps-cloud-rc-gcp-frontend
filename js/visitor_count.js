

fetch('https://us-central1-cloud-resume-challenge-385006.cloudfunctions.net/visitor_count').then(reponse=>reponse.json()).then(data=>{
    document.getElementById('visitor-count').innerText=data.count
})