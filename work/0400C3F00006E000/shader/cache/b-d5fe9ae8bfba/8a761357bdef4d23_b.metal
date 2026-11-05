#pragma clang diagnostic ignored "-Wmissing-prototypes"

#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

struct dm_border_t { uint mask; float4 k[32]; };
static inline __attribute__((always_inline)) float4 dm_bmix(float4 r, float4 w, float4 k) { return r + (w - r) * k; }
static inline __attribute__((always_inline)) float dm_bmix(float r, float w, float4 k) { return r + (w - r) * k.x; }
template<typename V, typename T, typename... A> static inline __attribute__((always_inline)) V dm_bs(V r, constant dm_border_t* b, uint i, T t, sampler w, A... a)
{
    if (b->mask >> i & 1u) r = dm_bmix(r, t.sample(w, a...), b->k[i]);
    return r;
}

template <typename T>
static inline depth2d<T> spvDepthCast(texture2d<T> t)
{
    return reinterpret_cast<thread const depth2d<T> &>(t);
}

template <typename T>
static inline depth2d_array<T> spvDepthCast(texture2d_array<T> t)
{
    return reinterpret_cast<thread const depth2d_array<T> &>(t);
}

template <typename T>
static inline depthcube<T> spvDepthCast(texturecube<T> t)
{
    return reinterpret_cast<thread const depthcube<T> &>(t);
}

template <typename T>
static inline depthcube_array<T> spvDepthCast(texturecube_array<T> t)
{
    return reinterpret_cast<thread const depthcube_array<T> &>(t);
}

struct _10
{
    uint _m0;
    uint _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float _m5[73];
    int4 _m6;
    int _m7;
};

struct _16
{
    float4 _m0[4096];
};

struct spvDescriptorSetBuffer0
{
    constant _16* fp_c3 [[id(0)]];
    constant _16* fp_c4 [[id(1)]];
    texture2d<float> fp_t_tcb_C [[id(2)]];
    sampler fp_t_tcb_CSmplr [[id(3)]];
    texture2d<float> fp_t_tcb_A [[id(4)]];
    sampler fp_t_tcb_ASmplr [[id(5)]];
    texture2d<float> fp_t_tcb_E [[id(6)]];
    sampler fp_t_tcb_ESmplr [[id(7)]];
    texturecube<float> fp_t_tcb_8 [[id(8)]];
    sampler fp_t_tcb_8Smplr [[id(9)]];
    sampler fp_t_tcb_CSmplr_w [[id(10)]];
    sampler fp_t_tcb_ASmplr_w [[id(11)]];
    sampler fp_t_tcb_ESmplr_w [[id(12)]];
    constant dm_border_t* dm_border [[id(13)]];
};

struct main0_out
{
    float4 m_43 [[color(0)]];
};

struct main0_in
{
    float4 m_40 [[user(locn0), center_no_perspective]];
    float4 m_38 [[user(locn1), center_no_perspective]];
};

