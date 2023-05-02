

fetch('https://visitor-count-frk6a7sweq-uc.a.run.app').then(reponse=>reponse.json()).then(data=>{
    document.getElementById('visitor-count').innerText=data.count
})