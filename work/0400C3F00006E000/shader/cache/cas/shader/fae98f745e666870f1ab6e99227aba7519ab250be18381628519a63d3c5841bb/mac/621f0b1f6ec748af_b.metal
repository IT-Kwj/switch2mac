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
    texture2d_array<float> fp_t_tcb_C [[id(4)]];
    sampler fp_t_tcb_CSmplr [[id(5)]];
    texture2d_array<float> fp_t_tcb_E [[id(6)]];
    sampler fp_t_tcb_ESmplr [[id(7)]];
    texture2d_array<float> fp_t_tcb_10 [[id(8)]];
    sampler fp_t_tcb_10Smplr [[id(9)]];
    texture2d<float> fp_t_tcb_A [[id(10)]];
    sampler fp_t_tcb_ASmplr [[id(11)]];
    sampler fp_t_tcb_8Smplr_w [[id(12)]];
    sampler fp_t_tcb_ASmplr_w [[id(13)]];
    constant dm_border_t* dm_border [[id(14)]];
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
    bool _118 = false;
    bool _116 = false;
    float _52 = in.m_40.x;
    float _54 = in.m_40.y;
    float2 _887 = float2(_52, _54);
    float _56 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_887, float2(0.0), isnan(_887))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_887, float2(0.0), isnan(_887))).x;
    float _58 = in.m_42.x;
    float _60 = -_56;
    float _62 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _64 = 1.0 / _62;
    float _66 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _68 = _64 * _66;
    float _70 = in.m_42.y;
    float _72 = _68 * _58;
    float _74 = -_68;
    bool _78 = _74 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _80 = -_68;
    bool _82 = _80 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    bool _84 = !_78;
    uint _87 = uint(_84 ? 0 : 1);
    uint _89 = 2u;
    if (!_78)
    {
        _89 = 1u;
    }
    uint _91 = _89;
    uint _93 = _91;
    if (!_82)
    {
        _93 = _87;
    }
    uint _95 = _93;
    uint _97 = min(_95, 2u);
    int _100 = int(_97) << 2;
    uint _102 = uint(int(uint(_100) >> uint(2)));
    uint _104 = uint(int(uint(int(_102)) >> uint(2)));
    int _106 = int(_102) & 3;
    float _108 = (*spvDescriptorSet0.fp_c1)._m0[int(_104)][_106];
    float _110 = _68 * _70;
    bool _112 = as_type<int>(_108) == 368;
    if (!_112)
    {
        bool _114 = as_type<int>(_108) == 640;
        _116 = _114;
        if (!_116)
        {
            _118 = true;
        }
    }
    float _152;
    float _154;
    float _156;
    float _158;
    if (!_116)
    {
        if (!_118)
        {
            float _120 = _110 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _122 = _110 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _124 = _110 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _126 = _110 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _128 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[0].x, _120);
            float _130 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[1].x, _122);
            float _132 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[2].x, _124);
            float _134 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[3].x, _126);
            float _136 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[0].z, _128);
            float _138 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[1].z, _130);
            float _140 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[2].z, _132);
            float _142 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[3].z, _134);
            float _144 = _136 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _146 = _138 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _148 = _140 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _150 = _142 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _152 = _150;
            _154 = _148;
            _156 = _144;
            _158 = _146;
        }
    }
    if ((false || _118) || _116)
    {
        if ((!_118) || _116)
        {
            _116 = false;
            float _160 = _110 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _162 = _110 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _164 = _110 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _166 = _110 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _168 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[4].x, _160);
            float _170 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[5].x, _162);
            float _172 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[6].x, _164);
            float _174 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[7].x, _166);
            float _176 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[4].z, _168);
            float _178 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[5].z, _170);
            float _180 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[6].z, _172);
            float _182 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[7].z, _174);
            float _184 = _176 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _186 = _178 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _188 = _180 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _190 = _182 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _152 = _190;
            _154 = _188;
            _156 = _184;
            _158 = _186;
        }
        if (false || _118)
        {
            _118 = false;
            float _192 = _110 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _194 = _110 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _196 = _110 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _198 = _110 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _200 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[8].x, _192);
            float _202 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[9].x, _194);
            float _204 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[10].x, _196);
            float _206 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[11].x, _198);
            float _208 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[8].z, _200);
            float _210 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[9].z, _202);
            float _212 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[10].z, _204);
            float _214 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[11].z, _206);
            float _216 = _208 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _218 = _210 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _220 = _212 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _222 = _214 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _152 = _222;
            _154 = _220;
            _156 = _216;
            _158 = _218;
        }
    }
    float _224 = _152;
    float _226 = _154;
    float _228 = _156;
    float _230 = _158;
    float _232 = 1.0 / _224;
    float _234 = float(int(_95));
    float _236 = rint(_234);
    float _238 = precise::max(_236, 0.0);
    uint _240 = uint(_238);
    uint _242 = clamp(_240, 0u, 65535u);
    float _244 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _246 = _232 * _226;
    float _248 = precise::clamp(_246, 0.0, 1.0);
    float _250 = _232 * _228;
    float _252 = _232 * _230;
    float _254 = _248 * _244;
    float _256 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _258 = fma(_254, 0.5, _250);
    float _260 = _248 * _256;
    float _262 = fma(_254, 1.5, _250);
    float _264 = fma(_254, -0.5, _250);
    float _266 = fma(_254, -1.5, _250);
    float _268 = fma(_260, 1.5, _252);
    float _270 = fma(_260, 0.5, _252);
    float3 _1333 = float3(_258, _268, float(int(_242)));
    float3 _1337 = select(_1333, float3(0.0), isnan(_1333));
    float _272 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1337.xy, uint(rint(_1337.z)), _248);
    float3 _1346 = float3(_262, _268, float(int(_242)));
    float3 _1348 = select(_1346, float3(0.0), isnan(_1346));
    float _274 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1348.xy, uint(rint(_1348.z)), _248);
    float3 _1357 = float3(_264, _268, float(int(_242)));
    float3 _1359 = select(_1357, float3(0.0), isnan(_1357));
    float _276 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1359.xy, uint(rint(_1359.z)), _248);
    float3 _1368 = float3(_266, _268, float(int(_242)));
    float3 _1370 = select(_1368, float3(0.0), isnan(_1368));
    float _278 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1370.xy, uint(rint(_1370.z)), _248);
    float3 _1379 = float3(_262, _270, float(int(_242)));
    float3 _1381 = select(_1379, float3(0.0), isnan(_1379));
    float _280 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1381.xy, uint(rint(_1381.z)), _248);
    float3 _1390 = float3(_258, _270, float(int(_242)));
    float3 _1392 = select(_1390, float3(0.0), isnan(_1390));
    float _282 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1392.xy, uint(rint(_1392.z)), _248);
    float _284 = _274 + _272;
    float _286 = _284 + _276;
    float _288 = _286 + _278;
    float _290 = _288 + _280;
    float _292 = _290 + _282;
    float _294 = fma(_260, -0.5, _252);
    float3 _1419 = float3(_264, _270, float(int(_242)));
    float3 _1421 = select(_1419, float3(0.0), isnan(_1419));
    float _296 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1421.xy, uint(rint(_1421.z)), _248);
    float3 _1430 = float3(_266, _270, float(int(_242)));
    float3 _1432 = select(_1430, float3(0.0), isnan(_1430));
    float _298 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1432.xy, uint(rint(_1432.z)), _248);
    float3 _1441 = float3(_262, _294, float(int(_242)));
    float3 _1443 = select(_1441, float3(0.0), isnan(_1441));
    float _300 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1443.xy, uint(rint(_1443.z)), _248);
    float3 _1452 = float3(_258, _294, float(int(_242)));
    float3 _1454 = select(_1452, float3(0.0), isnan(_1452));
    float _302 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1454.xy, uint(rint(_1454.z)), _248);
    float3 _1463 = float3(_264, _294, float(int(_242)));
    float3 _1465 = select(_1463, float3(0.0), isnan(_1463));
    float _304 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1465.xy, uint(rint(_1465.z)), _248);
    float3 _1474 = float3(_266, _294, float(int(_242)));
    float3 _1476 = select(_1474, float3(0.0), isnan(_1474));
    float _306 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1476.xy, uint(rint(_1476.z)), _248);
    float _308 = fma(_260, -1.5, _252);
    float _310 = -_110;
    float _312 = _310 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _314 = -_72;
    float _316 = _314 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _318 = _312 * _312;
    float _320 = fma(_316, _316, _318);
    float _322 = -_68;
    float _324 = _322 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _326 = fma(_324, _324, _320);
    float _328 = sqrt(_326);
    bool _330 = _328 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    bool _332 = _328 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    bool _334 = !_330;
    int _336 = _334 ? 0 : 1;
    int _338 = 2;
    if (!_330)
    {
        _338 = 1;
    }
    int _340 = _338;
    int _342 = _340;
    if (!_332)
    {
        _342 = _336;
    }
    int _344 = _342;
    float _346 = _110 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _348 = float(_344);
    float _350 = _110 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _352 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[19].x, _346);
    float _354 = _110 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _356 = precise::min(_348, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _358 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[22].x, _350);
    float _360 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[19].z, _352);
    float _362 = _110 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    bool _364 = _356 != 1.0;
    bool _366 = isnan(_356);
    bool _368 = _364 || _366;
    bool _370 = isnan(1.0);
    bool _372 = _368 || _370;
    float _374 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[22].z, _358);
    float _376 = _360 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float _378 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[23].x, _362);
    float _380 = _110 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    float _382 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[23].z, _378);
    float _384 = _376;
    if (_372)
    {
        float _386 = _374 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _384 = _386;
    }
    float _388 = _384;
    float _390 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[20].x, _354);
    float _392 = _110 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _394 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[20].z, _390);
    float _396 = _394 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _398 = _396;
    float _400 = _388;
    if (_372)
    {
        float _402 = _382 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _398 = _402;
    }
    float _404 = _398;
    float _406 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[24].x, _380);
    float _408 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[21].x, _392);
    float3 _1672 = float3(_262, _308, float(int(_242)));
    float3 _1674 = select(_1672, float3(0.0), isnan(_1672));
    float _410 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1674.xy, uint(rint(_1674.z)), _248);
    float _412 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[24].z, _406);
    float _414 = _110 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _416 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[21].z, _408);
    float _418 = _416 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _420 = _418;
    float _422 = _404;
    if (_372)
    {
        float _424 = _412 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _420 = _424;
    }
    float _426 = _420;
    bool _428 = _356 != 0.0;
    bool _430 = isnan(_356);
    bool _432 = _428 || _430;
    bool _434 = isnan(0.0);
    bool _436 = _432 || _434;
    float _438 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[16].x, _414);
    float _440 = _110 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _442 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[16].z, _438);
    float _444 = _426;
    if (!_436)
    {
        float _446 = _442 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _400 = _446;
    }
    float _448 = _400;
    float _450 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[17].x, _440);
    float _452 = _110 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _454 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[17].z, _450);
    if (!_436)
    {
        float _456 = _454 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _422 = _456;
    }
    float _458 = _422;
    float _460 = _292 + _296;
    float _462 = _460 + _298;
    float _464 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[18].x, _452);
    float _466 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].z;
    float _468 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].w;
    float _470 = _462 + _300;
    float _472 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[18].z, _464);
    float _474 = rint(_356);
    float _476 = precise::max(_474, 0.0);
    uint _478 = uint(_476);
    uint _480 = clamp(_478, 0u, 65535u);
    float _482 = _470 + _302;
    if (!_436)
    {
        float _484 = _472 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _444 = _484;
    }
    float _486 = _444;
    float _488 = _482 + _304;
    float _490 = 0.0 + _486;
    float _492 = precise::clamp(_490, 0.0, 1.0);
    float _494 = _492 * _468;
    float3 _1835 = float3(_258, _308, float(int(_242)));
    float3 _1837 = select(_1835, float3(0.0), isnan(_1835));
    float _496 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1837.xy, uint(rint(_1837.z)), _248);
    float3 _1846 = float3(_264, _308, float(int(_242)));
    float3 _1848 = select(_1846, float3(0.0), isnan(_1846));
    float _498 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1848.xy, uint(rint(_1848.z)), _248);
    float3 _1857 = float3(_266, _308, float(int(_242)));
    float3 _1859 = select(_1857, float3(0.0), isnan(_1857));
    float _500 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1859.xy, uint(rint(_1859.z)), _248);
    float _502 = _492 * _466;
    float _504 = fma(_494, 1.5, _458);
    float _506 = fma(_502, 0.5, _448);
    float _508 = fma(_502, -0.5, _448);
    float3 _1880 = float3(_506, _504, float(int(_480)));
    float3 _1882 = select(_1880, float3(0.0), isnan(_1880));
    float _510 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1882.xy, uint(rint(_1882.z)), _492);
    float3 _1891 = float3(_508, _504, float(int(_480)));
    float3 _1893 = select(_1891, float3(0.0), isnan(_1891));
    float _512 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1893.xy, uint(rint(_1893.z)), _492);
    float _514 = _488 + _306;
    float _516 = fma(_494, 0.5, _458);
    float _518 = fma(_502, -1.5, _448);
    float _520 = _514 + _410;
    float _522 = _520 + _496;
    float _524 = fma(_502, 1.5, _448);
    float _526 = _522 + _498;
    float3 _1923 = float3(_518, _504, float(int(_480)));
    float3 _1925 = select(_1923, float3(0.0), isnan(_1923));
    float _528 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1925.xy, uint(rint(_1925.z)), _492);
    float3 _1934 = float3(_524, _504, float(int(_480)));
    float3 _1936 = select(_1934, float3(0.0), isnan(_1934));
    float _530 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1936.xy, uint(rint(_1936.z)), _492);
    float3 _1945 = float3(_524, _516, float(int(_480)));
    float3 _1947 = select(_1945, float3(0.0), isnan(_1945));
    float _532 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1947.xy, uint(rint(_1947.z)), _492);
    float3 _1956 = float3(_506, _516, float(int(_480)));
    float3 _1958 = select(_1956, float3(0.0), isnan(_1956));
    float _534 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1958.xy, uint(rint(_1958.z)), _492);
    float3 _1967 = float3(_508, _516, float(int(_480)));
    float3 _1969 = select(_1967, float3(0.0), isnan(_1967));
    float _536 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1969.xy, uint(rint(_1969.z)), _492);
    float3 _1978 = float3(_518, _516, float(int(_480)));
    float3 _1980 = select(_1978, float3(0.0), isnan(_1978));
    float _538 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1980.xy, uint(rint(_1980.z)), _492);
    float _540 = _526 + _500;
    float _542 = fma(_494, -0.5, _458);
    float _544 = fma(_494, -1.5, _458);
    float3 _1998 = float3(_524, _542, float(int(_480)));
    float3 _2000 = select(_1998, float3(0.0), isnan(_1998));
    float _546 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2000.xy, uint(rint(_2000.z)), _492);
    float _548 = _530 + _510;
    float _550 = _548 + _512;
    float _552 = _550 + _528;
    float _554 = _552 + _532;
    float _556 = _554 + _534;
    float _558 = _556 + _536;
    float3 _2027 = float3(_506, _542, float(int(_480)));
    float3 _2029 = select(_2027, float3(0.0), isnan(_2027));
    float _560 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2029.xy, uint(rint(_2029.z)), _492);
    float3 _2038 = float3(_508, _542, float(int(_480)));
    float3 _2040 = select(_2038, float3(0.0), isnan(_2038));
    float _562 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2040.xy, uint(rint(_2040.z)), _492);
    float3 _2049 = float3(_518, _542, float(int(_480)));
    float3 _2051 = select(_2049, float3(0.0), isnan(_2049));
    float _564 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2051.xy, uint(rint(_2051.z)), _492);
    float3 _2060 = float3(_524, _544, float(int(_480)));
    float3 _2062 = select(_2060, float3(0.0), isnan(_2060));
    float _566 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2062.xy, uint(rint(_2062.z)), _492);
    float3 _2071 = float3(_506, _544, float(int(_480)));
    float3 _2073 = select(_2071, float3(0.0), isnan(_2071));
    float _568 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2073.xy, uint(rint(_2073.z)), _492);
    float _570 = _110 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _572 = _558 + _538;
    float _574 = _110 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _576 = _110 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _578 = _110 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _580 = _110 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _582 = _572 + _546;
    float _584 = _110 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _586 = -_110;
    float _588 = _586 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _590 = _110 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _592 = _110 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _594 = _110 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _596 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[29].x, _570);
    float _598 = -_72;
    float _600 = _598 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _602 = _588 * _588;
    float _604 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[28].x, _574);
    float _606 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[25].x, _576);
    float _608 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[26].x, _578);
    float _610 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[27].x, _580);
    float _612 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[30].x, _594);
    float _614 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[31].x, _590);
    float _616 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[32].x, _584);
    float _618 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[33].x, _592);
    float _620 = fma(_600, _600, _602);
    float _622 = -_68;
    float _624 = _622 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _626 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[28].z, _604);
    float _628 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[29].z, _596);
    float _630 = fma(_624, _624, _620);
    float _632 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[30].z, _612);
    float _634 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[31].z, _614);
    float _636 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[32].z, _616);
    float _638 = _628 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    float _640 = _632 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _642 = sqrt(_630);
    float _644 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[25].z, _606);
    float _646 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[27].z, _610);
    float _648 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[26].z, _608);
    bool _650 = _642 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    bool _652 = _642 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    bool _654 = !_650;
    int _656 = _654 ? 0 : 1;
    int _658 = 2;
    float _660 = _638;
    float _662 = _640;
    if (!_650)
    {
        _658 = 1;
    }
    int _664 = _658;
    int _666 = _664;
    if (!_652)
    {
        _666 = _656;
    }
    int _668 = _666;
    float _670 = float(_668);
    float _672 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[33].z, _618);
    float _674 = _626 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _676 = precise::min(_670, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    bool _678 = _676 != 1.0;
    bool _680 = isnan(_676);
    bool _682 = _678 || _680;
    bool _684 = isnan(1.0);
    bool _686 = _682 || _684;
    float _688 = _674;
    if (_686)
    {
        float _690 = _634 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _688 = _690;
    }
    float _692 = _688;
    float _694 = _692;
    if (_686)
    {
        float _696 = _636 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _660 = _696;
    }
    float _698 = _660;
    float _700 = _698;
    if (_686)
    {
        float _702 = _672 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _662 = _702;
    }
    float _704 = _662;
    bool _706 = _676 != 0.0;
    bool _708 = isnan(_676);
    bool _710 = _706 || _708;
    bool _712 = isnan(0.0);
    bool _714 = _710 || _712;
    float _716 = _704;
    if (!_714)
    {
        float _718 = _644 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _694 = _718;
    }
    float _720 = _694;
    if (!_714)
    {
        float _722 = _646 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _716 = _722;
    }
    float _724 = _716;
    float _726 = rint(_676);
    float _728 = precise::max(_726, 0.0);
    uint _730 = uint(_728);
    uint _732 = clamp(_730, 0u, 65535u);
    if (!_714)
    {
        float _734 = _648 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _700 = _734;
    }
    float _736 = _700;
    float _738 = 0.0 + _724;
    float _740 = precise::clamp(_738, 0.0, 1.0);
    float _742 = _466 * _740;
    float _744 = _468 * _740;
    float _746 = fma(_742, 0.5, _720);
    float _748 = fma(_744, 1.5, _736);
    float _750 = fma(_742, 1.5, _720);
    float _752 = fma(_744, 0.5, _736);
    float _754 = _582 + _560;
    float _756 = _754 + _562;
    float _758 = _756 + _564;
    float3 _2421 = float3(_508, _544, float(int(_480)));
    float3 _2423 = select(_2421, float3(0.0), isnan(_2421));
    float _760 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2423.xy, uint(rint(_2423.z)), _492);
    float3 _2432 = float3(_518, _544, float(int(_480)));
    float3 _2434 = select(_2432, float3(0.0), isnan(_2432));
    float _762 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2434.xy, uint(rint(_2434.z)), _492);
    float3 _2443 = float3(_746, _748, float(int(_732)));
    float3 _2445 = select(_2443, float3(0.0), isnan(_2443));
    float _764 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2445.xy, uint(rint(_2445.z)), _740);
    float3 _2454 = float3(_750, _748, float(int(_732)));
    float3 _2456 = select(_2454, float3(0.0), isnan(_2454));
    float _766 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2456.xy, uint(rint(_2456.z)), _740);
    float3 _2465 = float3(_746, _752, float(int(_732)));
    float3 _2467 = select(_2465, float3(0.0), isnan(_2465));
    float _768 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2467.xy, uint(rint(_2467.z)), _740);
    float _770 = fma(_742, -0.5, _720);
    float _772 = fma(_742, -1.5, _720);
    float3 _2482 = float3(_770, _748, float(int(_732)));
    float3 _2484 = select(_2482, float3(0.0), isnan(_2482));
    float _774 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2484.xy, uint(rint(_2484.z)), _740);
    float3 _2493 = float3(_772, _748, float(int(_732)));
    float3 _2495 = select(_2493, float3(0.0), isnan(_2493));
    float _776 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2495.xy, uint(rint(_2495.z)), _740);
    float3 _2504 = float3(_750, _752, float(int(_732)));
    float3 _2506 = select(_2504, float3(0.0), isnan(_2504));
    float _778 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2506.xy, uint(rint(_2506.z)), _740);
    float3 _2515 = float3(_770, _752, float(int(_732)));
    float3 _2517 = select(_2515, float3(0.0), isnan(_2515));
    float _780 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2517.xy, uint(rint(_2517.z)), _740);
    float3 _2526 = float3(_772, _752, float(int(_732)));
    float3 _2528 = select(_2526, float3(0.0), isnan(_2526));
    float _782 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2528.xy, uint(rint(_2528.z)), _740);
    float _784 = fma(_744, -1.5, _736);
    float _786 = fma(_744, -0.5, _736);
    float3 _2543 = float3(_746, _786, float(int(_732)));
    float3 _2545 = select(_2543, float3(0.0), isnan(_2543));
    float _788 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2545.xy, uint(rint(_2545.z)), _740);
    float3 _2554 = float3(_770, _786, float(int(_732)));
    float3 _2556 = select(_2554, float3(0.0), isnan(_2554));
    float _790 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2556.xy, uint(rint(_2556.z)), _740);
    float3 _2565 = float3(_750, _786, float(int(_732)));
    float3 _2567 = select(_2565, float3(0.0), isnan(_2565));
    float _792 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2567.xy, uint(rint(_2567.z)), _740);
    float3 _2576 = float3(_772, _786, float(int(_732)));
    float3 _2578 = select(_2576, float3(0.0), isnan(_2576));
    float _794 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2578.xy, uint(rint(_2578.z)), _740);
    float3 _2587 = float3(_750, _784, float(int(_732)));
    float3 _2589 = select(_2587, float3(0.0), isnan(_2587));
    float _796 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2589.xy, uint(rint(_2589.z)), _740);
    float3 _2598 = float3(_746, _784, float(int(_732)));
    float3 _2600 = select(_2598, float3(0.0), isnan(_2598));
    float _798 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2600.xy, uint(rint(_2600.z)), _740);
    float3 _2609 = float3(_770, _784, float(int(_732)));
    float3 _2611 = select(_2609, float3(0.0), isnan(_2609));
    float _800 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2611.xy, uint(rint(_2611.z)), _740);
    float3 _2620 = float3(_772, _784, float(int(_732)));
    float3 _2622 = select(_2620, float3(0.0), isnan(_2620));
    float _802 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2622.xy, uint(rint(_2622.z)), _740);
    float2 _2628 = float2(_52, _54);
    float _804 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_2628, float2(0.0), isnan(_2628))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_2628, float2(0.0), isnan(_2628))).x;
    float _806 = _758 + _566;
    float _808 = -_68;
    float _810 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _812 = _808 + _810;
    float _814 = -_68;
    float _816 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _818 = _814 + _816;
    float _820 = _806 + _568;
    float _822 = _812 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _824 = precise::clamp(_822, 0.0, 1.0);
    float _826 = fma(_540, 0.0625, _824);
    float _828 = _820 + _760;
    float _830 = _766 + _764;
    float _832 = _828 + _762;
    float _834 = _830 + _774;
    float _836 = _834 + _776;
    float _838 = _836 + _778;
    float _840 = _838 + _768;
    float _842 = _840 + _780;
    float _844 = _842 + _782;
    float _846 = _844 + _792;
    float _848 = _846 + _788;
    float _850 = _848 + _790;
    float _852 = _850 + _794;
    float _854 = _852 + _796;
    float _856 = _854 + _798;
    float _858 = _856 + _800;
    float _860 = _858 + _802;
    float _862 = _860 * 0.0625;
    float _864 = _832 * 0.0625;
    float _866 = _862 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _868 = fma(_864, (*spvDescriptorSet0.fp_c3)._m0[49].z, _866);
    float _870 = _818 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _872 = precise::clamp(_870, 0.0, 1.0);
    float _874 = _868 + _872;
    out.m_45.x = _804;
    out.m_45.y = _826;
    out.m_45.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_45.w = _874;
    return out;
}

