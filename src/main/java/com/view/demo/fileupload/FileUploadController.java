package com.view.demo.fileupload;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.serializer.SimplePropertyPreFilter;
import com.system.utils.MyFileUtils;
import com.system.utils.MyWebUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Iterator;
import java.util.LinkedList;

/**
 * 文件上传处理 controller
 * Created by admin on 2016/3/15.
 */
@Controller
public class FileUploadController {

    private static final Logger logger = Logger.getLogger(FileUploadController.class);

    LinkedList<FileMeta> files = new LinkedList<FileMeta>();
    FileMeta fileMeta = null;

    @RequestMapping("/test/jqueryfileupload")
    public ModelAndView page_jqueryFileUpload() {

        return new ModelAndView("demo/jqueryfileupload_demo");
    }

    /***************************************************
     * URL: /test/file/upload
     * upload(): receives files
     *
     * @param legalType : 需要匹配的文件类型(默认图片类型), 1: 图片类型; 2: 附件类型.
     * @param request   : MultipartHttpServletRequest auto passed
     * @param response  : HttpServletResponse auto passed
     * @return LinkedList<FileMeta> as json format
     ****************************************************/
    @ResponseBody
    @RequestMapping(value = "/test/file/upload", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    public String upload(@RequestParam("legalType") Integer legalType,
                         MultipartHttpServletRequest request, HttpServletResponse response) {

        SimplePropertyPreFilter filter = new SimplePropertyPreFilter(FileMeta.class, "src", "newFileName", "fileName", "fileSize", "fileType");

        //1. build an iterator
        Iterator<String> itr = request.getFileNames();
        MultipartFile mpf = null;

        //2. get each file
        while (itr.hasNext()) {

            //2.1 get next MultipartFile
            mpf = request.getFile(itr.next());

            // 过滤不合法的文件
            if (!MyFileUtils.isLegalFile(legalType, mpf.getContentType())) {
                logger.info("---> Filter illegal file: " + mpf.getOriginalFilename() + ", contentType: " + mpf.getContentType());
                continue;
            }

            // 过滤过大的文件
            if ((mpf.getSize() / 1024) > MyFileUtils.getMaximum(legalType)) {
                logger.info("---> Filter too big file: " + mpf.getOriginalFilename() + ", size: " + mpf.getSize() / 1024);
                continue;
            }

            //2.2 最多上传 10 个文件
            if (files.size() >= 10) {

                logger.info("---> Reached the maximum number of file uploads");

                logger.info("---> File upload json result: " + JSON.toJSONString(files, filter));

                return JSON.toJSONString(files, filter);
            }

            //2.3 create new fileMeta
            fileMeta = new FileMeta();
            fileMeta.setFileName(mpf.getOriginalFilename());
            fileMeta.setNewFileName(MyFileUtils.renameFile(mpf.getOriginalFilename()));
            fileMeta.setFileSize(mpf.getSize() / 1024 + " KB");
            fileMeta.setFileType(mpf.getContentType());

            try {
                fileMeta.setBytes(mpf.getBytes());

                // Creating the directory to store file
                String diskPath = MyFileUtils.webappPath + "/upload/tmpFiles";
                String rootPath = "/upload/tmpFiles";
                File dir = new File(diskPath);
                if (!dir.exists()) {
                    dir.mkdirs();
                }

                String filePath = diskPath + "/" + fileMeta.getNewFileName();
                String src = rootPath + "/" + fileMeta.getNewFileName();

                fileMeta.setFilePath(filePath);
                fileMeta.setSrc(src);

                // copy file to local disk
                FileCopyUtils.copy(mpf.getBytes(), new FileOutputStream(filePath));

            } catch (IOException e) {
                e.printStackTrace();
                logger.error("---> Failed to upload file: " + e.getMessage());
            }
            //2.4 add to files
            files.add(fileMeta);
        }
        // result will be like this
        // [{"fileName":"app_engine-85x77.png","fileSize":"8 KB","fileType":"image/png"},...]

        logger.info("---> File upload json result: " + JSON.toJSONString(files, filter));

        return JSON.toJSONString(files, filter);
    }

    /***************************************************
     * URL: /test/file/get/{value}
     * get(): get file as an attachment
     *
     * @param response : passed by the server
     * @param value    : value from the URL, newFileName
     * @return void
     ****************************************************/
    @RequestMapping(value = "/test/file/get/{value}", method = RequestMethod.GET)
    public void get(HttpServletResponse response, @PathVariable String value) {

        for (FileMeta file : files) {

            String newFileName = file.getNewFileName().substring(0, file.getNewFileName().lastIndexOf("."));

            if (newFileName.equals(value)) {

                try {

                    response.setContentType(file.getFileType());
                    response.setHeader("Content-disposition", "attachment; filename=\"" + file.getNewFileName() + "\"");
                    FileCopyUtils.copy(file.getBytes(), response.getOutputStream());

                } catch (IOException e) {
                    e.printStackTrace();
                    logger.error("---> Failed get file as an attachment: " + e.getMessage());
                }
            }
        }
    }

    /***************************************************
     * URL: /test/file/delete/{value}
     * delete(): delete file
     *
     * @param value : value from the URL, newFileName
     * @return {status, data}
     ****************************************************/
    @ResponseBody
    @RequestMapping(value = "/test/file/delete/{value}", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    public String delete(@PathVariable String value) {

        for (FileMeta file : files) {

            String newFileName = file.getNewFileName().substring(0, file.getNewFileName().lastIndexOf("."));

            if (newFileName.equals(value)) {

                String filePath = file.getFilePath();

                if (filePath != null) {

                    MyFileUtils.deleteFile(filePath);

                    files.remove(file);

                    logger.info("---> Delete file: " + file.getFileName());

                    return MyWebUtils.convert2JsonResult(1, "删除成功!");
                } else {
                    return MyWebUtils.convert2JsonResult(0, "删除失败!");
                }
            }
        }

        return MyWebUtils.convert2JsonResult(1, "删除成功!");
    }

    /**
     * Uploading images asyncronic method for summernote
     *
     * @param file 图片文件
     * @return 图片地址等相关信息
     */
    @RequestMapping(value = "/upload/image", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String handleFileUpload(@RequestParam("photo") MultipartFile file, HttpServletRequest request) {

        SimplePropertyPreFilter filter = new SimplePropertyPreFilter(FileMeta.class, "src", "newFileName", "fileName", "fileSize", "fileType");

        if (!file.isEmpty()) {

            // 过滤不合法的文件
            if (!MyFileUtils.isLegalFile(1, file.getContentType())) {
                logger.info("---> Filter illegal file: " + file.getOriginalFilename() + ", contentType: " + file.getContentType());
                return MyWebUtils.convert2JsonResult(0, "上传文件类型不合法!");
            }

            // 过滤过大的文件
            if ((file.getSize() / 1024) > MyFileUtils.getMaximum(1)) {
                logger.info("---> Filter too big file: " + file.getOriginalFilename() + ", size: " + file.getSize() / 1024);
                return MyWebUtils.convert2JsonResult(0, "上传文件应不大于 " + MyFileUtils.getMaximum(1) + " KB");
            }

            FileMeta fileMeta = new FileMeta();

            // 从剪切板复制的图片，名称不对
            if (file.getOriginalFilename().lastIndexOf(".") == -1) {
                fileMeta.setFileName(file.getOriginalFilename() + ".jpg");
            } else {
                fileMeta.setFileName(file.getOriginalFilename());
            }

            fileMeta.setNewFileName(MyFileUtils.renameFile(fileMeta.getFileName()));
            fileMeta.setFileSize(file.getSize() / 1024 + " KB");
            fileMeta.setFileType(file.getContentType());

            try {
                fileMeta.setBytes(file.getBytes());

                // Creating the directory to store file
                String diskPath = MyFileUtils.webappPath + "/upload/tmpFiles";
                String rootPath = "/upload/tmpFiles";
                File dir = new File(diskPath);
                if (!dir.exists()) {
                    dir.mkdirs();
                }

                String filePath = diskPath + "/" + fileMeta.getNewFileName();
                String src = rootPath + "/" + fileMeta.getNewFileName();

                fileMeta.setFilePath(filePath);
                // 为使富文本能够插入正确图片路径, 直接拼接全路径信息
                fileMeta.setSrc(MyWebUtils.getServerInfo(request).get("serverRootUri") + src);

                // copy file to local disk
                FileCopyUtils.copy(file.getBytes(), new FileOutputStream(filePath));

                logger.info("---> File upload json result: " + JSON.toJSONString(fileMeta, filter));

                return JSON.toJSONString(fileMeta, filter);

            } catch (Exception e) {
                e.printStackTrace();
                logger.error("---> Failed upload image: " + e.getMessage());
                return MyWebUtils.convert2JsonResult(0, "上传失败!");
            }
        } else {
            return MyWebUtils.convert2JsonResult(0, "文件为空!");
        }
    }

}
