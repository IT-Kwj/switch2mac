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
    float4 m_45 [[color(1)]];
};

struct main0_in
{
    float4 m_40 [[user(locn0), center_no_perspective]];
    float4 m_38 [[user(locn1), center_no_perspective]];
};

static inline __attribute__((always_inline))
void _51(thread const int& _1106, thread const int& _1107, thread const int& _1108, thread const int& _1109, thread int& _1110, thread int& _1111, thread int& _1112, thread int& _1113, thread int& _1114, thread int& _1115)
{
    float _1118 = as_type<float>(_1106) + 0.0;
    bool _1120 = _1118 != 0.0;
    bool _1122 = isnan(_1118);
    bool _1124 = _1120 || _1122;
    bool _1126 = isnan(0.0);
    bool _1128 = _1124 || _1126;
    int _1130 = _1108;
    int _1132 = _1109;
    int _1134 = 0;
    int _1136 = _1128 ? (-1) : 0;
    if (!_1128)
    {
        float _1138 = as_type<float>(_1106) * 1.0;
        _1130 = as_type<int>(_1138);
    }
    int _1140 = _1130;
    bool _1142 = !_1128;
    int _1144 = _1140;
    int _1146 = _1140;
    if (!_1142)
    {
        float _1148 = as_type<float>(_1106) + 0.0;
        bool _1150 = _1148 >= 0.0;
        bool _1152 = isnan(_1148);
        bool _1154 = _1150 || _1152;
        bool _1156 = isnan(0.0);
        bool _1158 = _1154 || _1156;
        _1136 = _1158 ? (-1) : 0;
        if (!_1158)
        {
            _1144 = 2147483647;
        }
        int _1160 = _1144;
        bool _1162 = !_1158;
        int _1164 = _1160;
        _1146 = _1160;
        if (!_1162)
        {
            float _1166 = abs(as_type<float>(_1106));
            float _1168 = _1166 + 0.0;
            bool _1170 = _1168 > as_type<float>(0x7f800000u /* inf */);
            bool _1172 = isnan(_1168);
            bool _1174 = _1170 || _1172;
            bool _1176 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1178 = _1174 || _1176;
            _1134 = 2139095040;
            _1136 = _1178 ? (-1) : 0;
            if (_1178)
            {
                float _1180 = as_type<float>(_1106) + 1.0;
                _1164 = as_type<int>(_1180);
            }
            int _1182 = _1164;
            int _1184 = _1182;
            _1146 = _1182;
            if (!_1178)
            {
                float _1186 = abs(as_type<float>(_1106));
                float _1188 = _1186 + (-0.0);
                float _1190 = 0.0 + _1188;
                bool _1192 = _1190 != as_type<float>(0x7f800000u /* inf */);
                bool _1194 = isnan(_1190);
                bool _1196 = _1192 || _1194;
                bool _1198 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _1200 = _1196 || _1198;
                _1136 = _1200 ? (-1) : 0;
                if (!_1200)
                {
                    _1184 = _1106;
                }
                int _1202 = _1184;
                bool _1204 = !_1200;
                _1146 = _1202;
                if (!_1204)
                {
                    float _1206 = as_type<float>(_1106) * 18446744073709551616.0;
                    float _1208 = rsqrt(_1206);
                    float _1210 = _1206 * _1208;
                    float _1212 = _1208 * 0.5;
                    float _1214 = -_1210;
                    float _1216 = 0.0 + _1214;
                    float _1218 = fma(_1212, _1216, 0.5);
                    float _1220 = fma(_1210, _1218, _1210);
                    float _1222 = -_1220;
                    float _1224 = 0.0 + _1222;
                    float _1226 = fma(_1220, _1224, _1206);
                    float _1228 = fma(_1212, _1226, _1220);
                    float _1230 = _1228 * 2.3283064365386962890625e-10;
                    _1146 = as_type<int>(_1230);
                    _1132 = as_type<int>(_1220);
                    _1134 = as_type<int>(_1216);
                }
            }
        }
    }
    int _1232 = _1146;
    int _1234 = _1132;
    int _1236 = _1134;
    int _1238 = _1136;
    _1110 = _1107;
    _1111 = 0;
    _1112 = _1232;
    _1113 = _1234;
    _1114 = _1236;
    _1115 = _1238;
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    bool _250 = false;
    float _55 = in.m_38.x;
    float _57 = in.m_38.y;
    float2 _484 = float2(_55, _57);
    float4 _60 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_484, float2(0.0), isnan(_484))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_484, float2(0.0), isnan(_484))).xyzw;
    float _62 = _60.x;
    float _64 = _60.y;
    float _66 = _60.z;
    float _68 = _60.w;
    float2 _503 = float2(_55, _57);
    float _70 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_503, float2(0.0), isnan(_503))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_503, float2(0.0), isnan(_503))).x;
    float2 _510 = float2(_68, 0.0);
    float2 _74 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_510, float2(0.0), isnan(_510))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_510, float2(0.0), isnan(_510))).xy;
    float _76 = _74.x;
    float _78 = _74.y;
    float _80 = in.m_40.y;
    float _82 = in.m_40.x;
    float _84 = in.m_40.z;
    float _86 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[10].y, (*spvDescriptorSet0.fp_c3)._m0[10].x);
    float _88 = -_86;
    float _90 = _80 * _88;
    float _92 = -_86;
    float _94 = _82 * _92;
    float _96 = -_86;
    float _98 = -(*spvDescriptorSet0.fp_c4)._m0[3].z;
    float _100 = fma(_84, _96, _98);
    float _102 = -(*spvDescriptorSet0.fp_c4)._m0[3].y;
    float _104 = _90 + _102;
    float _106 = -(*spvDescriptorSet0.fp_c4)._m0[3].x;
    float _108 = _94 + _106;
    float _110 = _90 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _112 = _104 * _104;
    float _114 = fma(_94, (*spvDescriptorSet0.fp_c3)._m0[8].x, _110);
    float _116 = fma(_108, _108, _112);
    float _118 = _90 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _120 = _90 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
    float _122 = -_86;
    float _124 = fma(_122, (*spvDescriptorSet0.fp_c3)._m0[8].z, _114);
    float _126 = fma(_100, _100, _116);
    float _128 = fma(_94, (*spvDescriptorSet0.fp_c3)._m0[7].x, _118);
    float _130 = fma(_94, (*spvDescriptorSet0.fp_c3)._m0[9].x, _120);
    float _132 = fma(_64, 2.0, -1.0);
    float _134 = sqrt(_126);
    float _136 = -_86;
    float _138 = fma(_136, (*spvDescriptorSet0.fp_c3)._m0[7].z, _128);
    float _140 = -_86;
    float _142 = fma(_140, (*spvDescriptorSet0.fp_c3)._m0[9].z, _130);
    float _144 = fma(_62, 2.0, -1.0);
    float _146 = _132 * _104;
    float _148 = _138 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _150 = _142 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
    float _152 = rsqrt(_126);
    float _154 = fma(_144, _108, _146);
    float _156 = -(*spvDescriptorSet0.fp_c4)._m0[0].x;
    float _158 = _148 + _156;
    float _160 = -(*spvDescriptorSet0.fp_c4)._m0[0].z;
    float _162 = _150 + _160;
    float _164 = -_134;
    float _166 = fma(_164, (*spvDescriptorSet0.fp_c4)._m0[1].w, 1.0);
    float _168 = precise::clamp(_166, 0.0, 1.0);
    float _170 = fma(_66, 2.0, -1.0);
    float _172 = _124 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _174 = abs(_168);
    float _176 = log2(_174);
    float _178 = fma(_170, _100, _154);
    float _180 = -(*spvDescriptorSet0.fp_c4)._m0[0].y;
    float _182 = _172 + _180;
    float _184 = _152 * _178;
    float _186 = _182 * _182;
    float _188 = -_184;
    float _190 = 0.0 + _188;
    float _192 = precise::clamp(_190, 0.0, 1.0);
    float _194 = fma(_158, _158, _186);
    float _196 = _192 + 0.001000000047497451305389404296875;
    float _198 = fma(_162, _162, _194);
    float _200 = _176 * (*spvDescriptorSet0.fp_c4)._m0[3].w;
    float _202 = abs(_196);
    float _204 = -_202;
    float _206 = _204 + 1.0;
    float _208 = fma(_196, -0.0187292993068695068359375, 0.074261002242565155029296875);
    float _210 = sqrt(_198);
    int _212 = as_type<int>(_206) + (-218103808);
    float _214 = fma(_196, _208, -0.212114393711090087890625);
    bool _218 = uint(_212) >= 1920991232u;
    float _220 = fma(_196, _214, 1.570728778839111328125);
    float _222 = exp2(_200);
    float _224 = _210 * (*spvDescriptorSet0.fp_c4)._m0[1].w;
    bool _226 = !_218;
    float _248;
    if (!_226)
    {
        int _228 = as_type<int>(_206);
        int _230 = 1088;
        int _232 = 0;
        int _234 = 0;
        int _236;
        int _238;
        int _240;
        int _242;
        int _244;
        int _246;
        _51(_228, _230, _232, _234, _236, _238, _240, _242, _244, _246);
        _248 = as_type<float>(_240);
        _250 = true;
    }
    else
    {
        float _252 = rsqrt(_206);
        float _254 = _206 * _252;
        float _256 = _252 * 0.5;
        float _258 = -_254;
        float _260 = 0.0 + _258;
        float _262 = fma(_256, _260, 0.5);
        float _264 = fma(_254, _262, _254);
        float _266 = -_264;
        float _268 = 0.0 + _266;
        float _270 = fma(_264, _268, _206);
        float _272 = fma(_256, _270, _264);
        _248 = _272;
    }
    _250 = false;
    float _274 = _248;
    float _276 = _220 * _274;
    float _278 = abs(_158);
    float _280 = abs(_182);
    float _282 = precise::max(_278, _280);
    float _284 = _276 * 0.15915493667125701904296875;
    float _286 = abs(_162);
    float _288 = precise::max(_286, _282);
    float _290 = _284 * 6.283185482025146484375;
    float _292 = cos(_290);
    float _294 = _284 * 6.283185482025146484375;
    float _296 = sin(_294);
    float _298 = 1.0 / _292;
    float _300 = 1.0 / _288;
    float _302 = _296 * _298;
    float _304 = _302 * (*spvDescriptorSet0.fp_c4)._m0[5].z;
    float _306 = _182 * _300;
    float _308 = precise::max(_304, 0.001000000047497451305389404296875);
    float _310 = _158 * _300;
    float _312 = _162 * _300;
    float _314 = -_224;
    float _316 = fma(_314, _308, _224);
    float3 _864 = float3(_310, _306, _312);
    float _318 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_864, float3(0.0), isnan(_864)), _316);
    float _320 = in.m_40.y;
    float _322 = in.m_40.x;
    float _324 = _100 * _152;
    float _326 = -(*spvDescriptorSet0.fp_c4)._m0[4].y;
    float _328 = _80 + _326;
    float _330 = -(*spvDescriptorSet0.fp_c4)._m0[4].x;
    float _332 = _82 + _330;
    float _334 = _328 * _328;
    float _336 = fma(_332, _332, _334);
    float _338 = -_336;
    float _340 = fma(_338, (*spvDescriptorSet0.fp_c4)._m0[4].z, 1.0);
    float _342 = precise::clamp(_340, 0.0, 1.0);
    float _344 = _320 * _320;
    float _346 = fma(_322, _322, _344);
    float _348 = _346 + 1.0;
    float _350 = rsqrt(_348);
    float _352 = _320 * _350;
    float _354 = _322 * _350;
    float _356 = _84 * _350;
    float _358 = -_352;
    float _360 = fma(_104, _152, _358);
    float _362 = -_354;
    float _364 = fma(_108, _152, _362);
    float _366 = _360 * _360;
    float _368 = -_356;
    float _370 = _324 + _368;
    float _372 = _132 * _360;
    float _374 = -_352;
    float _376 = _132 * _374;
    float _378 = fma(_364, _364, _366);
    float _380 = 0.0 + _324;
    float _382 = precise::clamp(_380, 0.0, 1.0);
    float _384 = -_144;
    float _386 = -_372;
    float _388 = fma(_384, _364, _386);
    float _390 = -_360;
    float _392 = _352 * _390;
    float _394 = fma(_370, _370, _378);
    float _396 = -_376;
    float _398 = fma(_144, _354, _396);
    float _400 = -_170;
    float _402 = fma(_400, _370, _388);
    float _404 = -_354;
    float _406 = fma(_404, _364, _392);
    float _408 = rsqrt(_394);
    float _410 = _408 * _402;
    float _412 = precise::clamp(_410, 0.0, 1.0);
    float _414 = -_356;
    float _416 = fma(_414, _370, _406);
    float _418 = fma(_170, _356, _398);
    float _420 = -_168;
    float _422 = _420 + 1.0;
    float _424 = abs(_412);
    float _426 = log2(_424);
    float _428 = -_184;
    float _430 = precise::min(_428, _418);
    float _432 = fma(_422, _382, _168);
    float _434 = 1.0 / _416;
    float _436 = _412 * _430;
    float _438 = _436 * 2.0;
    float _440 = _342 * _432;
    float _442 = _76 * _426;
    float _444 = exp2(_442);
    float _446 = _438 * _434;
    float _448 = precise::clamp(_446, 0.0, 1.0);
    float _450 = _448 * _440;
    float _452 = _78 * _450;
    float _454 = _444 * _452;
    float _456 = _222 * _318;
    float _458 = _318 * _454;
    float _460 = _192 * _456;
    float _462 = _458 * (*spvDescriptorSet0.fp_c4)._m0[2].x;
    float _464 = _458 * (*spvDescriptorSet0.fp_c4)._m0[2].y;
    float _466 = _458 * (*spvDescriptorSet0.fp_c4)._m0[2].z;
    float _468 = _460 * (*spvDescriptorSet0.fp_c4)._m0[1].x;
    float _470 = _460 * (*spvDescriptorSet0.fp_c4)._m0[1].y;
    float _472 = _460 * (*spvDescriptorSet0.fp_c4)._m0[1].z;
    out.m_43.x = _468;
    out.m_43.y = _470;
    out.m_43.z = _472;
    out.m_45.x = _462;
    out.m_45.y = _464;
    out.m_45.z = _466;
    return out;
}

