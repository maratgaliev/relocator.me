<template>
  <div class="max-w-md m-auto py-10">
    <div class="text-red" v-if="error">{{ error }}</div>
    <h3 class="font-mono font-regular text-3xl mb-4 text-center">JOBS LIST</h3>

    <ul class="list-reset mt-4">
      <li class="py-4" v-for="job in jobs" :key="job.id" :job="job">
        <div class="flex items-center justify-between flex-wrap">
          <div class="flex-1 flex justify-between flex-wrap pr-4">
            <div class="shadow p-4 bg-white">
                <div class="text-left">
                    <h3 class="mb-2 text-grey-darker">{{job.title}}</h3>
                    <p class="text-grey-dark leading-tight">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor.
                        Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus
                        mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. </p>
                </div>
                <div class="mt-4">
                    <a href="#" class="no-underline mr-4 text-green hover:text-green-light">{{job.city}}</a>
                    <a href="#" class="no-underline mr-4 text-green hover:text-green-light">{{job.type}}</a>
                </div>
            </div>
          </div>
        </div>
      </li>
    </ul>
  </div>
</template>

<script>
export default {
  name: 'Jobs',
  data () {
    return {
      jobs: [],
      newRecord: [],
      error: ''
    }
  },
  created () {
    this.$http.plain
      .get('/api/v1/jobs')
      .then(response => {
        this.jobs = response.data
      })
      .catch(error => this.setError(error, 'Something went wrong'))
  },
  methods: {
    setError (error, text) {
      this.error =
        (error.response && error.response.data && error.response.data.error) ||
        text
    },
    addRecord () {
      const value = this.newRecord
      if (!value) {
        return
      }
      this.$http.plain
        .post('/api/v1/jobs/', {
          record: {
            title: this.newRecord.title
          }
        })

        .then(response => {
          this.records.push(response.data)
          this.newRecord = ''
        })
        .catch(error => this.setError(error, 'Cannot create record'))
    }
  }
}
</script>
