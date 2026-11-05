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
    texture2d_array<float> fp_t_tcb_10 [[id(6)]];
    sampler fp_t_tcb_10Smplr [[id(7)]];
    texture2d_array<float> fp_t_tcb_12 [[id(8)]];
    sampler fp_t_tcb_12Smplr [[id(9)]];
    texture2d<float> fp_t_tcb_C [[id(10)]];
    sampler fp_t_tcb_CSmplr [[id(11)]];
    texture2d<float> fp_t_tcb_A [[id(12)]];
    sampler fp_t_tcb_ASmplr [[id(13)]];
    sampler fp_t_tcb_8Smplr_w [[id(14)]];
    sampler fp_t_tcb_CSmplr_w [[id(15)]];
    sampler fp_t_tcb_ASmplr_w [[id(16)]];
    constant dm_border_t* dm_border [[id(17)]];
};

struct main0_out
{
    float4 m_47 [[color(0)]];
};

struct main0_in
{
    float4 m_44 [[user(locn0), center_no_perspective]];
    float4 m_42 [[user(locn1), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    bool _126 = false;
    bool _124 = false;
    float _54 = in.m_42.x;
    float _56 = in.m_42.y;
    float2 _914 = float2(_54, _56);
    float _58 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_914, float2(0.0), isnan(_914))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_914, float2(0.0), isnan(_914))).x;
    float _60 = in.m_44.y;
    float _62 = -_58;
    float _64 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _66 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[46].z, _64);
    float _68 = -_66;
    bool _72 = _68 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _74 = -_66;
    bool _76 = _74 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    float _78 = -_66;
    bool _80 = _78 > (*spvDescriptorSet0.fp_c3)._m0[41].x;
    bool _82 = !_72;
    int _85 = _82 ? 0 : 1;
    int _87 = 2;
    if (!_72)
    {
        _87 = 1;
    }
    int _89 = _87;
    int _91 = _89;
    if (!_76)
    {
        _91 = _85;
    }
    int _93 = _91;
    int _95 = _93 + 1;
    uint _98 = uint(_95);
    if (!_80)
    {
        _98 = uint(_93);
    }
    uint _100 = _98;
    float _102 = in.m_44.x;
    uint _104 = min(_100, 2u);
    int _106 = int(_104) << 2;
    float _108 = _66 * _60;
    uint _110 = uint(int(uint(_106) >> uint(2)));
    uint _112 = uint(int(uint(int(_110)) >> uint(2)));
    int _114 = int(_110) & 3;
    float _116 = (*spvDescriptorSet0.fp_c1)._m0[int(_112)][_114];
    float _118 = _66 * _102;
    bool _120 = as_type<int>(_116) == 384;
    if (!_120)
    {
        bool _122 = as_type<int>(_116) == 656;
        _124 = _122;
        if (!_124)
        {
            _126 = true;
        }
    }
    float _160;
    float _162;
    float _164;
    float _166;
    if (!_124)
    {
        if (!_126)
        {
            float _128 = _108 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _130 = _108 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _132 = _108 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _134 = _108 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _136 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[0].x, _128);
            float _138 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[1].x, _130);
            float _140 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[2].x, _132);
            float _142 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[3].x, _134);
            float _144 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[0].z, _136);
            float _146 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[1].z, _138);
            float _148 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[2].z, _140);
            float _150 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[3].z, _142);
            float _152 = _144 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _154 = _146 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _156 = _148 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _158 = _150 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _160 = _158;
            _162 = _156;
            _164 = _152;
            _166 = _154;
        }
    }
    if ((false || _126) || _124)
    {
        if ((!_126) || _124)
        {
            _124 = false;
            float _168 = _108 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _170 = _108 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _172 = _108 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _174 = _108 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _176 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[4].x, _168);
            float _178 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[5].x, _170);
            float _180 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[6].x, _172);
            float _182 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[7].x, _174);
            float _184 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[4].z, _176);
            float _186 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[5].z, _178);
            float _188 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[6].z, _180);
            float _190 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[7].z, _182);
            float _192 = _184 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _194 = _186 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _196 = _188 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _198 = _190 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _160 = _198;
            _162 = _196;
            _164 = _192;
            _166 = _194;
        }
        if (false || _126)
        {
            _126 = false;
            float _200 = _108 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _202 = _108 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _204 = _108 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _206 = _108 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _208 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[8].x, _200);
            float _210 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[9].x, _202);
            float _212 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[10].x, _204);
            float _214 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[11].x, _206);
            float _216 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[8].z, _208);
            float _218 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[9].z, _210);
            float _220 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[10].z, _212);
            float _222 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[11].z, _214);
            float _224 = _216 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _226 = _218 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _228 = _220 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _230 = _222 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _160 = _230;
            _162 = _228;
            _164 = _224;
            _166 = _226;
        }
    }
    float _232 = _160;
    float _234 = _162;
    float _236 = _164;
    float _238 = _166;
    float _240 = 1.0 / _232;
    float _242 = float(int(_100));
    float _244 = rint(_242);
    float _246 = precise::max(_244, 0.0);
    uint _248 = uint(_246);
    uint _250 = clamp(_248, 0u, 65535u);
    float _252 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _254 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _256 = _240 * _234;
    float _258 = precise::clamp(_256, 0.0, 1.0);
    float _260 = _240 * _236;
    float _262 = _240 * _238;
    float _264 = _258 * _252;
    float _266 = _258 * _254;
    float _268 = fma(_264, 0.5, _260);
    float _270 = fma(_266, 1.5, _262);
    float _272 = fma(_264, 1.5, _260);
    float _274 = fma(_264, -0.5, _260);
    float _276 = fma(_264, -1.5, _260);
    float3 _1369 = float3(_268, _270, float(int(_250)));
    float3 _1373 = select(_1369, float3(0.0), isnan(_1369));
    float _278 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1373.xy, uint(rint(_1373.z)), _258);
    float3 _1382 = float3(_272, _270, float(int(_250)));
    float3 _1384 = select(_1382, float3(0.0), isnan(_1382));
    float _280 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1384.xy, uint(rint(_1384.z)), _258);
    float3 _1393 = float3(_274, _270, float(int(_250)));
    float3 _1395 = select(_1393, float3(0.0), isnan(_1393));
    float _282 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1395.xy, uint(rint(_1395.z)), _258);
    float _284 = fma(_266, 0.5, _262);
    float3 _1407 = float3(_276, _270, float(int(_250)));
    float3 _1409 = select(_1407, float3(0.0), isnan(_1407));
    float _286 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1409.xy, uint(rint(_1409.z)), _258);
    float3 _1418 = float3(_272, _284, float(int(_250)));
    float3 _1420 = select(_1418, float3(0.0), isnan(_1418));
    float _288 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1420.xy, uint(rint(_1420.z)), _258);
    float3 _1429 = float3(_268, _284, float(int(_250)));
    float3 _1431 = select(_1429, float3(0.0), isnan(_1429));
    float _290 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1431.xy, uint(rint(_1431.z)), _258);
    float _292 = _280 + _278;
    float _294 = _292 + _282;
    float _296 = _294 + _286;
    float _298 = _296 + _288;
    float _300 = _298 + _290;
    float _302 = fma(_266, -0.5, _262);
    float3 _1458 = float3(_274, _284, float(int(_250)));
    float3 _1460 = select(_1458, float3(0.0), isnan(_1458));
    float _304 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1460.xy, uint(rint(_1460.z)), _258);
    float3 _1469 = float3(_276, _284, float(int(_250)));
    float3 _1471 = select(_1469, float3(0.0), isnan(_1469));
    float _306 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1471.xy, uint(rint(_1471.z)), _258);
    float3 _1480 = float3(_272, _302, float(int(_250)));
    float3 _1482 = select(_1480, float3(0.0), isnan(_1480));
    float _308 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1482.xy, uint(rint(_1482.z)), _258);
    float3 _1491 = float3(_268, _302, float(int(_250)));
    float3 _1493 = select(_1491, float3(0.0), isnan(_1491));
    float _310 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1493.xy, uint(rint(_1493.z)), _258);
    float3 _1502 = float3(_274, _302, float(int(_250)));
    float3 _1504 = select(_1502, float3(0.0), isnan(_1502));
    float _312 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1504.xy, uint(rint(_1504.z)), _258);
    float3 _1513 = float3(_276, _302, float(int(_250)));
    float3 _1515 = select(_1513, float3(0.0), isnan(_1513));
    float _314 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1515.xy, uint(rint(_1515.z)), _258);
    float _316 = -_108;
    float _318 = _316 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _320 = fma(_266, -1.5, _262);
    float _322 = -_118;
    float _324 = _322 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _326 = _318 * _318;
    float _328 = -_66;
    float _330 = _328 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _332 = fma(_324, _324, _326);
    float _334 = fma(_330, _330, _332);
    float _336 = sqrt(_334);
    bool _338 = _336 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    bool _340 = _336 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    bool _342 = !_338;
    int _344 = _342 ? 0 : 1;
    float _346 = _108 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _348 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[22].x, _346);
    float _350 = _108 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    int _352 = 2;
    if (!_338)
    {
        _352 = 1;
    }
    int _354 = _352;
    float _356 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[22].z, _348);
    int _358 = _354;
    if (!_340)
    {
        _358 = _344;
    }
    int _360 = _358;
    float _362 = float(_360);
    float _364 = _108 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _366 = precise::min(_362, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _368 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[19].x, _364);
    float _370 = _108 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    bool _372 = _366 != 1.0;
    bool _374 = isnan(_366);
    bool _376 = _372 || _374;
    bool _378 = isnan(1.0);
    bool _380 = _376 || _378;
    float _382 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[19].z, _368);
    float _384 = _382 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float _386 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[20].x, _370);
    float3 _1651 = float3(_272, _320, float(int(_250)));
    float3 _1653 = select(_1651, float3(0.0), isnan(_1651));
    float _388 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1653.xy, uint(rint(_1653.z)), _258);
    float _390 = _108 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _392 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[20].z, _386);
    float _394 = _384;
    if (_380)
    {
        float _396 = _356 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _394 = _396;
    }
    float _398 = _394;
    float _400 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[23].x, _350);
    float _402 = _108 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    float _404 = _392 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _406 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[21].x, _390);
    float _408 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[23].z, _400);
    float _410 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[21].z, _406);
    float _412 = _404;
    float _414 = _398;
    if (_380)
    {
        float _416 = _408 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _412 = _416;
    }
    float _418 = _412;
    float _420 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[24].x, _402);
    float _422 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[24].z, _420);
    float3 _1732 = float3(_268, _320, float(int(_250)));
    float3 _1734 = select(_1732, float3(0.0), isnan(_1732));
    float _424 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1734.xy, uint(rint(_1734.z)), _258);
    float3 _1743 = float3(_274, _320, float(int(_250)));
    float3 _1745 = select(_1743, float3(0.0), isnan(_1743));
    float _426 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1745.xy, uint(rint(_1745.z)), _258);
    float _428 = _410 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _430 = _428;
    float _432 = _418;
    if (_380)
    {
        float _434 = _422 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _430 = _434;
    }
    float _436 = _430;
    bool _438 = _366 != 0.0;
    bool _440 = isnan(_366);
    bool _442 = _438 || _440;
    bool _444 = isnan(0.0);
    bool _446 = _442 || _444;
    float _448 = _108 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _450 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[16].x, _448);
    float _452 = _108 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _454 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[16].z, _450);
    float _456 = _436;
    if (!_446)
    {
        float _458 = _454 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _414 = _458;
    }
    float _460 = _414;
    float _462 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[17].x, _452);
    float _464 = _108 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _466 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[17].z, _462);
    if (!_446)
    {
        float _468 = _466 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _432 = _468;
    }
    float _470 = _432;
    float _472 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[18].x, _464);
    float _474 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].w;
    float _476 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[18].z, _472);
    if (!_446)
    {
        float _478 = _476 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _456 = _478;
    }
    float _480 = _456;
    float _482 = 0.0 + _480;
    float _484 = precise::clamp(_482, 0.0, 1.0);
    float _486 = _300 + _304;
    float _488 = _486 + _306;
    float _490 = rint(_366);
    float _492 = precise::max(_490, 0.0);
    uint _494 = uint(_492);
    uint _496 = clamp(_494, 0u, 65535u);
    float _498 = _488 + _308;
    float _500 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].z;
    float _502 = _484 * _474;
    float _504 = _498 + _310;
    float _506 = fma(_502, 1.5, _470);
    float _508 = _504 + _312;
    float _510 = _484 * _500;
    float _512 = fma(_510, 0.5, _460);
    float _514 = fma(_510, -0.5, _460);
    float3 _1908 = float3(_276, _320, float(int(_250)));
    float3 _1910 = select(_1908, float3(0.0), isnan(_1908));
    float _516 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1910.xy, uint(rint(_1910.z)), _258);
    float3 _1919 = float3(_512, _506, float(int(_496)));
    float3 _1921 = select(_1919, float3(0.0), isnan(_1919));
    float _518 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1921.xy, uint(rint(_1921.z)), _484);
    float3 _1930 = float3(_514, _506, float(int(_496)));
    float3 _1932 = select(_1930, float3(0.0), isnan(_1930));
    float _520 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1932.xy, uint(rint(_1932.z)), _484);
    float _522 = _508 + _314;
    float _524 = fma(_510, 1.5, _460);
    float _526 = fma(_510, -1.5, _460);
    float _528 = fma(_502, 0.5, _470);
    float _530 = _522 + _388;
    float _532 = _530 + _424;
    float _534 = _532 + _426;
    float3 _1962 = float3(_526, _506, float(int(_496)));
    float3 _1964 = select(_1962, float3(0.0), isnan(_1962));
    float _536 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1964.xy, uint(rint(_1964.z)), _484);
    float3 _1973 = float3(_524, _506, float(int(_496)));
    float3 _1975 = select(_1973, float3(0.0), isnan(_1973));
    float _538 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1975.xy, uint(rint(_1975.z)), _484);
    float3 _1984 = float3(_524, _528, float(int(_496)));
    float3 _1986 = select(_1984, float3(0.0), isnan(_1984));
    float _540 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1986.xy, uint(rint(_1986.z)), _484);
    float3 _1995 = float3(_512, _528, float(int(_496)));
    float3 _1997 = select(_1995, float3(0.0), isnan(_1995));
    float _542 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1997.xy, uint(rint(_1997.z)), _484);
    float3 _2006 = float3(_514, _528, float(int(_496)));
    float3 _2008 = select(_2006, float3(0.0), isnan(_2006));
    float _544 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2008.xy, uint(rint(_2008.z)), _484);
    float3 _2017 = float3(_526, _528, float(int(_496)));
    float3 _2019 = select(_2017, float3(0.0), isnan(_2017));
    float _546 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2019.xy, uint(rint(_2019.z)), _484);
    float _548 = fma(_502, -1.5, _470);
    float _550 = _534 + _516;
    float _552 = _538 + _518;
    float _554 = _552 + _520;
    float _556 = _554 + _536;
    float _558 = fma(_502, -0.5, _470);
    float _560 = _556 + _540;
    float3 _2049 = float3(_524, _558, float(int(_496)));
    float3 _2051 = select(_2049, float3(0.0), isnan(_2049));
    float _562 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2051.xy, uint(rint(_2051.z)), _484);
    float _564 = _560 + _542;
    float3 _2063 = float3(_512, _558, float(int(_496)));
    float3 _2065 = select(_2063, float3(0.0), isnan(_2063));
    float _566 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2065.xy, uint(rint(_2065.z)), _484);
    float _568 = _564 + _544;
    float3 _2077 = float3(_514, _558, float(int(_496)));
    float3 _2079 = select(_2077, float3(0.0), isnan(_2077));
    float _570 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2079.xy, uint(rint(_2079.z)), _484);
    float3 _2088 = float3(_526, _558, float(int(_496)));
    float3 _2090 = select(_2088, float3(0.0), isnan(_2088));
    float _572 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2090.xy, uint(rint(_2090.z)), _484);
    float3 _2099 = float3(_524, _548, float(int(_496)));
    float3 _2101 = select(_2099, float3(0.0), isnan(_2099));
    float _574 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2101.xy, uint(rint(_2101.z)), _484);
    float3 _2110 = float3(_512, _548, float(int(_496)));
    float3 _2112 = select(_2110, float3(0.0), isnan(_2110));
    float _576 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2112.xy, uint(rint(_2112.z)), _484);
    float3 _2121 = float3(_514, _548, float(int(_496)));
    float3 _2123 = select(_2121, float3(0.0), isnan(_2121));
    float _578 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2123.xy, uint(rint(_2123.z)), _484);
    float _580 = _108 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _582 = _108 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _584 = _108 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _586 = _108 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _588 = _108 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _590 = _108 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _592 = _108 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _594 = _108 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _596 = _108 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _598 = _568 + _546;
    float _600 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[25].x, _582);
    float _602 = -_108;
    float _604 = _602 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _606 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[29].x, _580);
    float _608 = -_118;
    float _610 = _608 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _612 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[27].x, _586);
    float _614 = _604 * _604;
    float _616 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[28].x, _588);
    float _618 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[26].x, _584);
    float _620 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[30].x, _590);
    float _622 = fma(_610, _610, _614);
    float _624 = -_66;
    float _626 = _624 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _628 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[31].x, _592);
    float _630 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[32].x, _594);
    float _632 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[33].x, _596);
    float _634 = fma(_626, _626, _622);
    float _636 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[28].z, _616);
    float _638 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[29].z, _606);
    float _640 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[30].z, _620);
    float _642 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[31].z, _628);
    float _644 = sqrt(_634);
    float _646 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[32].z, _630);
    float _648 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[33].z, _632);
    float _650 = _636 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _652 = _638 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    float _654 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[27].z, _612);
    float _656 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[25].z, _600);
    float _658 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[26].z, _618);
    bool _660 = _644 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    bool _662 = _644 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    bool _664 = !_660;
    int _666 = _664 ? 0 : 1;
    int _668 = 2;
    float _670 = _650;
    float _672 = _652;
    if (!_660)
    {
        _668 = 1;
    }
    int _674 = _668;
    int _676 = _674;
    if (!_662)
    {
        _676 = _666;
    }
    int _678 = _676;
    float _680 = _640 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _682 = float(_678);
    float _684 = precise::min(_682, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    bool _686 = _684 != 1.0;
    bool _688 = isnan(_684);
    bool _690 = _686 || _688;
    bool _692 = isnan(1.0);
    bool _694 = _690 || _692;
    float _696 = _680;
    if (_694)
    {
        float _698 = _642 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _670 = _698;
    }
    float _700 = _670;
    float _702 = _700;
    if (_694)
    {
        float _704 = _646 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _672 = _704;
    }
    float _706 = _672;
    float _708 = _706;
    if (_694)
    {
        float _710 = _648 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _696 = _710;
    }
    float _712 = _696;
    bool _714 = _684 != 0.0;
    bool _716 = isnan(_684);
    bool _718 = _714 || _716;
    bool _720 = isnan(0.0);
    bool _722 = _718 || _720;
    float _724 = rint(_684);
    float _726 = precise::max(_724, 0.0);
    uint _728 = uint(_726);
    uint _730 = clamp(_728, 0u, 65535u);
    float _732 = _712;
    if (!_722)
    {
        float _734 = _654 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _732 = _734;
    }
    float _736 = _732;
    if (!_722)
    {
        float _738 = _656 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _702 = _738;
    }
    float _740 = _702;
    if (!_722)
    {
        float _742 = _658 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _708 = _742;
    }
    float _744 = _708;
    float _746 = 0.0 + _736;
    float _748 = precise::clamp(_746, 0.0, 1.0);
    float _750 = _598 + _562;
    float _752 = _500 * _748;
    float _754 = _750 + _566;
    float _756 = fma(_752, 0.5, _740);
    float _758 = fma(_752, -0.5, _740);
    float _760 = fma(_752, -1.5, _740);
    float _762 = _754 + _570;
    float _764 = _474 * _748;
    float3 _2465 = float3(_526, _548, float(int(_496)));
    float3 _2467 = select(_2465, float3(0.0), isnan(_2465));
    float _766 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2467.xy, uint(rint(_2467.z)), _484);
    float _768 = fma(_764, 1.5, _744);
    float3 _2479 = float3(_756, _768, float(int(_730)));
    float3 _2481 = select(_2479, float3(0.0), isnan(_2479));
    float _770 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2481.xy, uint(rint(_2481.z)), _748);
    float3 _2490 = float3(_758, _768, float(int(_730)));
    float3 _2492 = select(_2490, float3(0.0), isnan(_2490));
    float _772 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2492.xy, uint(rint(_2492.z)), _748);
    float3 _2501 = float3(_760, _768, float(int(_730)));
    float3 _2503 = select(_2501, float3(0.0), isnan(_2501));
    float _774 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2503.xy, uint(rint(_2503.z)), _748);
    float _776 = fma(_752, 1.5, _740);
    float _778 = fma(_764, 0.5, _744);
    float3 _2518 = float3(_776, _768, float(int(_730)));
    float3 _2520 = select(_2518, float3(0.0), isnan(_2518));
    float _780 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2520.xy, uint(rint(_2520.z)), _748);
    float3 _2529 = float3(_776, _778, float(int(_730)));
    float3 _2531 = select(_2529, float3(0.0), isnan(_2529));
    float _782 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2531.xy, uint(rint(_2531.z)), _748);
    float3 _2540 = float3(_756, _778, float(int(_730)));
    float3 _2542 = select(_2540, float3(0.0), isnan(_2540));
    float _784 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2542.xy, uint(rint(_2542.z)), _748);
    float3 _2551 = float3(_758, _778, float(int(_730)));
    float3 _2553 = select(_2551, float3(0.0), isnan(_2551));
    float _786 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2553.xy, uint(rint(_2553.z)), _748);
    float2 _2559 = float2(_54, _56);
    float2 _790 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_2559, float2(0.0), isnan(_2559))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_2559, float2(0.0), isnan(_2559))).xy;
    float _792 = _790.x;
    float _794 = _790.y;
    float _796 = _762 + _572;
    float _798 = _796 + _574;
    float _800 = _798 + _576;
    float _802 = _800 + _578;
    float _804 = fma(_764, -0.5, _744);
    float _806 = _802 + _766;
    float _808 = _780 + _770;
    float _810 = _808 + _772;
    float _812 = _810 + _774;
    float _814 = _812 + _782;
    float3 _2604 = float3(_760, _778, float(int(_730)));
    float3 _2606 = select(_2604, float3(0.0), isnan(_2604));
    float _816 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2606.xy, uint(rint(_2606.z)), _748);
    float3 _2615 = float3(_776, _804, float(int(_730)));
    float3 _2617 = select(_2615, float3(0.0), isnan(_2615));
    float _818 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2617.xy, uint(rint(_2617.z)), _748);
    float3 _2626 = float3(_756, _804, float(int(_730)));
    float3 _2628 = select(_2626, float3(0.0), isnan(_2626));
    float _820 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2628.xy, uint(rint(_2628.z)), _748);
    float3 _2637 = float3(_758, _804, float(int(_730)));
    float3 _2639 = select(_2637, float3(0.0), isnan(_2637));
    float _822 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2639.xy, uint(rint(_2639.z)), _748);
    float _824 = _814 + _784;
    float _826 = fma(_764, -1.5, _744);
    float _828 = _824 + _786;
    float _830 = fma(_792, 2.0, -1.0);
    float _832 = fma(_794, 2.0, -1.0);
    float _834 = _830 * (*spvDescriptorSet0.fp_c3)._m0[36].z;
    float _836 = _832 * (*spvDescriptorSet0.fp_c3)._m0[36].w;
    float _838 = fma(_834, 2.0, _54);
    float _840 = fma(_836, 2.0, _56);
    float3 _2678 = float3(_760, _804, float(int(_730)));
    float3 _2680 = select(_2678, float3(0.0), isnan(_2678));
    float _842 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2680.xy, uint(rint(_2680.z)), _748);
    float3 _2689 = float3(_776, _826, float(int(_730)));
    float3 _2691 = select(_2689, float3(0.0), isnan(_2689));
    float _844 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2691.xy, uint(rint(_2691.z)), _748);
    float3 _2700 = float3(_756, _826, float(int(_730)));
    float3 _2702 = select(_2700, float3(0.0), isnan(_2700));
    float _846 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2702.xy, uint(rint(_2702.z)), _748);
    float3 _2711 = float3(_758, _826, float(int(_730)));
    float3 _2713 = select(_2711, float3(0.0), isnan(_2711));
    float _848 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2713.xy, uint(rint(_2713.z)), _748);
    float3 _2722 = float3(_760, _826, float(int(_730)));
    float3 _2724 = select(_2722, float3(0.0), isnan(_2722));
    float _850 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2724.xy, uint(rint(_2724.z)), _748);
    float2 _2730 = float2(_838, _840);
    float _852 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_2730, float2(0.0), isnan(_2730))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_2730, float2(0.0), isnan(_2730))).x;
    float _854 = _806 * 0.0625;
    float _856 = _828 + _816;
    float _858 = _856 + _818;
    float _860 = _858 + _820;
    float _862 = _860 + _822;
    float _864 = _862 + _842;
    float _866 = _864 + _844;
    float _868 = _866 + _846;
    float _870 = -_66;
    float _872 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _874 = _870 + _872;
    float _876 = -_66;
    float _878 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _880 = _876 + _878;
    float _882 = _868 + _848;
    float _884 = _874 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _886 = precise::clamp(_884, 0.0, 1.0);
    float _888 = _880 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _890 = precise::clamp(_888, 0.0, 1.0);
    float _892 = _882 + _850;
    float _894 = fma(_550, 0.0625, _886);
    float _896 = _892 * 0.0625;
    float _898 = _896 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _900 = fma(_854, (*spvDescriptorSet0.fp_c3)._m0[49].z, _898);
    float _902 = _900 + _890;
    out.m_47.x = _852;
    out.m_47.y = _894;
    out.m_47.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_47.w = _902;
    return out;
}

