const userTypeCheck = async () => {
  const res = await fetch('/get-usertype.php')

  const {ok, status, statusText} = res

  if (!ok) {
    throw new Error(`${status}: ${statusText}`)
  }

  return res.text()
}

userTypeCheck()
  .then(res => {
    if (res === 'moder') {
      document.querySelector('button.create').style.display = 'block'
    }
  })