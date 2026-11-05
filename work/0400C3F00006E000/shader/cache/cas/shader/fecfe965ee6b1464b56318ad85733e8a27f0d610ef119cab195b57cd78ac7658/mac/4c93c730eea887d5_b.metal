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
    constant _16* fp_c1 [[id(0)]];
    constant _16* fp_c3 [[id(1)]];
    texture2d<float> fp_t_tcb_8 [[id(2)]];
    sampler fp_t_tcb_8Smplr [[id(3)]];
    texture2d_array<float> fp_t_tcb_E [[id(4)]];
    sampler fp_t_tcb_ESmplr [[id(5)]];
    texture2d<float> fp_t_tcb_C [[id(6)]];
    sampler fp_t_tcb_CSmplr [[id(7)]];
    texture2d<float> fp_t_tcb_10 [[id(8)]];
    sampler fp_t_tcb_10Smplr [[id(9)]];
    texture2d<float> fp_t_tcb_A [[id(10)]];
    sampler fp_t_tcb_ASmplr [[id(11)]];
    sampler fp_t_tcb_8Smplr_w [[id(12)]];
    sampler fp_t_tcb_CSmplr_w [[id(13)]];
    sampler fp_t_tcb_10Smplr_w [[id(14)]];
    sampler fp_t_tcb_ASmplr_w [[id(15)]];
    constant dm_border_t* dm_border [[id(16)]];
};

struct main0_out
{
    float4 m_45 [[color(0)]];
};