static inline __attribute__((always_inline))
void _49(thread const int& _1101, thread const int& _1102, thread const int& _1103, thread const int& _1104, thread int& _1105, thread int& _1106, thread int& _1107, thread int& _1108, thread int& _1109, thread int& _1110)
{
    float _1113 = as_type<float>(_1101) + 0.0;
    bool _1115 = _1113 != 0.0;
    bool _1117 = isnan(_1113);
    bool _1119 = _1115 || _1117;
    bool _1121 = isnan(0.0);
    bool _1123 = _1119 || _1121;
    int _1125 = _1103;
    int _1127 = _1104;
    int _1129 = 0;
    int _1131 = _1123 ? (-1) : 0;
    if (!_1123)
    {
        float _1133 = as_type<float>(_1101) * 1.0;
        _1125 = as_type<int>(_1133);
    }
    int _1135 = _1125;
    bool _1137 = !_1123;
    int _1139 = _1135;
    int _1141 = _1135;
    if (!_1137)
    {
        float _1143 = as_type<float>(_1101) + 0.0;
        bool _1145 = _1143 >= 0.0;
        bool _1147 = isnan(_1143);
        bool _1149 = _1145 || _1147;
        bool _1151 = isnan(0.0);
        bool _1153 = _1149 || _1151;
        _1131 = _1153 ? (-1) : 0;
        if (!_1153)
        {
            _1139 = 2147483647;
        }
        int _1155 = _1139;
        bool _1157 = !_1153;
        int _1159 = _1155;
        _1141 = _1155;
        if (!_1157)
        {
            float _1161 = abs(as_type<float>(_1101));
            float _1163 = _1161 + 0.0;
            bool _1165 = _1163 > as_type<float>(0x7f800000u /* inf */);
            bool _1167 = isnan(_1163);
            bool _1169 = _1165 || _1167;
            bool _1171 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1173 = _1169 || _1171;
            _1129 = 2139095040;
            _1131 = _1173 ? (-1) : 0;
            if (_1173)
            {
                float _1175 = as_type<float>(_1101) + 1.0;
                _1159 = as_type<int>(_1175);
            }
            int _1177 = _1159;
            int _1179 = _1177;
            _1141 = _1177;
            if (!_1173)
            {
                float _1181 = abs(as_type<float>(_1101));
                float _1183 = _1181 + (-0.0);
                float _1185 = 0.0 + _1183;
                bool _1187 = _1185 != as_type<float>(0x7f800000u /* inf */);
                bool _1189 = isnan(_1185);
                bool _1191 = _1187 || _1189;
                bool _1193 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _1195 = _1191 || _1193;
                _1131 = _1195 ? (-1) : 0;
                if (!_1195)
                {
                    _1179 = _1101;
                }
                int _1197 = _1179;
                bool _1199 = !_1195;
                _1141 = _1197;
                if (!_1199)
                {
                    float _1201 = as_type<float>(_1101) * 18446744073709551616.0;
                    float _1203 = rsqrt(_1201);
                    float _1205 = _1201 * _1203;
                    float _1207 = _1203 * 0.5;
                    float _1209 = -_1205;
                    float _1211 = 0.0 + _1209;
                    float _1213 = fma(_1207, _1211, 0.5);
                    float _1215 = fma(_1205, _1213, _1205);
                    float _1217 = -_1215;
                    float _1219 = 0.0 + _1217;
                    float _1221 = fma(_1215, _1219, _1201);
                    float _1223 = fma(_1207, _1221, _1215);
                    float _1225 = _1223 * 2.3283064365386962890625e-10;
                    _1141 = as_type<int>(_1225);
                    _1127 = as_type<int>(_1215);
                    _1129 = as_type<int>(_1211);
                }
            }
        }
    }
    int _1227 = _1141;
    int _1229 = _1127;
    int _1231 = _1129;
    int _1233 = _1131;
    _1105 = _1102;
    _1106 = 0;
    _1107 = _1227;
    _1108 = _1229;
    _1109 = _1231;
    _1110 = _1233;
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    bool _248 = false;
    float _53 = in.m_38.x;
    float _55 = in.m_38.y;
    float2 _482 = float2(_53, _55);
    float4 _58 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_482, float2(0.0), isnan(_482))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_482, float2(0.0), isnan(_482))).xyzw;
    float _60 = _58.x;
    float _62 = _58.y;
    float _64 = _58.z;
    float _66 = _58.w;
    float2 _501 = float2(_53, _55);
    float _68 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_501, float2(0.0), isnan(_501))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_501, float2(0.0), isnan(_501))).x;
    float2 _508 = float2(_66, 0.0);
    float2 _72 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_508, float2(0.0), isnan(_508))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_508, float2(0.0), isnan(_508))).xy;
    float _74 = _72.x;
    float _76 = _72.y;
    float _78 = in.m_40.y;
    float _80 = in.m_40.x;
    float _82 = in.m_40.z;
    float _84 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[10].y, (*spvDescriptorSet0.fp_c3)._m0[10].x);
    float _86 = -_84;
    float _88 = _78 * _86;
    float _90 = -_84;
    float _92 = _80 * _90;
    float _94 = -_84;
    float _96 = -(*spvDescriptorSet0.fp_c4)._m0[3].z;
    float _98 = fma(_82, _94, _96);
    float _100 = -(*spvDescriptorSet0.fp_c4)._m0[3].y;
    float _102 = _88 + _100;
    float _104 = -(*spvDescriptorSet0.fp_c4)._m0[3].x;
    float _106 = _92 + _104;
    float _108 = _88 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _110 = _102 * _102;
    float _112 = fma(_92, (*spvDescriptorSet0.fp_c3)._m0[8].x, _108);
    float _114 = fma(_106, _106, _110);
    float _116 = _88 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _118 = _88 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
    float _120 = -_84;
    float _122 = fma(_120, (*spvDescriptorSet0.fp_c3)._m0[8].z, _112);
    float _124 = fma(_98, _98, _114);
    float _126 = fma(_92, (*spvDescriptorSet0.fp_c3)._m0[7].x, _116);
    float _128 = fma(_92, (*spvDescriptorSet0.fp_c3)._m0[9].x, _118);
    float _130 = fma(_62, 2.0, -1.0);
    float _132 = sqrt(_124);
    float _134 = -_84;
    float _136 = fma(_134, (*spvDescriptorSet0.fp_c3)._m0[7].z, _126);
    float _138 = -_84;
    float _140 = fma(_138, (*spvDescriptorSet0.fp_c3)._m0[9].z, _128);
    float _142 = fma(_60, 2.0, -1.0);
    float _144 = _130 * _102;
    float _146 = _122 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _148 = _140 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
    float _150 = rsqrt(_124);
    float _152 = fma(_142, _106, _144);
    float _154 = _136 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _156 = -(*spvDescriptorSet0.fp_c4)._m0[0].y;
    float _158 = _146 + _156;
    float _160 = -(*spvDescriptorSet0.fp_c4)._m0[0].z;
    float _162 = _148 + _160;
    float _164 = -(*spvDescriptorSet0.fp_c4)._m0[0].x;
    float _166 = _154 + _164;
    float _168 = -_132;
    float _170 = fma(_168, (*spvDescriptorSet0.fp_c4)._m0[1].w, 1.0);
    float _172 = precise::clamp(_170, 0.0, 1.0);
    float _174 = fma(_64, 2.0, -1.0);
    float _176 = _158 * _158;
    float _178 = abs(_172);
    float _180 = log2(_178);
    float _182 = fma(_174, _98, _152);
    float _184 = fma(_166, _166, _176);
    float _186 = _150 * _182;
    float _188 = fma(_162, _162, _184);
    float _190 = -_186;
    float _192 = 0.0 + _190;
    float _194 = precise::clamp(_192, 0.0, 1.0);
    float _196 = sqrt(_188);
    float _198 = _194 + 0.001000000047497451305389404296875;
    float _200 = _180 * (*spvDescriptorSet0.fp_c4)._m0[3].w;
    float _202 = abs(_198);
    float _204 = -_202;
    float _206 = _204 + 1.0;
    float _208 = fma(_198, -0.0187292993068695068359375, 0.074261002242565155029296875);
    int _210 = as_type<int>(_206) + (-218103808);
    float _212 = exp2(_200);
    float _214 = fma(_198, _208, -0.212114393711090087890625);
    bool _218 = uint(_210) >= 1920991232u;
    float _220 = fma(_198, _214, 1.570728778839111328125);
    float _222 = _196 * (*spvDescriptorSet0.fp_c4)._m0[1].w;
    bool _224 = !_218;
    float _246;
    if (!_224)
    {
        int _226 = as_type<int>(_206);
        int _228 = 1088;
        int _230 = 0;
        int _232 = 0;
        int _234;
        int _236;
        int _238;
        int _240;
        int _242;
        int _244;
        _49(_226, _228, _230, _232, _234, _236, _238, _240, _242, _244);
        _246 = as_type<float>(_238);
        _248 = true;
    }
    else
    {
        float _250 = rsqrt(_206);
        float _252 = _206 * _250;
        float _254 = _250 * 0.5;
        float _256 = -_252;
        float _258 = 0.0 + _256;
        float _260 = fma(_254, _258, 0.5);
        float _262 = fma(_252, _260, _252);
        float _264 = -_262;
        float _266 = 0.0 + _264;
        float _268 = fma(_262, _266, _206);
        float _270 = fma(_254, _268, _262);
        _246 = _270;
    }
    _248 = false;
    float _272 = _246;
    float _274 = _220 * _272;
    float _276 = abs(_166);
    float _278 = abs(_158);
    float _280 = precise::max(_276, _278);
    float _282 = _274 * 0.15915493667125701904296875;
    float _284 = abs(_162);
    float _286 = precise::max(_284, _280);
    float _288 = _282 * 6.283185482025146484375;
    float _290 = cos(_288);
    float _292 = _282 * 6.283185482025146484375;
    float _294 = sin(_292);
    float _296 = 1.0 / _290;
    float _298 = 1.0 / _286;
    float _300 = _294 * _296;
    float _302 = _300 * (*spvDescriptorSet0.fp_c4)._m0[5].z;
    float _304 = _158 * _298;
    float _306 = precise::max(_302, 0.001000000047497451305389404296875);
    float _308 = _166 * _298;
    float _310 = _162 * _298;
    float _312 = -_222;
    float _314 = fma(_312, _306, _222);
    float3 _862 = float3(_308, _304, _310);
    float _316 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_862, float3(0.0), isnan(_862)), _314);
    float _318 = in.m_40.y;
    float _320 = in.m_40.x;
    float _322 = _98 * _150;
    float _324 = -(*spvDescriptorSet0.fp_c4)._m0[4].y;
    float _326 = _78 + _324;
    float _328 = -(*spvDescriptorSet0.fp_c4)._m0[4].x;
    float _330 = _80 + _328;
    float _332 = _326 * _326;
    float _334 = fma(_330, _330, _332);
    float _336 = _318 * _318;
    float _338 = fma(_320, _320, _336);
    float _340 = _338 + 1.0;
    float _342 = rsqrt(_340);
    float _344 = _318 * _342;
    float _346 = _320 * _342;
    float _348 = _82 * _342;
    float _350 = -_344;
    float _352 = fma(_102, _150, _350);
    float _354 = -_346;
    float _356 = fma(_106, _150, _354);
    float _358 = -_348;
    float _360 = _322 + _358;
    float _362 = 0.0 + _322;
    float _364 = precise::clamp(_362, 0.0, 1.0);
    float _366 = _352 * _352;
    float _368 = _130 * _352;
    float _370 = -_344;
    float _372 = _130 * _370;
    float _374 = fma(_356, _356, _366);
    float _376 = -_142;
    float _378 = -_368;
    float _380 = fma(_376, _356, _378);
    float _382 = -_352;
    float _384 = _344 * _382;
    float _386 = -_372;
    float _388 = fma(_142, _346, _386);
    float _390 = fma(_360, _360, _374);
    float _392 = -_174;
    float _394 = fma(_392, _360, _380);
    float _396 = -_346;
    float _398 = fma(_396, _356, _384);
    float _400 = rsqrt(_390);
    float _402 = -_348;
    float _404 = fma(_402, _360, _398);
    float _406 = fma(_174, _348, _388);
    float _408 = -_172;
    float _410 = _408 + 1.0;
    float _412 = -_186;
    float _414 = precise::min(_412, _406);
    float _416 = 1.0 / _404;
    float _418 = fma(_410, _364, _172);
    float _420 = _400 * _394;
    float _422 = precise::clamp(_420, 0.0, 1.0);
    float _424 = abs(_422);
    float _426 = log2(_424);
    float _428 = _422 * _414;
    float _430 = _428 * 2.0;
    float _432 = -_334;
    float _434 = fma(_432, (*spvDescriptorSet0.fp_c4)._m0[4].z, 1.0);
    float _436 = precise::clamp(_434, 0.0, 1.0);
    float _438 = _430 * _416;
    float _440 = precise::clamp(_438, 0.0, 1.0);
    float _442 = _436 * _418;
    float _444 = _440 * _442;
    float _446 = _76 * _444;
    float _448 = _74 * _426;
    float _450 = exp2(_448);
    float _452 = _450 * _446;
    float _454 = _212 * _316;
    float _456 = _316 * _452;
    float _458 = _194 * _454;
    float _460 = _456 * (*spvDescriptorSet0.fp_c3)._m0[12].x;
    float _462 = _458 * (*spvDescriptorSet0.fp_c3)._m0[12].x;
    float _464 = _460 * (*spvDescriptorSet0.fp_c4)._m0[2].x;
    float _466 = _462 * (*spvDescriptorSet0.fp_c4)._m0[1].x;
    float _468 = _462 * (*spvDescriptorSet0.fp_c4)._m0[1].y;
    float _470 = _462 * (*spvDescriptorSet0.fp_c4)._m0[1].z;
    out.m_43.x = _466;
    out.m_43.y = _468;
    out.m_43.z = _470;
    out.m_43.w = _464;
    return out;
}

