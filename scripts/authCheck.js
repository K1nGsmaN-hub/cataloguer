const authCheck = async () => {
  const res = await fetch('/auth-check.php')

  const {ok, status, statusText} = res

  if (!ok) {
    throw new Error(`${status}: ${statusText}`)
  }

  return res.text()
}

authCheck()
  .then(res => {
    if (+res === 0) throw res
  })
  .catch(err => {
    window.location.href = '/';
  })