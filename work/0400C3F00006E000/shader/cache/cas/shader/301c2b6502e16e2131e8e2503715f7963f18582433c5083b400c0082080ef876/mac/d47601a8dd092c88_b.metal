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
    texture2d_array<float> fp_t_tcb_10 [[id(8)]];
    sampler fp_t_tcb_10Smplr [[id(9)]];
    texture2d_array<float> fp_t_tcb_12 [[id(10)]];
    sampler fp_t_tcb_12Smplr [[id(11)]];
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
    bool _130 = false;
    bool _128 = false;
    float _54 = in.m_42.x;
    float _56 = in.m_42.y;
    float2 _748 = float2(_54, _56);
    float _58 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_748, float2(0.0), isnan(_748))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_748, float2(0.0), isnan(_748))).x;
    float _60 = in.m_44.y;
    float _62 = -_58;
    float _64 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _66 = 1.0 / _64;
    float _68 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _70 = _66 * _68;
    float _72 = _70 * _60;
    float _74 = -_70;
    bool _78 = _74 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _80 = -_70;
    bool _82 = _80 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    float _84 = -_70;
    bool _86 = _84 > (*spvDescriptorSet0.fp_c3)._m0[41].x;
    bool _88 = !_78;
    int _91 = _88 ? 0 : 1;
    int _93 = 2;
    if (!_78)
    {
        _93 = 1;
    }
    int _95 = _93;
    int _97 = _95;
    if (!_82)
    {
        _97 = _91;
    }
    int _99 = _97;
    int _101 = _99 + 1;
    uint _104 = uint(_101);
    if (!_86)
    {
        _104 = uint(_99);
    }
    uint _106 = _104;
    uint _108 = min(_106, 2u);
    int _110 = int(_108) << 2;
    float _112 = in.m_44.x;
    uint _114 = uint(int(uint(_110) >> uint(2)));
    uint _116 = uint(int(uint(int(_114)) >> uint(2)));
    int _118 = int(_114) & 3;
    float _120 = (*spvDescriptorSet0.fp_c1)._m0[int(_116)][_118];
    float _122 = _70 * _112;
    bool _124 = as_type<int>(_120) == 416;
    if (!_124)
    {
        bool _126 = as_type<int>(_120) == 688;
        _128 = _126;
        if (!_128)
        {
            _130 = true;
        }
    }
    float _164;
    float _166;
    float _168;
    float _170;
    if (!_128)
    {
        if (!_130)
        {
            float _132 = _72 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _134 = _72 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _136 = _72 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _138 = _72 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _140 = fma(_122, (*spvDescriptorSet0.fp_c3)._m0[0].x, _132);
            float _142 = fma(_122, (*spvDescriptorSet0.fp_c3)._m0[1].x, _134);
            float _144 = fma(_122, (*spvDescriptorSet0.fp_c3)._m0[2].x, _136);
            float _146 = fma(_122, (*spvDescriptorSet0.fp_c3)._m0[3].x, _138);
            float _148 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[0].z, _140);
            float _150 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[1].z, _142);
            float _152 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[2].z, _144);
            float _154 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[3].z, _146);
            float _156 = _148 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _158 = _150 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _160 = _152 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _162 = _154 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _164 = _162;
            _166 = _160;
            _168 = _156;
            _170 = _158;
        }
    }
    if ((false || _130) || _128)
    {
        if ((!_130) || _128)
        {
            _128 = false;
            float _172 = _72 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _174 = _72 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _176 = _72 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _178 = _72 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _180 = fma(_122, (*spvDescriptorSet0.fp_c3)._m0[4].x, _172);
            float _182 = fma(_122, (*spvDescriptorSet0.fp_c3)._m0[5].x, _174);
            float _184 = fma(_122, (*spvDescriptorSet0.fp_c3)._m0[6].x, _176);
            float _186 = fma(_122, (*spvDescriptorSet0.fp_c3)._m0[7].x, _178);
            float _188 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[4].z, _180);
            float _190 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[5].z, _182);
            float _192 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[6].z, _184);
            float _194 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[7].z, _186);
            float _196 = _188 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _198 = _190 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _200 = _192 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _202 = _194 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _164 = _202;
            _166 = _200;
            _168 = _196;
            _170 = _198;
        }
        if (false || _130)
        {
            _130 = false;
            float _204 = _72 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _206 = _72 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _208 = _72 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _210 = _72 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _212 = fma(_122, (*spvDescriptorSet0.fp_c3)._m0[8].x, _204);
            float _214 = fma(_122, (*spvDescriptorSet0.fp_c3)._m0[9].x, _206);
            float _216 = fma(_122, (*spvDescriptorSet0.fp_c3)._m0[10].x, _208);
            float _218 = fma(_122, (*spvDescriptorSet0.fp_c3)._m0[11].x, _210);
            float _220 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[8].z, _212);
            float _222 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[9].z, _214);
            float _224 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[10].z, _216);
            float _226 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[11].z, _218);
            float _228 = _220 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _230 = _222 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _232 = _224 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _234 = _226 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _164 = _234;
            _166 = _232;
            _168 = _228;
            _170 = _230;
        }
    }
    float _236 = _164;
    float _238 = _166;
    float _240 = _168;
    float _242 = _170;
    float _244 = _72 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _246 = -_72;
    float _248 = _246 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _250 = -_72;
    float _252 = _250 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _254 = -_122;
    float _256 = _254 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _258 = fma(_122, (*spvDescriptorSet0.fp_c3)._m0[21].x, _244);
    float _260 = _248 * _248;
    float2 _1173 = float2(_54, _56);
    float2 _264 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1173, float2(0.0), isnan(_1173))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1173, float2(0.0), isnan(_1173))).xy;
    float _266 = _264.x;
    float _268 = _264.y;
    float _270 = -_122;
    float _272 = _270 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _274 = _252 * _252;
    float _276 = fma(_256, _256, _260);
    float _278 = -_70;
    float _280 = _278 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _282 = 1.0 / _236;
    float _284 = fma(_272, _272, _274);
    float _286 = -_70;
    float _288 = _286 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _290 = fma(_280, _280, _276);
    float _292 = float(int(_106));
    float _294 = _72 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _296 = fma(_288, _288, _284);
    float _298 = _72 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _300 = _72 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _302 = sqrt(_290);
    float _304 = _72 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _306 = _72 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    float _308 = _72 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _310 = _72 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _312 = _72 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _314 = _72 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _316 = _72 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _318 = sqrt(_296);
    float _320 = _72 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _322 = _72 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _324 = _72 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _326 = _72 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _328 = _72 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _330 = _72 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _332 = _72 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _334 = rint(_292);
    float _336 = precise::max(_334, 0.0);
    uint _338 = uint(_336);
    uint _340 = clamp(_338, 0u, 65535u);
    bool _342 = _302 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _344 = _282 * _238;
    float _346 = precise::clamp(_344, 0.0, 1.0);
    bool _348 = _302 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _350 = fma(_122, (*spvDescriptorSet0.fp_c3)._m0[19].x, _294);
    float _352 = fma(_122, (*spvDescriptorSet0.fp_c3)._m0[22].x, _298);
    float _354 = fma(_122, (*spvDescriptorSet0.fp_c3)._m0[20].x, _300);
    bool _356 = _318 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _358 = fma(_122, (*spvDescriptorSet0.fp_c3)._m0[23].x, _304);
    bool _360 = _318 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _362 = fma(_122, (*spvDescriptorSet0.fp_c3)._m0[24].x, _306);
    float _364 = fma(_122, (*spvDescriptorSet0.fp_c3)._m0[16].x, _308);
    float _366 = fma(_122, (*spvDescriptorSet0.fp_c3)._m0[17].x, _310);
    float _368 = fma(_122, (*spvDescriptorSet0.fp_c3)._m0[18].x, _312);
    float _370 = fma(_122, (*spvDescriptorSet0.fp_c3)._m0[25].x, _314);
    float _372 = fma(_122, (*spvDescriptorSet0.fp_c3)._m0[26].x, _316);
    float _374 = fma(_122, (*spvDescriptorSet0.fp_c3)._m0[27].x, _320);
    float _376 = fma(_122, (*spvDescriptorSet0.fp_c3)._m0[28].x, _322);
    float _378 = fma(_122, (*spvDescriptorSet0.fp_c3)._m0[29].x, _324);
    float _380 = fma(_122, (*spvDescriptorSet0.fp_c3)._m0[30].x, _326);
    float _382 = fma(_122, (*spvDescriptorSet0.fp_c3)._m0[31].x, _328);
    float _384 = fma(_122, (*spvDescriptorSet0.fp_c3)._m0[32].x, _330);
    float _386 = fma(_122, (*spvDescriptorSet0.fp_c3)._m0[33].x, _332);
    float _388 = (*spvDescriptorSet0.fp_c3)._m0[47].x * _346;
    float _390 = _282 * _240;
    float _392 = _282 * _242;
    bool _394 = !_356;
    int _396 = _394 ? 0 : 1;
    float _398 = _388 * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    bool _400 = !_342;
    int _402 = _400 ? 0 : 1;
    float _404 = _388 * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _406 = fma(_398, -0.5, _390);
    float _408 = fma(_404, 0.5, _392);
    int _410 = 2;
    int _412 = 2;
    if (!_356)
    {
        _410 = 1;
    }
    int _414 = _410;
    int _416 = _414;
    if (!_342)
    {
        _412 = 1;
    }
    int _418 = _412;
    int _420 = _418;
    if (!_360)
    {
        _416 = _396;
    }
    int _422 = _416;
    if (!_348)
    {
        _420 = _402;
    }
    int _424 = _420;
    float3 _1498 = float3(_406, _408, float(int(_340)));
    float3 _1502 = select(_1498, float3(0.0), isnan(_1498));
    float _426 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1502.xy, uint(rint(_1502.z)), _346);
    float _428 = float(_424);
    float _430 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[19].z, _350);
    float _432 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[20].z, _354);
    float _434 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[21].z, _258);
    float _436 = precise::min(_428, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _438 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[22].z, _352);
    float _440 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[23].z, _358);
    float _442 = float(_422);
    float _444 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[24].z, _362);
    bool _446 = _436 != 1.0;
    bool _448 = isnan(_436);
    bool _450 = _446 || _448;
    bool _452 = isnan(1.0);
    bool _454 = _450 || _452;
    float _456 = _430 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float _458 = _432 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _460 = _434 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _462 = precise::min(_442, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _464 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[18].z, _368);
    float _466 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[30].z, _380);
    float _468 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[33].z, _386);
    bool _470 = _462 != 1.0;
    bool _472 = isnan(_462);
    bool _474 = _470 || _472;
    bool _476 = isnan(1.0);
    bool _478 = _474 || _476;
    float _480 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[16].z, _364);
    bool _482 = _462 != 0.0;
    bool _484 = isnan(_462);
    bool _486 = _482 || _484;
    bool _488 = isnan(0.0);
    bool _490 = _486 || _488;
    float _492 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[27].z, _374);
    float _494 = _466 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _496 = _456;
    float _498 = _458;
    float _500 = _460;
    float _502 = _494;
    if (_454)
    {
        float _504 = _438 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _496 = _504;
    }
    float _506 = _496;
    float _508 = _506;
    if (_454)
    {
        float _510 = _440 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _498 = _510;
    }
    float _512 = _498;
    float _514 = _512;
    if (_454)
    {
        float _516 = _444 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _500 = _516;
    }
    float _518 = _500;
    bool _520 = _436 != 0.0;
    bool _522 = isnan(_436);
    bool _524 = _520 || _522;
    bool _526 = isnan(0.0);
    bool _528 = _524 || _526;
    float _530 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[17].z, _366);
    float _532 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[29].z, _378);
    float _534 = fma(_398, 0.5, _390);
    float _536 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[28].z, _376);
    float _538 = _518;
    if (_478)
    {
        float _540 = _468 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _502 = _540;
    }
    float _542 = _502;
    float _544 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].z;
    float _546 = _542;
    if (!_490)
    {
        float _548 = _492 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _546 = _548;
    }
    float _550 = _546;
    float _552 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[32].z, _384);
    float _554 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].w;
    float _556 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[31].z, _382);
    float _558 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[26].z, _372);
    float _560 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[25].z, _370);
    if (!_528)
    {
        float _562 = _464 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _538 = _562;
    }
    float _564 = _538;
    if (!_528)
    {
        float _566 = _480 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _508 = _566;
    }
    float _568 = _508;
    if (!_528)
    {
        float _570 = _530 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _514 = _570;
    }
    float _572 = _514;
    float _574 = 0.0 + _550;
    float _576 = precise::clamp(_574, 0.0, 1.0);
    float _578 = 0.0 + _564;
    float _580 = precise::clamp(_578, 0.0, 1.0);
    float _582 = _532 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    float _584 = _536 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _586 = _582;
    float _588 = _584;
    if (_478)
    {
        float _590 = _552 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _586 = _590;
    }
    float _592 = _586;
    float _594 = _580 * _544;
    float _596 = _580 * _554;
    float _598 = _592;
    if (_478)
    {
        float _600 = _556 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _588 = _600;
    }
    float _602 = _588;
    float _604 = _602;
    if (!_490)
    {
        float _606 = _558 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _598 = _606;
    }
    float _608 = _598;
    float _610 = fma(_404, -0.5, _392);
    if (!_490)
    {
        float _612 = _560 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _604 = _612;
    }
    float _614 = _604;
    float _616 = fma(_594, 0.5, _568);
    float _618 = _544 * _576;
    float _620 = fma(_594, -0.5, _568);
    float _622 = fma(_596, 0.5, _572);
    float _624 = fma(_596, -0.5, _572);
    float _626 = fma(_618, 0.5, _614);
    float _628 = fma(_618, -0.5, _614);
    float _630 = rint(_436);
    float _632 = precise::max(_630, 0.0);
    uint _634 = uint(_632);
    uint _636 = clamp(_634, 0u, 65535u);
    float _638 = _554 * _576;
    float _640 = rint(_462);
    float _642 = precise::max(_640, 0.0);
    uint _644 = uint(_642);
    uint _646 = clamp(_644, 0u, 65535u);
    float _648 = fma(_638, 0.5, _608);
    float _650 = fma(_638, -0.5, _608);
    float3 _1883 = float3(_534, _408, float(int(_340)));
    float3 _1885 = select(_1883, float3(0.0), isnan(_1883));
    float _652 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1885.xy, uint(rint(_1885.z)), _346);
    float _654 = fma(_266, 2.0, -1.0);
    float _656 = fma(_268, 2.0, -1.0);
    float _658 = _654 * (*spvDescriptorSet0.fp_c3)._m0[36].z;
    float _660 = _656 * (*spvDescriptorSet0.fp_c3)._m0[36].w;
    float _662 = fma(_658, 2.0, _54);
    float _664 = fma(_660, 2.0, _56);
    float3 _1915 = float3(_534, _610, float(int(_340)));
    float3 _1917 = select(_1915, float3(0.0), isnan(_1915));
    float _666 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1917.xy, uint(rint(_1917.z)), _346);
    float3 _1926 = float3(_406, _610, float(int(_340)));
    float3 _1928 = select(_1926, float3(0.0), isnan(_1926));
    float _668 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1928.xy, uint(rint(_1928.z)), _346);
    float3 _1937 = float3(_620, _622, float(int(_636)));
    float3 _1939 = select(_1937, float3(0.0), isnan(_1937));
    float _670 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1939.xy, uint(rint(_1939.z)), _580);
    float3 _1948 = float3(_616, _622, float(int(_636)));
    float3 _1950 = select(_1948, float3(0.0), isnan(_1948));
    float _672 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1950.xy, uint(rint(_1950.z)), _580);
    float3 _1959 = float3(_616, _624, float(int(_636)));
    float3 _1961 = select(_1959, float3(0.0), isnan(_1959));
    float _674 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1961.xy, uint(rint(_1961.z)), _580);
    float3 _1970 = float3(_628, _648, float(int(_646)));
    float3 _1972 = select(_1970, float3(0.0), isnan(_1970));
    float _676 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _1972.xy, uint(rint(_1972.z)), _576);
    float3 _1981 = float3(_626, _648, float(int(_646)));
    float3 _1983 = select(_1981, float3(0.0), isnan(_1981));
    float _678 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _1983.xy, uint(rint(_1983.z)), _576);
    float3 _1992 = float3(_626, _650, float(int(_646)));
    float3 _1994 = select(_1992, float3(0.0), isnan(_1992));
    float _680 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _1994.xy, uint(rint(_1994.z)), _576);
    float3 _2003 = float3(_620, _624, float(int(_636)));
    float3 _2005 = select(_2003, float3(0.0), isnan(_2003));
    float _682 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2005.xy, uint(rint(_2005.z)), _580);
    float3 _2014 = float3(_628, _650, float(int(_646)));
    float3 _2016 = select(_2014, float3(0.0), isnan(_2014));
    float _684 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2016.xy, uint(rint(_2016.z)), _576);
    float2 _2022 = float2(_662, _664);
    float _686 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_2022, float2(0.0), isnan(_2022))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_2022, float2(0.0), isnan(_2022))).x;
    float _688 = -_70;
    float _690 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _692 = _688 + _690;
    float _694 = -_70;
    float _696 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _698 = _694 + _696;
    float _700 = _692 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _702 = precise::clamp(_700, 0.0, 1.0);
    float _704 = _652 + _426;
    float _706 = _704 + _666;
    float _708 = _672 + _670;
    float _710 = _706 + _668;
    float _712 = _678 + _676;
    float _714 = _708 + _674;
    float _716 = fma(_710, 0.25, _702);
    float _718 = _712 + _680;
    float _720 = _714 + _682;
    float _722 = _718 + _684;
    float _724 = _720 * 0.25;
    float _726 = _722 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _728 = _726 * 0.25;
    float _730 = fma(_724, (*spvDescriptorSet0.fp_c3)._m0[49].z, _728);
    float _732 = _698 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _734 = precise::clamp(_732, 0.0, 1.0);
    float _736 = _730 + _734;
    out.m_47.x = _686;
    out.m_47.y = _716;
    out.m_47.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_47.w = _736;
    return out;
}