struct main0_in
{
    float4 m_42 [[user(locn0), center_no_perspective]];
    float4 m_40 [[user(locn1), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    bool _124 = false;
    bool _122 = false;
    float _52 = in.m_40.x;
    float _54 = in.m_40.y;
    float2 _468 = float2(_52, _54);
    float _56 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_468, float2(0.0), isnan(_468))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_468, float2(0.0), isnan(_468))).x;
    float _58 = in.m_42.x;
    float _60 = in.m_42.y;
    float _62 = -_56;
    float _64 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _66 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[46].z, _64);
    float _68 = _66 * _58;
    float _70 = -_66;
    bool _74 = _70 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _76 = _66 * _60;
    float _78 = -_66;
    bool _80 = _78 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    float _82 = -_66;
    bool _84 = _82 > (*spvDescriptorSet0.fp_c3)._m0[41].x;
    bool _86 = !_74;
    int _89 = _86 ? 0 : 1;
    int _91 = 2;
    if (!_74)
    {
        _91 = 1;
    }
    int _93 = _91;
    int _95 = _93;
    if (!_80)
    {
        _95 = _89;
    }
    int _97 = _95;
    int _99 = _97 + 1;
    uint _102 = uint(_99);
    if (!_84)
    {
        _102 = uint(_97);
    }
    uint _104 = _102;
    uint _106 = min(_104, 2u);
    int _108 = int(_106) << 2;
    uint _110 = uint(int(uint(_108) >> uint(2)));
    uint _112 = uint(int(uint(int(_110)) >> uint(2)));
    int _114 = int(_110) & 3;
    float _116 = (*spvDescriptorSet0.fp_c1)._m0[int(_112)][_114];
    bool _118 = as_type<int>(_116) == 384;
    if (!_118)
    {
        bool _120 = as_type<int>(_116) == 656;
        _122 = _120;
        if (!_122)
        {
            _124 = true;
        }
    }
    float _158;
    float _160;
    float _162;
    float _164;
    if (!_122)
    {
        if (!_124)
        {
            float _126 = _76 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _128 = _76 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _130 = _76 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _132 = _76 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _134 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[0].x, _126);
            float _136 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[1].x, _128);
            float _138 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[2].x, _130);
            float _140 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[3].x, _132);
            float _142 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[0].z, _134);
            float _144 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[1].z, _136);
            float _146 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[2].z, _138);
            float _148 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[3].z, _140);
            float _150 = _142 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _152 = _144 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _154 = _146 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _156 = _148 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _158 = _156;
            _160 = _154;
            _162 = _150;
            _164 = _152;
        }
    }
    if ((false || _124) || _122)
    {
        if ((!_124) || _122)
        {
            _122 = false;
            float _166 = _76 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _168 = _76 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _170 = _76 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _172 = _76 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _174 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[4].x, _166);
            float _176 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[5].x, _168);
            float _178 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[6].x, _170);
            float _180 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[7].x, _172);
            float _182 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[4].z, _174);
            float _184 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[5].z, _176);
            float _186 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[6].z, _178);
            float _188 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[7].z, _180);
            float _190 = _182 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _192 = _184 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _194 = _186 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _196 = _188 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _158 = _196;
            _160 = _194;
            _162 = _190;
            _164 = _192;
        }
        if (false || _124)
        {
            _124 = false;
            float _198 = _76 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _200 = _76 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _202 = _76 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _204 = _76 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _206 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[8].x, _198);
            float _208 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[9].x, _200);
            float _210 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[10].x, _202);
            float _212 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[11].x, _204);
            float _214 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[8].z, _206);
            float _216 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[9].z, _208);
            float _218 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[10].z, _210);
            float _220 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[11].z, _212);
            float _222 = _214 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _224 = _216 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _226 = _218 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _228 = _220 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _158 = _228;
            _160 = _226;
            _162 = _222;
            _164 = _224;
        }
    }
    float _230 = _158;
    float _232 = _160;
    float _234 = _162;
    float _236 = _164;
    float _238 = 1.0 / _230;
    float _240 = float(int(_104));
    float _242 = rint(_240);
    float _244 = precise::max(_242, 0.0);
    uint _246 = uint(_244);
    uint _248 = clamp(_246, 0u, 65535u);
    float _250 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _252 = _238 * _232;
    float _254 = precise::clamp(_252, 0.0, 1.0);
    float _256 = _238 * _234;
    float _258 = _238 * _236;
    float _260 = _254 * _250;
    float _262 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _264 = fma(_260, 0.5, _256);
    float _266 = _254 * _262;
    float _268 = fma(_260, 1.5, _256);
    float _270 = fma(_260, -0.5, _256);
    float _272 = fma(_260, -1.5, _256);
    float _274 = fma(_266, 1.5, _258);
    float _276 = fma(_266, 0.5, _258);
    float3 _926 = float3(_264, _274, float(int(_248)));
    float3 _930 = select(_926, float3(0.0), isnan(_926));
    float _278 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _930.xy, uint(rint(_930.z)), _254);
    float3 _939 = float3(_270, _274, float(int(_248)));
    float3 _941 = select(_939, float3(0.0), isnan(_939));
    float _280 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _941.xy, uint(rint(_941.z)), _254);
    float3 _950 = float3(_272, _274, float(int(_248)));
    float3 _952 = select(_950, float3(0.0), isnan(_950));
    float _282 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _952.xy, uint(rint(_952.z)), _254);
    float3 _961 = float3(_268, _274, float(int(_248)));
    float3 _963 = select(_961, float3(0.0), isnan(_961));
    float _284 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _963.xy, uint(rint(_963.z)), _254);
    float3 _972 = float3(_268, _276, float(int(_248)));
    float3 _974 = select(_972, float3(0.0), isnan(_972));
    float _286 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _974.xy, uint(rint(_974.z)), _254);
    float3 _983 = float3(_264, _276, float(int(_248)));
    float3 _985 = select(_983, float3(0.0), isnan(_983));
    float _288 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _985.xy, uint(rint(_985.z)), _254);
    float3 _994 = float3(_270, _276, float(int(_248)));
    float3 _996 = select(_994, float3(0.0), isnan(_994));
    float _290 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _996.xy, uint(rint(_996.z)), _254);
    float3 _1005 = float3(_272, _276, float(int(_248)));
    float3 _1007 = select(_1005, float3(0.0), isnan(_1005));
    float _292 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1007.xy, uint(rint(_1007.z)), _254);
    float2 _1013 = float2(_52, _54);
    float2 _296 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1013, float2(0.0), isnan(_1013))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1013, float2(0.0), isnan(_1013))).xy;
    float _298 = _296.x;
    float _300 = _296.y;
    float _302 = fma(_266, -1.5, _258);
    float _304 = _284 + _278;
    float _306 = _304 + _280;
    float _308 = _306 + _282;
    float _310 = _308 + _286;
    float _312 = fma(_266, -0.5, _258);
    float _314 = _310 + _288;
    float3 _1049 = float3(_268, _312, float(int(_248)));
    float3 _1051 = select(_1049, float3(0.0), isnan(_1049));
    float _316 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1051.xy, uint(rint(_1051.z)), _254);
    float3 _1060 = float3(_264, _312, float(int(_248)));
    float3 _1062 = select(_1060, float3(0.0), isnan(_1060));
    float _318 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1062.xy, uint(rint(_1062.z)), _254);
    float3 _1071 = float3(_270, _312, float(int(_248)));
    float3 _1073 = select(_1071, float3(0.0), isnan(_1071));
    float _320 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1073.xy, uint(rint(_1073.z)), _254);
    float3 _1082 = float3(_272, _312, float(int(_248)));
    float3 _1084 = select(_1082, float3(0.0), isnan(_1082));
    float _322 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1084.xy, uint(rint(_1084.z)), _254);
    float _324 = _76 * (*spvDescriptorSet0.fp_c3)._m0[15].y;
    float _326 = _76 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _328 = _314 + _290;
    float _330 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[15].x, _324);
    float _332 = _76 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _334 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[15].z, _330);
    float _336 = _334 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
    float _338 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[12].x, _332);
    float _340 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[13].x, _326);
    float _342 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[12].z, _338);
    float _344 = 1.0 / _336;
    float _346 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[13].z, _340);
    float _348 = _342 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _350 = _346 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float _352 = fma(_298, 2.0, -1.0);
    float _354 = fma(_300, 2.0, -1.0);
    float _356 = _348 * _344;
    float _358 = _350 * _344;
    float _360 = _328 + _292;
    float _362 = _352 * (*spvDescriptorSet0.fp_c3)._m0[36].z;
    float _364 = _354 * (*spvDescriptorSet0.fp_c3)._m0[36].w;
    float2 _1176 = float2(_356, _358);
    float2 _366 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_1176, float2(0.0), isnan(_1176))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_1176, float2(0.0), isnan(_1176))).xy;
    float _368 = _366.x;
    float _370 = _366.y;
    float _372 = fma(_362, 2.0, _52);
    float _374 = fma(_364, 2.0, _54);
    float3 _1197 = float3(_268, _302, float(int(_248)));
    float3 _1199 = select(_1197, float3(0.0), isnan(_1197));
    float _376 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1199.xy, uint(rint(_1199.z)), _254);
    float3 _1208 = float3(_264, _302, float(int(_248)));
    float3 _1210 = select(_1208, float3(0.0), isnan(_1208));
    float _378 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1210.xy, uint(rint(_1210.z)), _254);
    float3 _1219 = float3(_270, _302, float(int(_248)));
    float3 _1221 = select(_1219, float3(0.0), isnan(_1219));
    float _380 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1221.xy, uint(rint(_1221.z)), _254);
    float3 _1230 = float3(_272, _302, float(int(_248)));
    float3 _1232 = select(_1230, float3(0.0), isnan(_1230));
    float _382 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1232.xy, uint(rint(_1232.z)), _254);
    float2 _1238 = float2(_372, _374);
    float _384 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1238, float2(0.0), isnan(_1238))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1238, float2(0.0), isnan(_1238))).x;
    float _386 = _76 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _388 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[14].x, _386);
    float _390 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[14].z, _388);
    float _392 = _390 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _394 = precise::min(_392, 1.0);
    float _396 = -_66;
    float _398 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _400 = _396 + _398;
    float _402 = _400 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _404 = precise::clamp(_402, 0.0, 1.0);
    float _406 = _360 + _316;
    float _408 = _406 + _318;
    float _410 = _408 + _320;
    float _412 = _410 + _322;
    float _414 = -_368;
    float _416 = fma(_414, _368, _370);
    float _418 = -_368;
    float _420 = _394 + _418;
    float _422 = fma(_420, _420, _416);
    bool _424 = _420 <= 0.001000000047497451305389404296875;
    float _426 = float(_424);
    float _428 = _412 + _376;
    float _430 = 1.0 / _422;
    float _432 = _428 + _378;
    float _434 = _432 + _380;
    float _436 = -_66;
    float _438 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _440 = _436 + _438;
    float _442 = _416 * _430;
    float _444 = _434 + _382;
    float _446 = _440 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _448 = precise::clamp(_446, 0.0, 1.0);
    float _450 = precise::max(_442, _426);
    float _452 = fma(_444, 0.0625, _404);
    float _454 = precise::min(_450, 1.0);
    float _456 = _454 + _448;
    out.m_45.x = _384;
    out.m_45.y = _452;
    out.m_45.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_45.w = _456;
    return out;
}

