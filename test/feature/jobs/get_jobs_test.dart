import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:jobsque/core/models/job_model/job_model.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_jobs_test.mocks.dart';

Future<List<Job>> fetchJobs(http.Client client) async {
  Job job = Job(name: '', location: '', salary: '');
  http.Response response = await client.post(
    Uri.parse('https://project2.amit-learning.com/api/jobs/filter'),
    headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer 7329|A9b82VmHhuW7Li7Uai8kq8yOchEVXGPMvrTVEa4K',
    },
    body: job.toJson(),
  );

  if (response.statusCode == 200) {
    Map<String, dynamic> result = jsonDecode(response.body);
    List<Job> jobs = (result['data'] as List<dynamic>)
        .map((job) => Job.fromJson(job))
        .toList();
    return jobs;
  } else {
    throw Exception('Failed to load album');
  }
}

@GenerateMocks([http.Client])
void main() {
  late MockClient mockClient;
  setUp(() {
    mockClient = MockClient();
  });
  group(
    'test jobs api .....',
    () {
      test(
        'test get jobs.....',
        () async {
          Job job = Job(name: '', location: '', salary: '');
          when(
            mockClient.post(
              Uri.parse('https://project2.amit-learning.com/api/jobs/filter'),
              headers: {
                'Accept': 'application/json',
                'Authorization':
                    'Bearer 7329|A9b82VmHhuW7Li7Uai8kq8yOchEVXGPMvrTVEa4K',
              },
              body: job.toJson(),
            ),
          ).thenAnswer(
            (_) async => http.Response(list, 200),
          );
          expect(await fetchJobs(mockClient), isA<List<Job>>());
        },
      );
      test(
        'test failure get jobs.....',
        () async {
          Job job = Job(name: '', location: '', salary: '');
          when(
            mockClient.post(
              Uri.parse('https://project2.amit-learning.com/api/jobs/filter'),
              headers: {
                'Accept': 'application/json',
                'Authorization':
                    'Bearer 7329|A9b82VmHhuW7Li7Uai8kq8yOchEVXGPMvrTVEa4K',
              },
              body: job.toJson(),
            ),
          ).thenAnswer(
            (_) async => http.Response('Not Found', 404),
          );
          expect(fetchJobs(mockClient), throwsException);
        },
      );
    },
  );
}

String list = """
{
    "status": true,
    "data":[
  {
    "id": 4,
    "name": "Test Engineers",
    "image": "https://project2.amit-learning.com/image/1694106084.test.jpg",
    "job_time_type": "Full Time",
    "job_type": "Instructor",
    "job_level": "3",
    "job_description":"",
    "job_skill":"",
    "comp_name": "AMIT",
    "comp_email": "info@amit-learning.com",
    "comp_website": "https://amit-learning.com/",
    "about_comp":"",
    "location":"",
    "salary": "18000",
    "favorites": 1576,
    "expired": 0,
    "created_at": "2023-09-07T17:01:24.000000Z",
    "updated_at": "2024-04-13T22:26:30.000000Z"
  },
  {
    "id": 3,
    "name": "Machine Learning Engineer",
    "image": "https://project2.amit-learning.com/image/1694105811.ml.jpg",
    "job_time_type": "Full Time",
    "job_type": "Developer",
    "job_level": "2",
    "job_description":
        "",
    "job_skill":"",
    "comp_name": "AMIT",
    "comp_email": "info@amit-learning.com",
    "comp_website": "https://amit-learning.com/",
    "about_comp":  "",
    "location":  "",
    "salary": "20000",
    "favorites": 452,
    "expired": 0,
    "created_at": "2023-09-07T16:56:51.000000Z",
    "updated_at": "2024-04-07T19:15:25.000000Z"
  },
  {
    "id": 2,
    "name": "Flutter Developer",
    "image": "https://project2.amit-learning.com/image/1694104575.flu.jpg",
    "job_time_type": "Full time",
    "job_type": "Developer",
    "job_level": "2",
    "job_description":"",
    "job_skill":"",
    "comp_name": "AMIT",
    "comp_email": "info@amit-learning.com",
    "comp_website": "https://amit-learning.com/",
    "about_comp":"",
    "location":"",
    "salary": "16000",
    "favorites": 366,
    "expired": 0,
    "created_at": "2023-09-07T16:36:15.000000Z",
    "updated_at": "2024-04-13T22:47:12.000000Z"
  }
]
}
""";
