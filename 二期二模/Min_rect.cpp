#include "opencv2/highgui/highgui.hpp"
#include "opencv2/imgproc/imgproc.hpp"

using namespace cv;
using namespace std;

void fineMinAreaRect(Mat &threshold_output)
{
    vector<vector<Point>> contours;
    vector<Vec4i> hierarchy;
    //寻找轮廓
    findContours(threshold_output, contours, hierarchy, CV_RETR_TREE, CV_CHAIN_APPROX_SIMPLE, Point(0, 0));
    //对每个找到的轮廓创建可倾斜的边界框
    vector<RotatedRect> minRect(contours.size());
    for (int i = 0; i < contours.size(); i++)
    {
        minRect[i] = minAreaRect(Mat(contours[i]));
    }
    //绘出轮廓及其可倾斜的边界框
    Mat drawing = Mat::zeros(threshold_output.size(), CV_8UC3);
    for (int i = 0; i< contours.size(); i++)
    {
        Scalar color = Scalar(255, 255, 255);
        //绘制轮廓
        drawContours(drawing, contours, i, color, 1, 8, vector<Vec4i>(), 0, Point());
        Point2f rect_points[4]; minRect[i].points(rect_points);
        for (int j = 0; j < 4; j++)
            line(drawing, rect_points[j], rect_points[(j + 1) % 4], color, 1, 8);
    }
    //结果在窗体中显示
    imshow("Contours", drawing);
}

int main()
{
    Mat src;
    Mat src_gray;
    /// 加载源图像
    src = imread("..\\..\\示例图片\\1.bmp");
    /// 转为灰度图并二值化
    cvtColor(src, src_gray, CV_BGR2GRAY);
    threshold(src_gray, src_gray, 170, 255, CV_THRESH_BINARY);
    /// 最小外接矩形
    fineMinAreaRect(src_gray);
    ///显示结果
    imshow("Source", src);
    waitKey(0);
    return(0);
}
