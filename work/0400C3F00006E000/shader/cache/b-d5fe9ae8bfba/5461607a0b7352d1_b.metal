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
    bool _124 = false;
    bool _122 = false;
    float _52 = in.m_40.x;
    float _54 = in.m_40.y;
    float2 _893 = float2(_52, _54);
    float _56 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_893, float2(0.0), isnan(_893))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_893, float2(0.0), isnan(_893))).x;
    float _58 = in.m_42.x;
    float _60 = -_56;
    float _62 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _64 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[46].z, _62);
    float _66 = _64 * _58;
    float _68 = -_64;
    bool _72 = _68 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _74 = -_64;
    bool _76 = _74 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    float _78 = -_64;
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
    uint _102 = min(_100, 2u);
    int _104 = int(_102) << 2;
    float _106 = in.m_42.y;
    uint _108 = uint(int(uint(_104) >> uint(2)));
    uint _110 = uint(int(uint(int(_108)) >> uint(2)));
    int _112 = int(_108) & 3;
    float _114 = (*spvDescriptorSet0.fp_c1)._m0[int(_110)][_112];
    float _116 = _64 * _106;
    bool _118 = as_type<int>(_114) == 384;
    if (!_118)
    {
        bool _120 = as_type<int>(_114) == 656;
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
            float _126 = _116 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _128 = _116 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _130 = _116 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _132 = _116 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _134 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[0].x, _126);
            float _136 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[1].x, _128);
            float _138 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[2].x, _130);
            float _140 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[3].x, _132);
            float _142 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[0].z, _134);
            float _144 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[1].z, _136);
            float _146 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[2].z, _138);
            float _148 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[3].z, _140);
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
            float _166 = _116 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _168 = _116 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _170 = _116 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _172 = _116 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _174 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[4].x, _166);
            float _176 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[5].x, _168);
            float _178 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[6].x, _170);
            float _180 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[7].x, _172);
            float _182 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[4].z, _174);
            float _184 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[5].z, _176);
            float _186 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[6].z, _178);
            float _188 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[7].z, _180);
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
            float _198 = _116 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _200 = _116 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _202 = _116 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _204 = _116 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _206 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[8].x, _198);
            float _208 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[9].x, _200);
            float _210 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[10].x, _202);
            float _212 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[11].x, _204);
            float _214 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[8].z, _206);
            float _216 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[9].z, _208);
            float _218 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[10].z, _210);
            float _220 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[11].z, _212);
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
    float _240 = float(int(_100));
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
    float3 _1351 = float3(_264, _274, float(int(_248)));
    float3 _1355 = select(_1351, float3(0.0), isnan(_1351));
    float _278 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1355.xy, uint(rint(_1355.z)), _254);
    float3 _1364 = float3(_268, _274, float(int(_248)));
    float3 _1366 = select(_1364, float3(0.0), isnan(_1364));
    float _280 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1366.xy, uint(rint(_1366.z)), _254);
    float3 _1375 = float3(_270, _274, float(int(_248)));
    float3 _1377 = select(_1375, float3(0.0), isnan(_1375));
    float _282 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1377.xy, uint(rint(_1377.z)), _254);
    float3 _1386 = float3(_272, _274, float(int(_248)));
    float3 _1388 = select(_1386, float3(0.0), isnan(_1386));
    float _284 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1388.xy, uint(rint(_1388.z)), _254);
    float3 _1397 = float3(_268, _276, float(int(_248)));
    float3 _1399 = select(_1397, float3(0.0), isnan(_1397));
    float _286 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1399.xy, uint(rint(_1399.z)), _254);
    float3 _1408 = float3(_264, _276, float(int(_248)));
    float3 _1410 = select(_1408, float3(0.0), isnan(_1408));
    float _288 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1410.xy, uint(rint(_1410.z)), _254);
    float _290 = _280 + _278;
    float _292 = _290 + _282;
    float _294 = _292 + _284;
    float _296 = _294 + _286;
    float _298 = _296 + _288;
    float _300 = fma(_266, -0.5, _258);
    float3 _1437 = float3(_270, _276, float(int(_248)));
    float3 _1439 = select(_1437, float3(0.0), isnan(_1437));
    float _302 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1439.xy, uint(rint(_1439.z)), _254);
    float3 _1448 = float3(_272, _276, float(int(_248)));
    float3 _1450 = select(_1448, float3(0.0), isnan(_1448));
    float _304 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1450.xy, uint(rint(_1450.z)), _254);
    float3 _1459 = float3(_268, _300, float(int(_248)));
    float3 _1461 = select(_1459, float3(0.0), isnan(_1459));
    float _306 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1461.xy, uint(rint(_1461.z)), _254);
    float3 _1470 = float3(_264, _300, float(int(_248)));
    float3 _1472 = select(_1470, float3(0.0), isnan(_1470));
    float _308 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1472.xy, uint(rint(_1472.z)), _254);
    float3 _1481 = float3(_270, _300, float(int(_248)));
    float3 _1483 = select(_1481, float3(0.0), isnan(_1481));
    float _310 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1483.xy, uint(rint(_1483.z)), _254);
    float3 _1492 = float3(_272, _300, float(int(_248)));
    float3 _1494 = select(_1492, float3(0.0), isnan(_1492));
    float _312 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1494.xy, uint(rint(_1494.z)), _254);
    float _314 = fma(_266, -1.5, _258);
    float _316 = -_116;
    float _318 = _316 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _320 = -_66;
    float _322 = _320 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _324 = _318 * _318;
    float _326 = fma(_322, _322, _324);
    float _328 = -_64;
    float _330 = _328 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _332 = fma(_330, _330, _326);
    float _334 = sqrt(_332);
    bool _336 = _334 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    bool _338 = _334 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    bool _340 = !_336;
    int _342 = _340 ? 0 : 1;
    int _344 = 2;
    if (!_336)
    {
        _344 = 1;
    }
    int _346 = _344;
    int _348 = _346;
    if (!_338)
    {
        _348 = _342;
    }
    int _350 = _348;
    float _352 = _116 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _354 = float(_350);
    float _356 = _116 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _358 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[19].x, _352);
    float _360 = _116 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _362 = precise::min(_354, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _364 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[22].x, _356);
    float _366 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[19].z, _358);
    float _368 = _116 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    bool _370 = _362 != 1.0;
    bool _372 = isnan(_362);
    bool _374 = _370 || _372;
    bool _376 = isnan(1.0);
    bool _378 = _374 || _376;
    float _380 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[22].z, _364);
    float _382 = _366 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float _384 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[23].x, _368);
    float _386 = _116 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    float _388 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[23].z, _384);
    float _390 = _382;
    if (_378)
    {
        float _392 = _380 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _390 = _392;
    }
    float _394 = _390;
    float _396 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[20].x, _360);
    float _398 = _116 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _400 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[20].z, _396);
    float _402 = _400 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _404 = _402;
    float _406 = _394;
    if (_378)
    {
        float _408 = _388 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _404 = _408;
    }
    float _410 = _404;
    float _412 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[24].x, _386);
    float _414 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[21].x, _398);
    float3 _1690 = float3(_268, _314, float(int(_248)));
    float3 _1692 = select(_1690, float3(0.0), isnan(_1690));
    float _416 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1692.xy, uint(rint(_1692.z)), _254);
    float _418 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[24].z, _412);
    float _420 = _116 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _422 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[21].z, _414);
    float _424 = _422 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _426 = _424;
    float _428 = _410;
    if (_378)
    {
        float _430 = _418 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _426 = _430;
    }
    float _432 = _426;
    bool _434 = _362 != 0.0;
    bool _436 = isnan(_362);
    bool _438 = _434 || _436;
    bool _440 = isnan(0.0);
    bool _442 = _438 || _440;
    float _444 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[16].x, _420);
    float _446 = _116 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _448 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[16].z, _444);
    float _450 = _432;
    if (!_442)
    {
        float _452 = _448 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _406 = _452;
    }
    float _454 = _406;
    float _456 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[17].x, _446);
    float _458 = _116 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _460 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[17].z, _456);
    if (!_442)
    {
        float _462 = _460 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _428 = _462;
    }
    float _464 = _428;
    float _466 = _298 + _302;
    float _468 = _466 + _304;
    float _470 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[18].x, _458);
    float _472 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].z;
    float _474 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].w;
    float _476 = _468 + _306;
    float _478 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[18].z, _470);
    float _480 = rint(_362);
    float _482 = precise::max(_480, 0.0);
    uint _484 = uint(_482);
    uint _486 = clamp(_484, 0u, 65535u);
    float _488 = _476 + _308;
    if (!_442)
    {
        float _490 = _478 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _450 = _490;
    }
    float _492 = _450;
    float _494 = _488 + _310;
    float _496 = 0.0 + _492;
    float _498 = precise::clamp(_496, 0.0, 1.0);
    float _500 = _498 * _474;
    float3 _1853 = float3(_264, _314, float(int(_248)));
    float3 _1855 = select(_1853, float3(0.0), isnan(_1853));
    float _502 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1855.xy, uint(rint(_1855.z)), _254);
    float3 _1864 = float3(_270, _314, float(int(_248)));
    float3 _1866 = select(_1864, float3(0.0), isnan(_1864));
    float _504 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1866.xy, uint(rint(_1866.z)), _254);
    float3 _1875 = float3(_272, _314, float(int(_248)));
    float3 _1877 = select(_1875, float3(0.0), isnan(_1875));
    float _506 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1877.xy, uint(rint(_1877.z)), _254);
    float _508 = _498 * _472;
    float _510 = fma(_500, 1.5, _464);
    float _512 = fma(_508, 0.5, _454);
    float _514 = fma(_508, -0.5, _454);
    float3 _1898 = float3(_512, _510, float(int(_486)));
    float3 _1900 = select(_1898, float3(0.0), isnan(_1898));
    float _516 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1900.xy, uint(rint(_1900.z)), _498);
    float3 _1909 = float3(_514, _510, float(int(_486)));
    float3 _1911 = select(_1909, float3(0.0), isnan(_1909));
    float _518 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1911.xy, uint(rint(_1911.z)), _498);
    float _520 = _494 + _312;
    float _522 = fma(_500, 0.5, _464);
    float _524 = fma(_508, -1.5, _454);
    float _526 = _520 + _416;
    float _528 = _526 + _502;
    float _530 = fma(_508, 1.5, _454);
    float _532 = _528 + _504;
    float3 _1941 = float3(_524, _510, float(int(_486)));
    float3 _1943 = select(_1941, float3(0.0), isnan(_1941));
    float _534 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1943.xy, uint(rint(_1943.z)), _498);
    float3 _1952 = float3(_530, _510, float(int(_486)));
    float3 _1954 = select(_1952, float3(0.0), isnan(_1952));
    float _536 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1954.xy, uint(rint(_1954.z)), _498);
    float3 _1963 = float3(_530, _522, float(int(_486)));
    float3 _1965 = select(_1963, float3(0.0), isnan(_1963));
    float _538 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1965.xy, uint(rint(_1965.z)), _498);
    float3 _1974 = float3(_512, _522, float(int(_486)));
    float3 _1976 = select(_1974, float3(0.0), isnan(_1974));
    float _540 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1976.xy, uint(rint(_1976.z)), _498);
    float3 _1985 = float3(_514, _522, float(int(_486)));
    float3 _1987 = select(_1985, float3(0.0), isnan(_1985));
    float _542 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1987.xy, uint(rint(_1987.z)), _498);
    float3 _1996 = float3(_524, _522, float(int(_486)));
    float3 _1998 = select(_1996, float3(0.0), isnan(_1996));
    float _544 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1998.xy, uint(rint(_1998.z)), _498);
    float _546 = _532 + _506;
    float _548 = fma(_500, -0.5, _464);
    float _550 = fma(_500, -1.5, _464);
    float3 _2016 = float3(_530, _548, float(int(_486)));
    float3 _2018 = select(_2016, float3(0.0), isnan(_2016));
    float _552 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2018.xy, uint(rint(_2018.z)), _498);
    float _554 = _536 + _516;
    float _556 = _554 + _518;
    float _558 = _556 + _534;
    float _560 = _558 + _538;
    float _562 = _560 + _540;
    float _564 = _562 + _542;
    float3 _2045 = float3(_512, _548, float(int(_486)));
    float3 _2047 = select(_2045, float3(0.0), isnan(_2045));
    float _566 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2047.xy, uint(rint(_2047.z)), _498);
    float3 _2056 = float3(_514, _548, float(int(_486)));
    float3 _2058 = select(_2056, float3(0.0), isnan(_2056));
    float _568 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2058.xy, uint(rint(_2058.z)), _498);
    float3 _2067 = float3(_524, _548, float(int(_486)));
    float3 _2069 = select(_2067, float3(0.0), isnan(_2067));
    float _570 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2069.xy, uint(rint(_2069.z)), _498);
    float3 _2078 = float3(_530, _550, float(int(_486)));
    float3 _2080 = select(_2078, float3(0.0), isnan(_2078));
    float _572 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2080.xy, uint(rint(_2080.z)), _498);
    float3 _2089 = float3(_512, _550, float(int(_486)));
    float3 _2091 = select(_2089, float3(0.0), isnan(_2089));
    float _574 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2091.xy, uint(rint(_2091.z)), _498);
    float _576 = _116 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _578 = _564 + _544;
    float _580 = _116 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _582 = _116 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _584 = _116 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _586 = _116 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _588 = _578 + _552;
    float _590 = _116 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _592 = -_116;
    float _594 = _592 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _596 = _116 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _598 = _116 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _600 = _116 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _602 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[29].x, _576);
    float _604 = -_66;
    float _606 = _604 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _608 = _594 * _594;
    float _610 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[28].x, _580);
    float _612 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[25].x, _582);
    float _614 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[26].x, _584);
    float _616 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[27].x, _586);
    float _618 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[30].x, _600);
    float _620 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[31].x, _596);
    float _622 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[32].x, _590);
    float _624 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[33].x, _598);
    float _626 = fma(_606, _606, _608);
    float _628 = -_64;
    float _630 = _628 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _632 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[28].z, _610);
    float _634 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[29].z, _602);
    float _636 = fma(_630, _630, _626);
    float _638 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[30].z, _618);
    float _640 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[31].z, _620);
    float _642 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[32].z, _622);
    float _644 = _634 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    float _646 = _638 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _648 = sqrt(_636);
    float _650 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[25].z, _612);
    float _652 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[27].z, _616);
    float _654 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[26].z, _614);
    bool _656 = _648 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    bool _658 = _648 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    bool _660 = !_656;
    int _662 = _660 ? 0 : 1;
    int _664 = 2;
    float _666 = _644;
    float _668 = _646;
    if (!_656)
    {
        _664 = 1;
    }
    int _670 = _664;
    int _672 = _670;
    if (!_658)
    {
        _672 = _662;
    }
    int _674 = _672;
    float _676 = float(_674);
    float _678 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[33].z, _624);
    float _680 = _632 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _682 = precise::min(_676, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    bool _684 = _682 != 1.0;
    bool _686 = isnan(_682);
    bool _688 = _684 || _686;
    bool _690 = isnan(1.0);
    bool _692 = _688 || _690;
    float _694 = _680;
    if (_692)
    {
        float _696 = _640 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _694 = _696;
    }
    float _698 = _694;
    float _700 = _698;
    if (_692)
    {
        float _702 = _642 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _666 = _702;
    }
    float _704 = _666;
    float _706 = _704;
    if (_692)
    {
        float _708 = _678 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _668 = _708;
    }
    float _710 = _668;
    bool _712 = _682 != 0.0;
    bool _714 = isnan(_682);
    bool _716 = _712 || _714;
    bool _718 = isnan(0.0);
    bool _720 = _716 || _718;
    float _722 = _710;
    if (!_720)
    {
        float _724 = _650 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _700 = _724;
    }
    float _726 = _700;
    if (!_720)
    {
        float _728 = _652 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _722 = _728;
    }
    float _730 = _722;
    float _732 = rint(_682);
    float _734 = precise::max(_732, 0.0);
    uint _736 = uint(_734);
    uint _738 = clamp(_736, 0u, 65535u);
    if (!_720)
    {
        float _740 = _654 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _706 = _740;
    }
    float _742 = _706;
    float _744 = 0.0 + _730;
    float _746 = precise::clamp(_744, 0.0, 1.0);
    float _748 = _472 * _746;
    float _750 = _474 * _746;
    float _752 = fma(_748, 0.5, _726);
    float _754 = fma(_750, 1.5, _742);
    float _756 = fma(_748, 1.5, _726);
    float _758 = fma(_750, 0.5, _742);
    float _760 = _588 + _566;
    float _762 = _760 + _568;
    float _764 = _762 + _570;
    float3 _2439 = float3(_514, _550, float(int(_486)));
    float3 _2441 = select(_2439, float3(0.0), isnan(_2439));
    float _766 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2441.xy, uint(rint(_2441.z)), _498);
    float3 _2450 = float3(_524, _550, float(int(_486)));
    float3 _2452 = select(_2450, float3(0.0), isnan(_2450));
    float _768 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2452.xy, uint(rint(_2452.z)), _498);
    float3 _2461 = float3(_752, _754, float(int(_738)));
    float3 _2463 = select(_2461, float3(0.0), isnan(_2461));
    float _770 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2463.xy, uint(rint(_2463.z)), _746);
    float3 _2472 = float3(_756, _754, float(int(_738)));
    float3 _2474 = select(_2472, float3(0.0), isnan(_2472));
    float _772 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2474.xy, uint(rint(_2474.z)), _746);
    float3 _2483 = float3(_752, _758, float(int(_738)));
    float3 _2485 = select(_2483, float3(0.0), isnan(_2483));
    float _774 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2485.xy, uint(rint(_2485.z)), _746);
    float _776 = fma(_748, -0.5, _726);
    float _778 = fma(_748, -1.5, _726);
    float3 _2500 = float3(_776, _754, float(int(_738)));
    float3 _2502 = select(_2500, float3(0.0), isnan(_2500));
    float _780 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2502.xy, uint(rint(_2502.z)), _746);
    float3 _2511 = float3(_778, _754, float(int(_738)));
    float3 _2513 = select(_2511, float3(0.0), isnan(_2511));
    float _782 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2513.xy, uint(rint(_2513.z)), _746);
    float3 _2522 = float3(_756, _758, float(int(_738)));
    float3 _2524 = select(_2522, float3(0.0), isnan(_2522));
    float _784 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2524.xy, uint(rint(_2524.z)), _746);
    float3 _2533 = float3(_776, _758, float(int(_738)));
    float3 _2535 = select(_2533, float3(0.0), isnan(_2533));
    float _786 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2535.xy, uint(rint(_2535.z)), _746);
    float3 _2544 = float3(_778, _758, float(int(_738)));
    float3 _2546 = select(_2544, float3(0.0), isnan(_2544));
    float _788 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2546.xy, uint(rint(_2546.z)), _746);
    float _790 = fma(_750, -1.5, _742);
    float _792 = fma(_750, -0.5, _742);
    float3 _2561 = float3(_752, _792, float(int(_738)));
    float3 _2563 = select(_2561, float3(0.0), isnan(_2561));
    float _794 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2563.xy, uint(rint(_2563.z)), _746);
    float3 _2572 = float3(_776, _792, float(int(_738)));
    float3 _2574 = select(_2572, float3(0.0), isnan(_2572));
    float _796 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2574.xy, uint(rint(_2574.z)), _746);
    float3 _2583 = float3(_756, _792, float(int(_738)));
    float3 _2585 = select(_2583, float3(0.0), isnan(_2583));
    float _798 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2585.xy, uint(rint(_2585.z)), _746);
    float3 _2594 = float3(_778, _792, float(int(_738)));
    float3 _2596 = select(_2594, float3(0.0), isnan(_2594));
    float _800 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2596.xy, uint(rint(_2596.z)), _746);
    float3 _2605 = float3(_756, _790, float(int(_738)));
    float3 _2607 = select(_2605, float3(0.0), isnan(_2605));
    float _802 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2607.xy, uint(rint(_2607.z)), _746);
    float3 _2616 = float3(_752, _790, float(int(_738)));
    float3 _2618 = select(_2616, float3(0.0), isnan(_2616));
    float _804 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2618.xy, uint(rint(_2618.z)), _746);
    float3 _2627 = float3(_776, _790, float(int(_738)));
    float3 _2629 = select(_2627, float3(0.0), isnan(_2627));
    float _806 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2629.xy, uint(rint(_2629.z)), _746);
    float3 _2638 = float3(_778, _790, float(int(_738)));
    float3 _2640 = select(_2638, float3(0.0), isnan(_2638));
    float _808 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2640.xy, uint(rint(_2640.z)), _746);
    float2 _2646 = float2(_52, _54);
    float _810 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_2646, float2(0.0), isnan(_2646))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_2646, float2(0.0), isnan(_2646))).x;
    float _812 = _764 + _572;
    float _814 = -_64;
    float _816 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _818 = _814 + _816;
    float _820 = -_64;
    float _822 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _824 = _820 + _822;
    float _826 = _812 + _574;
    float _828 = _818 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _830 = precise::clamp(_828, 0.0, 1.0);
    float _832 = fma(_546, 0.0625, _830);
    float _834 = _826 + _766;
    float _836 = _772 + _770;
    float _838 = _834 + _768;
    float _840 = _836 + _780;
    float _842 = _840 + _782;
    float _844 = _842 + _784;
    float _846 = _844 + _774;
    float _848 = _846 + _786;
    float _850 = _848 + _788;
    float _852 = _850 + _798;
    float _854 = _852 + _794;
    float _856 = _854 + _796;
    float _858 = _856 + _800;
    float _860 = _858 + _802;
    float _862 = _860 + _804;
    float _864 = _862 + _806;
    float _866 = _864 + _808;
    float _868 = _866 * 0.0625;
    float _870 = _838 * 0.0625;
    float _872 = _868 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _874 = fma(_870, (*spvDescriptorSet0.fp_c3)._m0[49].z, _872);
    float _876 = _824 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _878 = precise::clamp(_876, 0.0, 1.0);
    float _880 = _874 + _878;
    out.m_45.x = _810;
    out.m_45.y = _832;
    out.m_45.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_45.w = _880;
    return out;
}

