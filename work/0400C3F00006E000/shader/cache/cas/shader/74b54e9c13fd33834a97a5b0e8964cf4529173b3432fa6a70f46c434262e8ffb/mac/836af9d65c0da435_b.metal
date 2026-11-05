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
    bool _128 = false;
    bool _126 = false;
    float _52 = in.m_40.x;
    float _54 = in.m_40.y;
    float2 _897 = float2(_52, _54);
    float _56 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_897, float2(0.0), isnan(_897))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_897, float2(0.0), isnan(_897))).x;
    float _58 = in.m_42.x;
    float _60 = -_56;
    float _62 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _64 = 1.0 / _62;
    float _66 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _68 = _64 * _66;
    float _70 = _68 * _58;
    float _72 = -_68;
    bool _76 = _72 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _78 = -_68;
    bool _80 = _78 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    float _82 = -_68;
    bool _84 = _82 > (*spvDescriptorSet0.fp_c3)._m0[41].x;
    bool _86 = !_76;
    int _89 = _86 ? 0 : 1;
    int _91 = 2;
    if (!_76)
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
    float _110 = in.m_42.y;
    uint _112 = uint(int(uint(_108) >> uint(2)));
    uint _114 = uint(int(uint(int(_112)) >> uint(2)));
    int _116 = int(_112) & 3;
    float _118 = (*spvDescriptorSet0.fp_c1)._m0[int(_114)][_116];
    float _120 = _68 * _110;
    bool _122 = as_type<int>(_118) == 416;
    if (!_122)
    {
        bool _124 = as_type<int>(_118) == 688;
        _126 = _124;
        if (!_126)
        {
            _128 = true;
        }
    }
    float _162;
    float _164;
    float _166;
    float _168;
    if (!_126)
    {
        if (!_128)
        {
            float _130 = _120 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _132 = _120 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _134 = _120 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _136 = _120 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _138 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[0].x, _130);
            float _140 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[1].x, _132);
            float _142 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[2].x, _134);
            float _144 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[3].x, _136);
            float _146 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[0].z, _138);
            float _148 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[1].z, _140);
            float _150 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[2].z, _142);
            float _152 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[3].z, _144);
            float _154 = _146 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _156 = _148 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _158 = _150 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _160 = _152 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _162 = _160;
            _164 = _158;
            _166 = _154;
            _168 = _156;
        }
    }
    if ((false || _128) || _126)
    {
        if ((!_128) || _126)
        {
            _126 = false;
            float _170 = _120 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _172 = _120 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _174 = _120 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _176 = _120 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _178 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[4].x, _170);
            float _180 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[5].x, _172);
            float _182 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[6].x, _174);
            float _184 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[7].x, _176);
            float _186 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[4].z, _178);
            float _188 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[5].z, _180);
            float _190 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[6].z, _182);
            float _192 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[7].z, _184);
            float _194 = _186 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _196 = _188 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _198 = _190 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _200 = _192 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _162 = _200;
            _164 = _198;
            _166 = _194;
            _168 = _196;
        }
        if (false || _128)
        {
            _128 = false;
            float _202 = _120 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _204 = _120 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _206 = _120 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _208 = _120 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _210 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[8].x, _202);
            float _212 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[9].x, _204);
            float _214 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[10].x, _206);
            float _216 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[11].x, _208);
            float _218 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[8].z, _210);
            float _220 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[9].z, _212);
            float _222 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[10].z, _214);
            float _224 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[11].z, _216);
            float _226 = _218 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _228 = _220 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _230 = _222 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _232 = _224 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _162 = _232;
            _164 = _230;
            _166 = _226;
            _168 = _228;
        }
    }
    float _234 = _162;
    float _236 = _164;
    float _238 = _166;
    float _240 = _168;
    float _242 = 1.0 / _234;
    float _244 = float(int(_104));
    float _246 = rint(_244);
    float _248 = precise::max(_246, 0.0);
    uint _250 = uint(_248);
    uint _252 = clamp(_250, 0u, 65535u);
    float _254 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _256 = _242 * _236;
    float _258 = precise::clamp(_256, 0.0, 1.0);
    float _260 = _242 * _238;
    float _262 = _242 * _240;
    float _264 = _258 * _254;
    float _266 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _268 = fma(_264, 0.5, _260);
    float _270 = _258 * _266;
    float _272 = fma(_264, 1.5, _260);
    float _274 = fma(_264, -0.5, _260);
    float _276 = fma(_264, -1.5, _260);
    float _278 = fma(_270, 1.5, _262);
    float _280 = fma(_270, 0.5, _262);
    float3 _1359 = float3(_268, _278, float(int(_252)));
    float3 _1363 = select(_1359, float3(0.0), isnan(_1359));
    float _282 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1363.xy, uint(rint(_1363.z)), _258);
    float3 _1372 = float3(_272, _278, float(int(_252)));
    float3 _1374 = select(_1372, float3(0.0), isnan(_1372));
    float _284 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1374.xy, uint(rint(_1374.z)), _258);
    float3 _1383 = float3(_274, _278, float(int(_252)));
    float3 _1385 = select(_1383, float3(0.0), isnan(_1383));
    float _286 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1385.xy, uint(rint(_1385.z)), _258);
    float3 _1394 = float3(_276, _278, float(int(_252)));
    float3 _1396 = select(_1394, float3(0.0), isnan(_1394));
    float _288 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1396.xy, uint(rint(_1396.z)), _258);
    float3 _1405 = float3(_272, _280, float(int(_252)));
    float3 _1407 = select(_1405, float3(0.0), isnan(_1405));
    float _290 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1407.xy, uint(rint(_1407.z)), _258);
    float3 _1416 = float3(_268, _280, float(int(_252)));
    float3 _1418 = select(_1416, float3(0.0), isnan(_1416));
    float _292 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1418.xy, uint(rint(_1418.z)), _258);
    float _294 = _284 + _282;
    float _296 = _294 + _286;
    float _298 = _296 + _288;
    float _300 = _298 + _290;
    float _302 = _300 + _292;
    float _304 = fma(_270, -0.5, _262);
    float3 _1445 = float3(_274, _280, float(int(_252)));
    float3 _1447 = select(_1445, float3(0.0), isnan(_1445));
    float _306 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1447.xy, uint(rint(_1447.z)), _258);
    float3 _1456 = float3(_276, _280, float(int(_252)));
    float3 _1458 = select(_1456, float3(0.0), isnan(_1456));
    float _308 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1458.xy, uint(rint(_1458.z)), _258);
    float3 _1467 = float3(_272, _304, float(int(_252)));
    float3 _1469 = select(_1467, float3(0.0), isnan(_1467));
    float _310 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1469.xy, uint(rint(_1469.z)), _258);
    float3 _1478 = float3(_268, _304, float(int(_252)));
    float3 _1480 = select(_1478, float3(0.0), isnan(_1478));
    float _312 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1480.xy, uint(rint(_1480.z)), _258);
    float3 _1489 = float3(_274, _304, float(int(_252)));
    float3 _1491 = select(_1489, float3(0.0), isnan(_1489));
    float _314 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1491.xy, uint(rint(_1491.z)), _258);
    float3 _1500 = float3(_276, _304, float(int(_252)));
    float3 _1502 = select(_1500, float3(0.0), isnan(_1500));
    float _316 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1502.xy, uint(rint(_1502.z)), _258);
    float _318 = fma(_270, -1.5, _262);
    float _320 = -_120;
    float _322 = _320 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _324 = -_70;
    float _326 = _324 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _328 = _322 * _322;
    float _330 = fma(_326, _326, _328);
    float _332 = -_68;
    float _334 = _332 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _336 = fma(_334, _334, _330);
    float _338 = sqrt(_336);
    bool _340 = _338 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    bool _342 = _338 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    bool _344 = !_340;
    int _346 = _344 ? 0 : 1;
    int _348 = 2;
    if (!_340)
    {
        _348 = 1;
    }
    int _350 = _348;
    int _352 = _350;
    if (!_342)
    {
        _352 = _346;
    }
    int _354 = _352;
    float _356 = _120 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _358 = float(_354);
    float _360 = _120 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _362 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[19].x, _356);
    float _364 = _120 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _366 = precise::min(_358, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _368 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[22].x, _360);
    float _370 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[19].z, _362);
    float _372 = _120 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    bool _374 = _366 != 1.0;
    bool _376 = isnan(_366);
    bool _378 = _374 || _376;
    bool _380 = isnan(1.0);
    bool _382 = _378 || _380;
    float _384 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[22].z, _368);
    float _386 = _370 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float _388 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[23].x, _372);
    float _390 = _120 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    float _392 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[23].z, _388);
    float _394 = _386;
    if (_382)
    {
        float _396 = _384 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _394 = _396;
    }
    float _398 = _394;
    float _400 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[20].x, _364);
    float _402 = _120 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _404 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[20].z, _400);
    float _406 = _404 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _408 = _406;
    float _410 = _398;
    if (_382)
    {
        float _412 = _392 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _408 = _412;
    }
    float _414 = _408;
    float _416 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[24].x, _390);
    float _418 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[21].x, _402);
    float3 _1698 = float3(_272, _318, float(int(_252)));
    float3 _1700 = select(_1698, float3(0.0), isnan(_1698));
    float _420 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1700.xy, uint(rint(_1700.z)), _258);
    float _422 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[24].z, _416);
    float _424 = _120 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _426 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[21].z, _418);
    float _428 = _426 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _430 = _428;
    float _432 = _414;
    if (_382)
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
    float _448 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[16].x, _424);
    float _450 = _120 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _452 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[16].z, _448);
    float _454 = _436;
    if (!_446)
    {
        float _456 = _452 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _410 = _456;
    }
    float _458 = _410;
    float _460 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[17].x, _450);
    float _462 = _120 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _464 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[17].z, _460);
    if (!_446)
    {
        float _466 = _464 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _432 = _466;
    }
    float _468 = _432;
    float _470 = _302 + _306;
    float _472 = _470 + _308;
    float _474 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[18].x, _462);
    float _476 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].z;
    float _478 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].w;
    float _480 = _472 + _310;
    float _482 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[18].z, _474);
    float _484 = rint(_366);
    float _486 = precise::max(_484, 0.0);
    uint _488 = uint(_486);
    uint _490 = clamp(_488, 0u, 65535u);
    float _492 = _480 + _312;
    if (!_446)
    {
        float _494 = _482 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _454 = _494;
    }
    float _496 = _454;
    float _498 = _492 + _314;
    float _500 = 0.0 + _496;
    float _502 = precise::clamp(_500, 0.0, 1.0);
    float _504 = _502 * _478;
    float3 _1861 = float3(_268, _318, float(int(_252)));
    float3 _1863 = select(_1861, float3(0.0), isnan(_1861));
    float _506 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1863.xy, uint(rint(_1863.z)), _258);
    float3 _1872 = float3(_274, _318, float(int(_252)));
    float3 _1874 = select(_1872, float3(0.0), isnan(_1872));
    float _508 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1874.xy, uint(rint(_1874.z)), _258);
    float3 _1883 = float3(_276, _318, float(int(_252)));
    float3 _1885 = select(_1883, float3(0.0), isnan(_1883));
    float _510 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1885.xy, uint(rint(_1885.z)), _258);
    float _512 = _502 * _476;
    float _514 = fma(_504, 1.5, _468);
    float _516 = fma(_512, 0.5, _458);
    float _518 = fma(_512, -0.5, _458);
    float3 _1906 = float3(_516, _514, float(int(_490)));
    float3 _1908 = select(_1906, float3(0.0), isnan(_1906));
    float _520 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1908.xy, uint(rint(_1908.z)), _502);
    float3 _1917 = float3(_518, _514, float(int(_490)));
    float3 _1919 = select(_1917, float3(0.0), isnan(_1917));
    float _522 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1919.xy, uint(rint(_1919.z)), _502);
    float _524 = _498 + _316;
    float _526 = fma(_504, 0.5, _468);
    float _528 = fma(_512, -1.5, _458);
    float _530 = _524 + _420;
    float _532 = _530 + _506;
    float _534 = fma(_512, 1.5, _458);
    float _536 = _532 + _508;
    float3 _1949 = float3(_528, _514, float(int(_490)));
    float3 _1951 = select(_1949, float3(0.0), isnan(_1949));
    float _538 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1951.xy, uint(rint(_1951.z)), _502);
    float3 _1960 = float3(_534, _514, float(int(_490)));
    float3 _1962 = select(_1960, float3(0.0), isnan(_1960));
    float _540 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1962.xy, uint(rint(_1962.z)), _502);
    float3 _1971 = float3(_534, _526, float(int(_490)));
    float3 _1973 = select(_1971, float3(0.0), isnan(_1971));
    float _542 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1973.xy, uint(rint(_1973.z)), _502);
    float3 _1982 = float3(_516, _526, float(int(_490)));
    float3 _1984 = select(_1982, float3(0.0), isnan(_1982));
    float _544 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1984.xy, uint(rint(_1984.z)), _502);
    float3 _1993 = float3(_518, _526, float(int(_490)));
    float3 _1995 = select(_1993, float3(0.0), isnan(_1993));
    float _546 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1995.xy, uint(rint(_1995.z)), _502);
    float3 _2004 = float3(_528, _526, float(int(_490)));
    float3 _2006 = select(_2004, float3(0.0), isnan(_2004));
    float _548 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2006.xy, uint(rint(_2006.z)), _502);
    float _550 = _536 + _510;
    float _552 = fma(_504, -0.5, _468);
    float _554 = fma(_504, -1.5, _468);
    float3 _2024 = float3(_534, _552, float(int(_490)));
    float3 _2026 = select(_2024, float3(0.0), isnan(_2024));
    float _556 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2026.xy, uint(rint(_2026.z)), _502);
    float _558 = _540 + _520;
    float _560 = _558 + _522;
    float _562 = _560 + _538;
    float _564 = _562 + _542;
    float _566 = _564 + _544;
    float _568 = _566 + _546;
    float3 _2053 = float3(_516, _552, float(int(_490)));
    float3 _2055 = select(_2053, float3(0.0), isnan(_2053));
    float _570 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2055.xy, uint(rint(_2055.z)), _502);
    float3 _2064 = float3(_518, _552, float(int(_490)));
    float3 _2066 = select(_2064, float3(0.0), isnan(_2064));
    float _572 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2066.xy, uint(rint(_2066.z)), _502);
    float3 _2075 = float3(_528, _552, float(int(_490)));
    float3 _2077 = select(_2075, float3(0.0), isnan(_2075));
    float _574 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2077.xy, uint(rint(_2077.z)), _502);
    float3 _2086 = float3(_534, _554, float(int(_490)));
    float3 _2088 = select(_2086, float3(0.0), isnan(_2086));
    float _576 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2088.xy, uint(rint(_2088.z)), _502);
    float3 _2097 = float3(_516, _554, float(int(_490)));
    float3 _2099 = select(_2097, float3(0.0), isnan(_2097));
    float _578 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2099.xy, uint(rint(_2099.z)), _502);
    float _580 = _120 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _582 = _568 + _548;
    float _584 = _120 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _586 = _120 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _588 = _120 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _590 = _120 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _592 = _582 + _556;
    float _594 = _120 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _596 = -_120;
    float _598 = _596 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _600 = _120 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _602 = _120 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _604 = _120 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _606 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[29].x, _580);
    float _608 = -_70;
    float _610 = _608 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _612 = _598 * _598;
    float _614 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[28].x, _584);
    float _616 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[25].x, _586);
    float _618 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[26].x, _588);
    float _620 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[27].x, _590);
    float _622 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[30].x, _604);
    float _624 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[31].x, _600);
    float _626 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[32].x, _594);
    float _628 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[33].x, _602);
    float _630 = fma(_610, _610, _612);
    float _632 = -_68;
    float _634 = _632 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _636 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[28].z, _614);
    float _638 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[29].z, _606);
    float _640 = fma(_634, _634, _630);
    float _642 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[30].z, _622);
    float _644 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[31].z, _624);
    float _646 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[32].z, _626);
    float _648 = _638 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    float _650 = _642 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _652 = sqrt(_640);
    float _654 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[25].z, _616);
    float _656 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[27].z, _620);
    float _658 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[26].z, _618);
    bool _660 = _652 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    bool _662 = _652 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    bool _664 = !_660;
    int _666 = _664 ? 0 : 1;
    int _668 = 2;
    float _670 = _648;
    float _672 = _650;
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
    float _680 = float(_678);
    float _682 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[33].z, _628);
    float _684 = _636 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _686 = precise::min(_680, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    bool _688 = _686 != 1.0;
    bool _690 = isnan(_686);
    bool _692 = _688 || _690;
    bool _694 = isnan(1.0);
    bool _696 = _692 || _694;
    float _698 = _684;
    if (_696)
    {
        float _700 = _644 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _698 = _700;
    }
    float _702 = _698;
    float _704 = _702;
    if (_696)
    {
        float _706 = _646 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _670 = _706;
    }
    float _708 = _670;
    float _710 = _708;
    if (_696)
    {
        float _712 = _682 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _672 = _712;
    }
    float _714 = _672;
    bool _716 = _686 != 0.0;
    bool _718 = isnan(_686);
    bool _720 = _716 || _718;
    bool _722 = isnan(0.0);
    bool _724 = _720 || _722;
    float _726 = _714;
    if (!_724)
    {
        float _728 = _654 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _704 = _728;
    }
    float _730 = _704;
    if (!_724)
    {
        float _732 = _656 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _726 = _732;
    }
    float _734 = _726;
    float _736 = rint(_686);
    float _738 = precise::max(_736, 0.0);
    uint _740 = uint(_738);
    uint _742 = clamp(_740, 0u, 65535u);
    if (!_724)
    {
        float _744 = _658 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _710 = _744;
    }
    float _746 = _710;
    float _748 = 0.0 + _734;
    float _750 = precise::clamp(_748, 0.0, 1.0);
    float _752 = _476 * _750;
    float _754 = _478 * _750;
    float _756 = fma(_752, 0.5, _730);
    float _758 = fma(_754, 1.5, _746);
    float _760 = fma(_752, 1.5, _730);
    float _762 = fma(_754, 0.5, _746);
    float _764 = _592 + _570;
    float _766 = _764 + _572;
    float _768 = _766 + _574;
    float3 _2447 = float3(_518, _554, float(int(_490)));
    float3 _2449 = select(_2447, float3(0.0), isnan(_2447));
    float _770 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2449.xy, uint(rint(_2449.z)), _502);
    float3 _2458 = float3(_528, _554, float(int(_490)));
    float3 _2460 = select(_2458, float3(0.0), isnan(_2458));
    float _772 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2460.xy, uint(rint(_2460.z)), _502);
    float3 _2469 = float3(_756, _758, float(int(_742)));
    float3 _2471 = select(_2469, float3(0.0), isnan(_2469));
    float _774 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2471.xy, uint(rint(_2471.z)), _750);
    float3 _2480 = float3(_760, _758, float(int(_742)));
    float3 _2482 = select(_2480, float3(0.0), isnan(_2480));
    float _776 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2482.xy, uint(rint(_2482.z)), _750);
    float3 _2491 = float3(_756, _762, float(int(_742)));
    float3 _2493 = select(_2491, float3(0.0), isnan(_2491));
    float _778 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2493.xy, uint(rint(_2493.z)), _750);
    float _780 = fma(_752, -0.5, _730);
    float _782 = fma(_752, -1.5, _730);
    float3 _2508 = float3(_780, _758, float(int(_742)));
    float3 _2510 = select(_2508, float3(0.0), isnan(_2508));
    float _784 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2510.xy, uint(rint(_2510.z)), _750);
    float3 _2519 = float3(_782, _758, float(int(_742)));
    float3 _2521 = select(_2519, float3(0.0), isnan(_2519));
    float _786 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2521.xy, uint(rint(_2521.z)), _750);
    float3 _2530 = float3(_760, _762, float(int(_742)));
    float3 _2532 = select(_2530, float3(0.0), isnan(_2530));
    float _788 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2532.xy, uint(rint(_2532.z)), _750);
    float3 _2541 = float3(_780, _762, float(int(_742)));
    float3 _2543 = select(_2541, float3(0.0), isnan(_2541));
    float _790 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2543.xy, uint(rint(_2543.z)), _750);
    float3 _2552 = float3(_782, _762, float(int(_742)));
    float3 _2554 = select(_2552, float3(0.0), isnan(_2552));
    float _792 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2554.xy, uint(rint(_2554.z)), _750);
    float _794 = fma(_754, -1.5, _746);
    float _796 = fma(_754, -0.5, _746);
    float3 _2569 = float3(_756, _796, float(int(_742)));
    float3 _2571 = select(_2569, float3(0.0), isnan(_2569));
    float _798 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2571.xy, uint(rint(_2571.z)), _750);
    float3 _2580 = float3(_780, _796, float(int(_742)));
    float3 _2582 = select(_2580, float3(0.0), isnan(_2580));
    float _800 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2582.xy, uint(rint(_2582.z)), _750);
    float3 _2591 = float3(_760, _796, float(int(_742)));
    float3 _2593 = select(_2591, float3(0.0), isnan(_2591));
    float _802 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2593.xy, uint(rint(_2593.z)), _750);
    float3 _2602 = float3(_782, _796, float(int(_742)));
    float3 _2604 = select(_2602, float3(0.0), isnan(_2602));
    float _804 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2604.xy, uint(rint(_2604.z)), _750);
    float3 _2613 = float3(_760, _794, float(int(_742)));
    float3 _2615 = select(_2613, float3(0.0), isnan(_2613));
    float _806 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2615.xy, uint(rint(_2615.z)), _750);
    float3 _2624 = float3(_756, _794, float(int(_742)));
    float3 _2626 = select(_2624, float3(0.0), isnan(_2624));
    float _808 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2626.xy, uint(rint(_2626.z)), _750);
    float3 _2635 = float3(_780, _794, float(int(_742)));
    float3 _2637 = select(_2635, float3(0.0), isnan(_2635));
    float _810 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2637.xy, uint(rint(_2637.z)), _750);
    float3 _2646 = float3(_782, _794, float(int(_742)));
    float3 _2648 = select(_2646, float3(0.0), isnan(_2646));
    float _812 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2648.xy, uint(rint(_2648.z)), _750);
    float2 _2654 = float2(_52, _54);
    float _814 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_2654, float2(0.0), isnan(_2654))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_2654, float2(0.0), isnan(_2654))).x;
    float _816 = _768 + _576;
    float _818 = -_68;
    float _820 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _822 = _818 + _820;
    float _824 = -_68;
    float _826 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _828 = _824 + _826;
    float _830 = _816 + _578;
    float _832 = _822 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _834 = precise::clamp(_832, 0.0, 1.0);
    float _836 = fma(_550, 0.0625, _834);
    float _838 = _830 + _770;
    float _840 = _776 + _774;
    float _842 = _838 + _772;
    float _844 = _840 + _784;
    float _846 = _844 + _786;
    float _848 = _846 + _788;
    float _850 = _848 + _778;
    float _852 = _850 + _790;
    float _854 = _852 + _792;
    float _856 = _854 + _802;
    float _858 = _856 + _798;
    float _860 = _858 + _800;
    float _862 = _860 + _804;
    float _864 = _862 + _806;
    float _866 = _864 + _808;
    float _868 = _866 + _810;
    float _870 = _868 + _812;
    float _872 = _870 * 0.0625;
    float _874 = _842 * 0.0625;
    float _876 = _872 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _878 = fma(_874, (*spvDescriptorSet0.fp_c3)._m0[49].z, _876);
    float _880 = _828 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _882 = precise::clamp(_880, 0.0, 1.0);
    float _884 = _878 + _882;
    out.m_45.x = _814;
    out.m_45.y = _836;
    out.m_45.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_45.w = _884;
    return out;
}

