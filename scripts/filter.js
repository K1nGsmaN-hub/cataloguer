const getFilter = async () => {
  const res = await fetch('/get-filter.php')

  const {ok, status, statusText} = res

  if (!ok) {
    throw new Error(`${status}: ${statusText}`)
  }

  return res.text()
}

document.addEventListener('DOMContentLoaded', () => {
  const filtersInner = document.querySelector('form.filters .inner')
  const filtersBtnSubmit = document.querySelector('form.filters button')

  const filtersField = {
    section: null,
    work_type: null,
    file_type: null
  }


  getFilter()
    .then((text) => filtersInner.innerHTML += text)
    .then(() => {
      filtersField.section = document.querySelector('#filter-section')
      filtersField.work_type = document.querySelector('#filter-wt')
      filtersField.file_type = document.querySelector('#filter-ft')
    })
    .then(() => {
      filtersBtnSubmit.addEventListener('click', (e) => {
        e.preventDefault()

        let query = ''

        for (key in filtersField) {
          if (filtersField[key].value === 'empty') continue

          query += query ? ` AND ${key}=${filtersField[key].value}` : `${key}=${filtersField[key].value}`
        }

        query = query ? query : 1

        updateTable(`?filter=${query}`)
          .then(text => {
            table.innerHTML = tableInner + text
          })
          .then(() => updateTRListeners())
          .catch(err => console.log(err))
      })
    })
})