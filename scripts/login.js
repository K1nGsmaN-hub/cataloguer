const auth = async (body) => {
    const res = await fetch('/auth.php', {
        method: 'POST',
        body,
        headers: {
            'Content-Type': 'application/json'
        }
    })

    const {ok, status, statusText} = res

    if (!ok) {
        throw new Error(`${status}: ${statusText}`)
    }

    return res.json()
}

document.addEventListener('DOMContentLoaded', () => {
    const 
    loginField = document.querySelector('#login'),
    passwordField = document.querySelector('#password'),
    btnSubmit = document.querySelector('.submit'),
    errMsg = document.querySelector('#error')

    btnSubmit.addEventListener('click', (e) => {
        e.preventDefault()

        auth(JSON.stringify({login: loginField.value, password: passwordField.value}))
            .then((res) => {
                if (res.status === 'failed') {
                    throw res.status
                }
            })
            .then((status) => {
                window.location.href = '/view.html';
            })
            .catch(() => {
                loginField.classList.add('error')
                passwordField.classList.add('error')
                errMsg.classList.add('visible')
            })
    })
})
