import 'package:jitsi_meet/feature_flag/feature_flag.dart';
import 'package:jitsi_meet/jitsi_meet.dart';
import 'package:zoom_clone/utils/auth.dart';

class Jitsi {
  final Auth _auth = Auth();

  Future createMeeting({
    required String roomName,
    required bool isAudioMuted,
    required bool isVideoMuted,
    String username = '',
  }) async {
    try {
      FeatureFlag featureFlag = FeatureFlag()
        ..welcomePageEnabled = false
        ..resolution = FeatureFlagVideoResolution.HD_RESOLUTION;

      if (username.isEmpty) username = _auth.user.displayName!;

      var options = JitsiMeetingOptions(room: roomName)
        ..userDisplayName = username
        ..userEmail = _auth.user.email
        ..userAvatarURL = _auth.user.photoURL
        ..audioMuted = isAudioMuted
        ..videoMuted = isVideoMuted;
      await JitsiMeet.joinMeeting(options);
    } catch (error) {
      print('error: $error');
    }
  }
}
