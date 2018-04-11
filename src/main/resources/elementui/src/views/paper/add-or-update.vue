<template>
  <el-dialog
    :title="!dataForm.id ? '新增' : '修改'"
    :close-on-click-modal="false"
    :visible.sync="visible">
    <el-form :model="dataForm" :rules="dataRule" ref="dataForm" @keyup.enter.native="dataFormSubmit()" label-width="80px">
      <el-form-item label="试卷名称" prop="tacname">
        <el-input v-model="dataForm.tacname" placeholder="试卷名称"></el-input>
      </el-form-item>
      <el-form-item label="学院编号" prop="collegenum">
        <el-input v-model="dataForm.collegenum" placeholder="学院编号"></el-input>
      </el-form-item>
      <el-form-item label="学院" prop="collegename">
        <el-input v-model="dataForm.collegename" placeholder="学院"></el-input>
      </el-form-item>
      <el-form-item label="专业编号" prop="majornum">
        <el-input v-model="dataForm.majornum" placeholder="专业编号"></el-input>
      </el-form-item>
      <el-form-item label="专业名称" prop="majorname">
        <el-input v-model="dataForm.majorname" placeholder="专业名称"></el-input>
      </el-form-item>
      <el-form-item label="课程编号" prop="coursenum">
        <el-input v-model="dataForm.coursenum" placeholder="课程编号"></el-input>
      </el-form-item>
      <el-form-item label="课程名称" prop="coursename">
        <el-input v-model="dataForm.coursename" placeholder="课程名称"></el-input>
      </el-form-item>
      <el-form-item label="试卷内容" prop="content">
        <el-input v-model="dataForm.content" placeholder="试卷内容"></el-input>
      </el-form-item>
      <el-form-item label="创建人" prop="createid">
        <el-input v-model="dataForm.createid" placeholder="创建人"></el-input>
      </el-form-item>
      <el-form-item label="创建时间" prop="createtime">
        <el-input v-model="dataForm.createtime" placeholder="创建时间"></el-input>
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
          tacid: 0,
          tacname: '',
          collegenum: '',
          collegename: '',
          majornum: '',
          majorname: '',
          coursenum: '',
          coursename: '',
          content: '',
          createid: '',
          createtime: ''
        },
        dataRule: {
          tacname: [
            { required: true, message: '试卷名称不能为空', trigger: 'blur' }
          ],
          collegenum: [
            { required: true, message: '学院编号不能为空', trigger: 'blur' }
          ],
          collegename: [
            { required: true, message: '学院不能为空', trigger: 'blur' }
          ],
          majornum: [
            { required: true, message: '专业编号不能为空', trigger: 'blur' }
          ],
          majorname: [
            { required: true, message: '专业名称不能为空', trigger: 'blur' }
          ],
          coursenum: [
            { required: true, message: '课程编号不能为空', trigger: 'blur' }
          ],
          coursename: [
            { required: true, message: '课程名称不能为空', trigger: 'blur' }
          ],
          content: [
            { required: true, message: '试卷内容不能为空', trigger: 'blur' }
          ],
          createid: [
            { required: true, message: '创建人不能为空', trigger: 'blur' }
          ],
          createtime: [
            { required: true, message: '创建时间不能为空', trigger: 'blur' }
          ]
        }
      }
    },
    methods: {
      init (id) {
        this.dataForm.tacid = id || 0
        this.visible = true
        this.$nextTick(() => {
          this.$refs['dataForm'].resetFields()
          if (this.dataForm.tacid) {
            API.paper.info(this.dataForm.tacid).then(({data}) => {
              if (data && data.code === 0) {
                this.dataForm.tacname = data.paper.tacname
                this.dataForm.collegenum = data.paper.collegenum
                this.dataForm.collegename = data.paper.collegename
                this.dataForm.majornum = data.paper.majornum
                this.dataForm.majorname = data.paper.majorname
                this.dataForm.coursenum = data.paper.coursenum
                this.dataForm.coursename = data.paper.coursename
                this.dataForm.content = data.paper.content
                this.dataForm.createid = data.paper.createid
                this.dataForm.createtime = data.paper.createtime
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
              'tacid': this.dataForm.tacid || undefined,
              'tacname': this.dataForm.tacname,
              'collegenum': this.dataForm.collegenum,
              'collegename': this.dataForm.collegename,
              'majornum': this.dataForm.majornum,
              'majorname': this.dataForm.majorname,
              'coursenum': this.dataForm.coursenum,
              'coursename': this.dataForm.coursename,
              'content': this.dataForm.content,
              'createid': this.dataForm.createid,
              'createtime': this.dataForm.createtime
            }
            var tick = !this.dataForm.tacid ? API.paper.add(params) : API.paper.update(params)
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
