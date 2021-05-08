const updateTRListeners = () => {
  document.querySelectorAll('tr').forEach(item => {
    item.addEventListener('click', async () => {
      getModalData(item.dataset.id)
        .then(res => {
          modalFields.modalID.value = res.id
          modalFields.modalTitle.value = res.title
          modalFields.modalAuthor.value = res.author
          modalFields.modalDescr.textContent = res.descr
          modalFields.modalEDU.value = res.edu
          modalFields.modalCategory.querySelectorAll('option').forEach(option => {option.selected = option.value === res.category})
          modalFields.modalSection.querySelectorAll('option').forEach(option => {option.selected = option.value === res.section})
          modalFields.modalWork.querySelectorAll('option').forEach(option => {option.selected = option.value === res.work_type})
          modalFields.modalFile.querySelectorAll('option').forEach(option => {option.selected = option.value === res.file_type})
          modalFields.modalSpecialty.querySelectorAll('option').forEach(option => {option.selected = option.value === res.specialty})
          modalFields.modalTheme.querySelectorAll('option').forEach(option => {option.selected = option.value === res.theme})
        })
        .then(() => modalFields.modalBG.classList.remove('disabled'))
    })
  })
}

const updateTable = async (query = '?filter=1') => {
  const res = await fetch(`/update-table.php${query}`)

  const {ok, status, statusText } = res;

  if (!ok) {
    throw {
      status,
      statusText
    }
  }

  return res.text();
}

document.addEventListener("DOMContentLoaded", () => {
  updateTable()
    .then(text => {
      table.innerHTML = tableInner + text
    })
    .then(() => updateTRListeners())
    .catch(err => console.log(err))
})