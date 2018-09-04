#include "opencv2/highgui/highgui.hpp"
#include "opencv2/imgproc/imgproc.hpp"

using namespace cv;
using namespace std;

void fineMinAreaRect(Mat &threshold_output)
{
    vector<vector<Point>> contours;
    vector<Vec4i> hierarchy;
    //Ѱ������
    findContours(threshold_output, contours, hierarchy, CV_RETR_TREE, CV_CHAIN_APPROX_SIMPLE, Point(0, 0));
    //��ÿ���ҵ���������������б�ı߽��
    vector<RotatedRect> minRect(contours.size());
    for (int i = 0; i < contours.size(); i++)
    {
        minRect[i] = minAreaRect(Mat(contours[i]));
    }
    //��������������б�ı߽��
    Mat drawing = Mat::zeros(threshold_output.size(), CV_8UC3);
    for (int i = 0; i< contours.size(); i++)
    {
        Scalar color = Scalar(255, 255, 255);
        //��������
        drawContours(drawing, contours, i, color, 1, 8, vector<Vec4i>(), 0, Point());
        Point2f rect_points[4]; minRect[i].points(rect_points);
        for (int j = 0; j < 4; j++)
            line(drawing, rect_points[j], rect_points[(j + 1) % 4], color, 1, 8);
    }
    //����ڴ�������ʾ
    imshow("Contours", drawing);
}

int main()
{
    Mat src;
    Mat src_gray;
    /// ����Դͼ��
    src = imread("..\\..\\ʾ��ͼƬ\\1.bmp");
    /// תΪ�Ҷ�ͼ����ֵ��
    cvtColor(src, src_gray, CV_BGR2GRAY);
    threshold(src_gray, src_gray, 170, 255, CV_THRESH_BINARY);
    /// ��С��Ӿ���
    fineMinAreaRect(src_gray);
    ///��ʾ���
    imshow("Source", src);
    waitKey(0);
    return(0);
}
