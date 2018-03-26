<template>
  <el-dialog
    :title="!dataForm.id ? '新增' : '修改'"
    :close-on-click-modal="false"
    :visible.sync="visible">
    <el-form :model="dataForm" :rules="dataRule" ref="dataForm" @keyup.enter.native="dataFormSubmit()" label-width="80px">
      <el-form-item label="学期" prop="term">
        <el-input v-model="dataForm.term" placeholder="学期"></el-input>
      </el-form-item>
      <el-form-item label="学院编号" prop="collegenum">
        <el-input v-model="dataForm.collegenum" placeholder="学院编号"></el-input>
      </el-form-item>
      <el-form-item label="专业编号" prop="majornum">
        <el-input v-model="dataForm.majornum" placeholder="专业编号"></el-input>
      </el-form-item>
      <el-form-item label="班级编号" prop="gradenum">
        <el-input v-model="dataForm.gradenum" placeholder="班级编号"></el-input>
      </el-form-item>
      <el-form-item label="课程编号" prop="coursenum">
        <el-input v-model="dataForm.coursenum" placeholder="课程编号"></el-input>
      </el-form-item>
      <el-form-item label="考试开始时间" prop="starttime">
        <el-input v-model="dataForm.starttime" placeholder="考试开始时间"></el-input>
      </el-form-item>
      <el-form-item label="考试结束时间" prop="endtime">
        <el-input v-model="dataForm.endtime" placeholder="考试结束时间"></el-input>
      </el-form-item>
      <el-form-item label="考试地点" prop="addr">
        <el-input v-model="dataForm.addr" placeholder="考试地点"></el-input>
      </el-form-item>
      <el-form-item label="计划创建时间" prop="createtime">
        <el-input v-model="dataForm.createtime" placeholder="计划创建时间"></el-input>
      </el-form-item>
      <el-form-item label="计划创建人" prop="createuser">
        <el-input v-model="dataForm.createuser" placeholder="计划创建人"></el-input>
      </el-form-item>
      <el-form-item label="计划备注" prop="remark">
        <el-input v-model="dataForm.remark" placeholder="计划备注"></el-input>
      </el-form-item>
    </el-form>
    <span slot="footer" class="dialog-footer">
      <el-button @click="visible = false">取消</el-button>
      <el-button type="primary" @click="dataFormSubmit()">确定</el-button>
    </span>
  </el-dialog>
</template>

<script>
  import API from '@/api'
  export default {
    data () {
      return {
        visible: false,
        dataForm: {
          id: 0,
          term: '',
          collegenum: '',
          majornum: '',
          gradenum: '',
          coursenum: '',
          starttime: '',
          endtime: '',
          addr: '',
          createtime: '',
          createuser: '',
          remark: ''
        },
        dataRule: {
          term: [
            { required: true, message: '学期不能为空', trigger: 'blur' }
          ],
          collegenum: [
            { required: true, message: '学院编号不能为空', trigger: 'blur' }
          ],
          majornum: [
            { required: true, message: '专业编号不能为空', trigger: 'blur' }
          ],
          gradenum: [
            { required: true, message: '班级编号不能为空', trigger: 'blur' }
          ],
          coursenum: [
            { required: true, message: '课程编号不能为空', trigger: 'blur' }
          ],
          starttime: [
            { required: true, message: '考试开始时间不能为空', trigger: 'blur' }
          ],
          endtime: [
            { required: true, message: '考试结束时间不能为空', trigger: 'blur' }
          ],
          addr: [
            { required: true, message: '考试地点不能为空', trigger: 'blur' }
          ],
          createtime: [
            { required: true, message: '计划创建时间不能为空', trigger: 'blur' }
          ],
          createuser: [
            { required: true, message: '计划创建人不能为空', trigger: 'blur' }
          ],
          remark: [
            { required: true, message: '计划备注不能为空', trigger: 'blur' }
          ]
        }
      }
    },
    methods: {
      init (id) {
        this.dataForm.id = id || 0
        this.visible = true
        this.$nextTick(() => {
          this.$refs['dataForm'].resetFields()
          if (this.dataForm.id) {
            API.testplan.info(this.dataForm.id).then(({data}) => {
              if (data && data.code === 0) {
                this.dataForm.term = data.testplan.term
                this.dataForm.collegenum = data.testplan.collegenum
                this.dataForm.majornum = data.testplan.majornum
                this.dataForm.gradenum = data.testplan.gradenum
                this.dataForm.coursenum = data.testplan.coursenum
                this.dataForm.starttime = data.testplan.starttime
                this.dataForm.endtime = data.testplan.endtime
                this.dataForm.addr = data.testplan.addr
                this.dataForm.createtime = data.testplan.createtime
                this.dataForm.createuser = data.testplan.createuser
                this.dataForm.remark = data.testplan.remark
              }
            })
          }
        })
      },
      // 表单提交
      dataFormSubmit () {
        this.$refs['dataForm'].validate((valid) => {
          if (valid) {
            var params = {
              'id': this.dataForm.id || undefined,
              'term': this.dataForm.term,
              'collegenum': this.dataForm.collegenum,
              'majornum': this.dataForm.majornum,
              'gradenum': this.dataForm.gradenum,
              'coursenum': this.dataForm.coursenum,
              'starttime': this.dataForm.starttime,
              'endtime': this.dataForm.endtime,
              'addr': this.dataForm.addr,
              'createtime': this.dataForm.createtime,
              'createuser': this.dataForm.createuser,
              'remark': this.dataForm.remark
            }
            var tick = !this.dataForm.id ? API.testplan.add(params) : API.testplan.update(params)
            tick.then(({data}) => {
              if (data && data.code === 0) {
                this.$message({
                  message: '操作成功',
                  type: 'success',
                  duration: 1500,
                  onClose: () => {
                    this.visible = false
                    this.$emit('refreshDataList')
                  }
                })
              } else {
                this.$message.error(data.msg)
              }
            })
          }
        })
      }
    }
  }
</script>
