const cleanModalFields = () => {
  modalFields.modalID.value = ''
  modalFields.modalTitle.value = ''
  modalFields.modalAuthor.value = ''
  modalFields.modalDescr.value = ''
  modalFields.modalEDU.value = ''
}

const getModalData = async (id) => {
  const res = await fetch(`/get-modal-data.php?id=${id}`)

  if (!res.ok) {
    throw new Error(res.status)
  }

  return res.json()
}

const sendModalData = async (id, query = 'update') => {
  const data = {
    id,
    title: modalFields.modalTitle.value,
    author: modalFields.modalAuthor.value,
    descr: modalFields.modalDescr.textContent,
    edu: modalFields.modalEDU.value,
    category: modalFields.modalCategory.value,
    section: modalFields.modalSection.value,
    specialty: modalFields.modalSpecialty.value,
    work_type: modalFields.modalWork.value,
    file_type: modalFields.modalFile.value,
    theme: modalFields.modalTheme.value
  }

  const res = await fetch(`/update-by-id.php?do=${query}`, {
    method: 'POST',
    body: JSON.stringify(data),
    headers: {
      'Content-Type': 'application/json'
    }
  })

  if (!res.ok) {
    throw new Error(res.status)
  }

  return res
}

const getModal = async () => {
  const res = await fetch(`/get-modal.php`)

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
  getModal()
    .then((text) => {
      modalFields.modalBG = document.querySelector('.modal-bg')
      modalFields.modalBG.innerHTML = text
    })
    .then(() => {
      modalFields.btnClose = document.querySelector('div.modal-window button.close')
      modalFields.btnSubmit = document.querySelector('button.modal-update')
      modalFields.btnCreate = document.querySelector('button.modal-create')
      modalFields.modalID = document.querySelector('#modal-id')
      modalFields.modalTitle = document.querySelector('#modal-title')
      modalFields.modalAuthor = document.querySelector('#modal-author')
      modalFields.modalDescr = document.querySelector('#modal-descr')
      modalFields.modalEDU = document.querySelector('#modal-edu')
      modalFields.modalCategory = document.querySelector('#modal-category')
      modalFields.modalSection = document.querySelector('#modal-section')
      modalFields.modalWork = document.querySelector('#modal-work')
      modalFields.modalFile = document.querySelector('#modal-file')
      modalFields.modalSpecialty = document.querySelector('#modal-specialty')
      modalFields.modalTheme = document.querySelector('#modal-theme')
    })
    .then(() => {
      modalFields.btnSubmit.addEventListener('click', (e) => {
        e.preventDefault()
        sendModalData(modalFields.modalID.value)
          .then(() => {
            updateTable()
              .then(text => {
                table.innerHTML = tableInner + text
              })
              .then(() => updateTRListeners())
          })
          modalFields.modalBG.classList.add('disabled')
      })

      modalFields.btnCreate.addEventListener('click', (e) => {
        e.preventDefault()
        sendModalData(modalFields.modalID.value, 'create')
          .then(() => {
            updateTable()
              .then(text => {
                table.innerHTML = tableInner + text
              })
              .then(() => updateTRListeners())
          })
          modalFields.modalBG.classList.add('disabled')
      })
    })
    .then(() => {
      modalFields.btnClose.addEventListener('click', () => {
        modalFields.modalBG.classList.add('disabled')
        cleanModalFields()
      })
    })
    .then(() => {
      document.querySelector('.create').addEventListener('click', () => {
        modalFields.btnSubmit.hidden = true
        modalFields.btnCreate.hidden = false
        modalFields.modalBG.classList.remove('disabled')
      })
    })
})