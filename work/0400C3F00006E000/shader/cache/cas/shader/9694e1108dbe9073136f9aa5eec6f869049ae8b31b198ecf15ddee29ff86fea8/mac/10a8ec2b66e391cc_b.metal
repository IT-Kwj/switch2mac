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
    texture2d<float> fp_t_tcb_C [[id(4)]];
    sampler fp_t_tcb_CSmplr [[id(5)]];
    texture2d_array<float> fp_t_tcb_E [[id(6)]];
    sampler fp_t_tcb_ESmplr [[id(7)]];
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
    float2 _432 = float2(_52, _54);
    float _56 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_432, float2(0.0), isnan(_432))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_432, float2(0.0), isnan(_432))).x;
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
            _160 = _150;
            _162 = _154;
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
            _160 = _190;
            _162 = _194;
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
            _160 = _222;
            _162 = _226;
            _164 = _224;
        }
    }
    float _230 = _158;
    float _232 = _160;
    float _234 = _162;
    float _236 = _164;
    float2 _819 = float2(_52, _54);
    float2 _240 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_819, float2(0.0), isnan(_819))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_819, float2(0.0), isnan(_819))).xy;
    float _242 = _240.x;
    float _244 = _240.y;
    float _246 = _76 * (*spvDescriptorSet0.fp_c3)._m0[15].y;
    float _248 = float(int(_104));
    float _250 = 1.0 / _230;
    float _252 = _76 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _254 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[15].x, _246);
    float _256 = _76 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _258 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[13].x, _252);
    float _260 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[15].z, _254);
    float _262 = rint(_248);
    float _264 = precise::max(_262, 0.0);
    uint _266 = uint(_264);
    uint _268 = clamp(_266, 0u, 65535u);
    float _270 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[13].z, _258);
    float _272 = _260 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
    float _274 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[12].x, _256);
    float _276 = _270 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float _278 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[12].z, _274);
    float _280 = 1.0 / _272;
    float _282 = _250 * _232;
    float _284 = _250 * _234;
    float _286 = precise::clamp(_284, 0.0, 1.0);
    float _288 = _278 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _290 = _250 * _236;
    float _292 = _288 * _280;
    float _294 = _276 * _280;
    float _296 = fma(_244, 2.0, -1.0);
    float _298 = fma(_242, 2.0, -1.0);
    float _300 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _302 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _304 = _296 * (*spvDescriptorSet0.fp_c3)._m0[36].w;
    float _306 = _298 * (*spvDescriptorSet0.fp_c3)._m0[36].z;
    float _308 = fma(_286, _300, _282);
    float _310 = -_302;
    float _312 = fma(_286, _310, _290);
    float _314 = fma(_304, 2.0, _54);
    float _316 = fma(_306, 2.0, _52);
    float _318 = -_300;
    float _320 = fma(_286, _318, _282);
    float _322 = fma(_286, _302, _290);
    float3 _980 = float3(_282, _322, float(int(_268)));
    float3 _984 = select(_980, float3(0.0), isnan(_980));
    float _324 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _984.xy, uint(rint(_984.z)), _286);
    float3 _993 = float3(_308, _322, float(int(_268)));
    float3 _995 = select(_993, float3(0.0), isnan(_993));
    float _326 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _995.xy, uint(rint(_995.z)), _286);
    float3 _1004 = float3(_320, _322, float(int(_268)));
    float3 _1006 = select(_1004, float3(0.0), isnan(_1004));
    float _328 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1006.xy, uint(rint(_1006.z)), _286);
    float3 _1015 = float3(_308, _290, float(int(_268)));
    float3 _1017 = select(_1015, float3(0.0), isnan(_1015));
    float _330 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1017.xy, uint(rint(_1017.z)), _286);
    float3 _1026 = float3(_282, _290, float(int(_268)));
    float3 _1028 = select(_1026, float3(0.0), isnan(_1026));
    float _332 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1028.xy, uint(rint(_1028.z)), _286);
    float2 _1034 = float2(_292, _294);
    float2 _334 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_1034, float2(0.0), isnan(_1034))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_1034, float2(0.0), isnan(_1034))).xy;
    float _336 = _334.x;
    float _338 = _334.y;
    float3 _1049 = float3(_320, _290, float(int(_268)));
    float3 _1051 = select(_1049, float3(0.0), isnan(_1049));
    float _340 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1051.xy, uint(rint(_1051.z)), _286);
    float3 _1060 = float3(_308, _312, float(int(_268)));
    float3 _1062 = select(_1060, float3(0.0), isnan(_1060));
    float _342 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1062.xy, uint(rint(_1062.z)), _286);
    float3 _1071 = float3(_282, _312, float(int(_268)));
    float3 _1073 = select(_1071, float3(0.0), isnan(_1071));
    float _344 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1073.xy, uint(rint(_1073.z)), _286);
    float3 _1082 = float3(_320, _312, float(int(_268)));
    float3 _1084 = select(_1082, float3(0.0), isnan(_1082));
    float _346 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1084.xy, uint(rint(_1084.z)), _286);
    float2 _1090 = float2(_316, _314);
    float _348 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1090, float2(0.0), isnan(_1090))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1090, float2(0.0), isnan(_1090))).x;
    float _350 = _76 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _352 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[14].x, _350);
    float _354 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[14].z, _352);
    float _356 = _354 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _358 = precise::min(_356, 1.0);
    float _360 = -_66;
    float _362 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _364 = _360 + _362;
    float _366 = _364 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _368 = precise::clamp(_366, 0.0, 1.0);
    float _370 = _326 + _324;
    float _372 = _370 + _328;
    float _374 = -_336;
    float _376 = fma(_374, _336, _338);
    float _378 = -_336;
    float _380 = _358 + _378;
    float _382 = _372 + _330;
    float _384 = fma(_380, _380, _376);
    float _386 = _382 + _332;
    bool _388 = _380 <= 0.001000000047497451305389404296875;
    float _390 = float(_388);
    float _392 = 1.0 / _384;
    float _394 = _386 + _340;
    float _396 = _394 + _342;
    float _398 = _396 + _344;
    float _400 = _398 + _346;
    float _402 = _376 * _392;
    float _404 = -_66;
    float _406 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _408 = _404 + _406;
    float _410 = precise::max(_402, _390);
    float _412 = _408 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _414 = precise::clamp(_412, 0.0, 1.0);
    float _416 = precise::min(_410, 1.0);
    float _418 = fma(_400, 0.111111111938953399658203125, _414);
    float _420 = _416 + _368;
    out.m_45.x = _348;
    out.m_45.y = _418;
    out.m_45.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_45.w = _420;
    return out;
}

